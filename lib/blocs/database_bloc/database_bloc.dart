import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kitty_app/models/balance_model/balance_model.dart';
import 'package:kitty_app/models/expense_category_model/transactions_categories_models.dart';
import 'package:kitty_app/models/expenses_model/transaction_model.dart';
import 'package:kitty_app/models/icon_model/icon_model.dart';
import 'package:kitty_app/models/statistics_model/statistics_model.dart';
import 'package:kitty_app/repository/database_repository.dart';
import 'package:kitty_app/utils/helpers/helpers.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

part 'database_event.dart';

part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseBloc(this.dbRepo) : super(const DatabaseState()) {
    on<DatabaseInitialEvent>((event, emit) async {
      await _initial(emit);
      if (state.mapTransactions.isNotEmpty) {
        add(StatisticInitialEvent());
      }
      add(CategoriesForSearchEvent());
    });
    on<HomeScreenInitialEvent>((event, emit) async {
      final transactions = await dbRepo.getAllTransaction();
      emit(state.copyWith(
        transaction: transactions,
        mapTransactions: groupByTimeStampHelper(transactions),
        selectedCategories: [],
        searchedValue: '',
      ));
    });
    on<DeleteDataBaseEvent>((event, emit) async {
      final dbDirectory = await getDatabasesPath();
      const dbName = 'kitty_app.db';
      final path = join(dbDirectory, dbName);
      databaseFactory.deleteDatabase(path);
    });

    on<DeleteTransactionEvent>((event, emit) async {
      await dbRepo.deleteEntry(event.transactionId);
      add(DatabaseInitialEvent());
    });
    on<StatisticInitialEvent>((event, emit) async {
      final statistics = await dbRepo.getStatistics(DateTime.now().month);
      emit(state.copyWith(statisticsModels: statistics));
    });
    on<SelectMonthEvent>((event, emit) async {
      await _calendarSwitch(command: event.screen, emit: emit, month: event.month);
    });
    on<IncDecMonthEvent>((event, emit) async {
      await _calendarArrowButton(screen: event.screen, command: event.command, emit: emit);
    });
    on<GetCategoryEvent>((event, emit) {
      emit(state.copyWith(createdCategory: event.transactionCategory));
    });
    on<ClearDatabaseEvent>((event, emit) {
      emit(state.copyWith(createdCategory: zeroCategory));
      emit(state.copyWith(selectedIcon: zeroIcon));
    });
    on<GetIconEvent>((event, emit) {
      emit(state.copyWith(selectedIcon: event.selectedIcon));
    });
    on<CreateCategoryEvent>((event, emit) async {
      await dbRepo.createCategory(categoryName: event.categoryName, iconId: state.selectedIcon!.iconId);
      add(DatabaseInitialEvent());
    });
    on<GetCreatedTransaction>((event, emit) async {
      await dbRepo.createTransaction(
        categoryId: state.createdCategory!.categoryId,
        amount: event.amount,
        description: event.description,
      );
      final transactions = await dbRepo.getAllTransaction();
      emit(state.copyWith(
        transaction: transactions,
        mapTransactions: groupByTimeStampHelper(transactions),
      ));
    });
    on<GetMonthTransactions>((event, emit) {
      emit(state.copyWith(mapTransactions: groupByTimeStampHelper(event.transactionsModels)));
    });
    on<CategoriesForSearchEvent>((event, emit) async {
      await _getSearchCategories(emit);
    });
    on<SaveHistoryElementEvent>((event, emit) async {
      await dbRepo.saveSearchValue(event.searchController);
    });
    on<CategorySearchSelectEvent>((event, emit) async {
      _selectedCategory(event.categoryId, emit);
      await _getSearchedTransactions(
        categoriesIds: state.selectedCategories,
        emit: emit,
        searchedValue: state.searchedValue,
      );
    });
    on<TransactionSearchEvent>((event, emit) async {
      await _getSearchedTransactions(categoriesIds: [], emit: emit, searchedValue: event.searchedValue);

      emit(state.copyWith(
        searchedValue: event.searchedValue,
      ));
    });
    on<DragCategoriesEvent>((event, emit) async {
      await _dragCategories(event.oldIndex, event.newIndex);
    });
    on<GetEditCategoryEvent>((event, emit) {
      print(event.editCategory.icon.pathToIcon);
      emit(state.copyWith(editCategory: event.editCategory));
    });
    on<EditCategoryEvent>((event, emit) async {
      await dbRepo.editCategory(
        categoryId: state.editCategory!.categoryId,
        iconId: event.editIcon.iconId,
        title: event.editTitle,
      );
      await _initial(emit);
    });
  }
  static const IconModel zeroIcon =
  IconModel(iconId: -1, color: '', pathToIcon: '');
  static const TransactionsCategoriesModel zeroCategory = TransactionsCategoriesModel(
      categoryId: -1, title: '', type: '', orderNum: -1, icon: zeroIcon);
  DatabaseRepo dbRepo;
  final List<int> selectedCategories = [];

  Future<void> _initial(Emitter emit) async {
    final transactions = await dbRepo.getAllTransaction();
    final categories = await dbRepo.getCategories();
    final icons = await dbRepo.getAllIcons();
    final balance = await dbRepo.monthBalance(
      thisDate: DateTime(DateTime.now().year, DateTime.now().month).millisecondsSinceEpoch,
      lastDate: DateTime(DateTime.now().year, DateTime.now().month + 1)
          .subtract(
            const Duration(days: 1),
          )
          .millisecondsSinceEpoch,
    );

    emit(state.copyWith(
      icons: icons,
      expensesCategories: categories.where((element) => element.type == 'Expenses').toList(),
      incomeCategories: categories.where((element) => element.type == 'Income').toList(),
      balance: balance,
      transaction: transactions,
      mapTransactions: groupByTimeStampHelper(transactions),
      activeMonth: DateTime.now().month,
      // statisticsModels: statistics,
    ));
  }

  Future<void> _calendarSwitch({required String command, required Emitter emit, required int month}) async {
    switch (command) {
      case 'home':
        final firstDate = DateTime(DateTime.now().year, month).millisecondsSinceEpoch;
        final lastDate = DateTime(
          DateTime.now().year,
          month + 1,
        ).subtract(const Duration(days: 1)).millisecondsSinceEpoch;
        final getRangeDate = await dbRepo.getRangeDateTransaction(firstDate: firstDate, lastDate: lastDate);
        emit(state.copyWith(
          activeMonth: month,
          mapTransactions: groupByTimeStampHelper(getRangeDate),
          balance: await dbRepo.monthBalance(thisDate: firstDate, lastDate: lastDate),
        ));
        break;
      case 'statistics':
        await _getStatistics(month, emit);
        emit(state.copyWith(activeMonth: month));
    }
  }

  Future<void> _calendarArrowButton({
    required String screen,
    required String command,
    required Emitter emit,
  }) async {
    switch (screen) {
      case 'home':
        switch (command) {
          case 'increment':
            final thisDate = DateTime(DateTime.now().year, state.activeMonth + 1).millisecondsSinceEpoch;
            final lastDate = DateTime(DateTime.now().year, state.activeMonth + 2)
                .subtract(const Duration(days: 1))
                .millisecondsSinceEpoch;
            final getRangeDate = await dbRepo.getRangeDateTransaction(firstDate: thisDate, lastDate: lastDate);
            emit(state.copyWith(
              activeMonth: state.activeMonth + 1,
              mapTransactions: groupByTimeStampHelper(getRangeDate),
              balance: await dbRepo.monthBalance(
                thisDate: thisDate,
                lastDate: lastDate,
              ),
            ));

            break;

          case 'decrement':
            final thisDate = DateTime(DateTime.now().year, state.activeMonth - 1).millisecondsSinceEpoch;
            final lastDate = DateTime(DateTime.now().year, state.activeMonth)
                .subtract(const Duration(days: 1))
                .millisecondsSinceEpoch;
            final getRangeDate = await dbRepo.getRangeDateTransaction(
              firstDate: thisDate,
              lastDate: lastDate,
            );
            emit(state.copyWith(
              activeMonth: state.activeMonth - 1,
              mapTransactions: groupByTimeStampHelper(getRangeDate),
              balance: await dbRepo.monthBalance(thisDate: thisDate, lastDate: lastDate),
            ));

            break;
        }
        break;
      case 'statistics':
        switch (command) {
          case 'increment':
            await _getStatistics(state.activeMonth + 1, emit);
            emit(state.copyWith(
              activeMonth: state.activeMonth + 1,
            ));
            break;
          case 'decrement':
            await _getStatistics(state.activeMonth - 1, emit);
            emit(state.copyWith(
              activeMonth: state.activeMonth - 1,
            ));
            break;
        }
    }
  }

  Future<void> _getStatistics(
    int month,
    Emitter emit,
  ) async {
    try {
      final statistics = await dbRepo.getStatistics(month);
      emit(state.copyWith(
        statisticsModels: statistics,
      ));
    } catch (e) {
      log('Empty month');
      emit(state.copyWith(
        statisticsModels: [],
      ));
    }
  }

  Future<void> _getSearchCategories(Emitter emit) async {
    final categoriesForSearch = await dbRepo.getUsedCategories();
    final historySearch = await dbRepo.getRecentSearchValues();

    emit(state.copyWith(
      categoriesForSearch: categoriesForSearch,
      searchHistory: historySearch,
    ));
    print(state.searchHistory.length);
  }

  void _selectedCategory(int categoryId, Emitter emit) {
    if (selectedCategories.contains(categoryId)) {
      selectedCategories.remove(categoryId);
    } else {
      selectedCategories.add(categoryId);
    }
    emit(state.copyWith(selectedCategories: selectedCategories));
  }

  Future<void> _getSearchedTransactions({
    required List<int> categoriesIds,
    required Emitter emit,
    required String searchedValue,
  }) async {
    final transactions = await dbRepo.getSearchedTransaction(categoriesIds, searchedValue);
    emit(state.copyWith(
      mapTransactions: groupByTimeStampHelper(transactions),
    ));
  }

  Future<void> _dragCategories(int oldIndex, int newIndex) async {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final firstElement = state.expensesCategories[oldIndex].orderNum,
        secondElement = state.expensesCategories[newIndex].orderNum;
    final item = state.expensesCategories.removeAt(oldIndex);
    state.expensesCategories.insert(newIndex, item);
    await dbRepo.dragCategories(firstElement, secondElement);
  }
}
