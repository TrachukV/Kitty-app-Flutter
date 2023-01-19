import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:kitty_app/database/local_database.dart';
import 'package:kitty_app/models/balance_model/balance_model.dart';
import 'package:kitty_app/models/expense_category_model/transactions_categories_models.dart';
import 'package:kitty_app/models/expenses_model/transaction_model.dart';
import 'package:kitty_app/models/icon_model/icon_model.dart';
import 'package:intl/intl.dart';
import 'package:kitty_app/utils/helpers/helpers.dart';

part 'database_event.dart';

part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseBloc(this.database) : super(const DatabaseState()) {
    on<DatabaseInitialEvent>((event, emit) async {
      await _getAllIcons(emit);
      await _getTransactionCategories(emit);
      await _getAllTransaction(emit);
    });
    on<GetCategoryEvent>((event, emit) {
      emit(state.copyWith(createdCategory: event.transactionCategory));
    });
    on<ClearDatabaseEvent>((event, emit) {
      emit(state.copyWith(createdCategory: null));
      emit(state.copyWith(selectedIcon: null));
    });
    on<GetIconEvent>((event, emit) {
      emit(state.copyWith(selectedIcon: event.selectedIcon));
    });
    on<CreateCategoryEvent>((event, emit) async {
      await _createCategory(categoryName: event.categoryName, iconId: state.selectedIcon!.iconId);
      add(DatabaseInitialEvent());
    });
    on<GetCreatedTransaction>((event, emit) async {
      print(state.createdCategory!.title);
      await _createTransaction(
        categoryId: state.createdCategory!.categoryId,
        amount: event.amount,
        description: event.description,
      );
      await _getAllTransaction(emit);
    });
  }

  DBProvider database;

  Future<void> _getAllTransaction(Emitter emit) async {
    List<TransactionModel> transactions = [];
    final db = await database.database;
    await db.transaction((txn) async {
      transactions = await txn.query(database.transactionTable, orderBy: 'expenseId DESC').then((data) {
        final converted = List<Map<String, dynamic>>.from(data);
        return converted.map((e) {
          return TransactionModel(
            expenseId: e['expenseId'],
            amount: e['amount'],
            currentMonth: DateFormat('dd-MMM-yyyy').parse(e['currentMonth']),
            description: e['description'],
            categoryId: e['categoryId'],
            timeStamp: e['timeStamp'],
          );
        }).toList();
      });
    });
    emit(state.copyWith(transaction: transactions, mapTransactions: groupByTimeStampHelper(transactions)));
  }

  Future<void> _getTransactionCategories(Emitter emit) async {
    List<TransactionsCategoriesModel> categories = [];
    final db = await database.database;
    await db.transaction((txn) async {
      await txn.query(database.categoryTable).then((data) {
        final converted = List<Map<String, dynamic>>.from(data);
        categories = converted.map((e) {
          return TransactionsCategoriesModel(
            categoryId: e['categoryId'],
            title: e['title'],
            icon: state.icons.firstWhere((icon) => icon.iconId == e['iconId']),
            type: e['type'],
            totalAmount: double.parse(e['totalAmount']),
            amount: 0,
          );
        }).toList();
      });
    });
    emit(state.copyWith(
      expensesCategories: categories.where((element) => element.type == 'Expenses').toList(),
      incomeCategories: categories.where((element) => element.type == 'Income').toList(),
    ));
  }

  Future<void> _getAllIcons(Emitter emit) async {
    List<IconModel> icons = [];
    final db = await database.database;
    await db.transaction((txn) async {
      icons = await txn.query(database.iconTable).then((data) {
        final converted = List<Map<String, dynamic>>.from(data);
        return converted.map((e) => IconModel.fromJson(e)).toList();
      });
    });
    emit(state.copyWith(
      icons: icons,
    ));
  }

  Future<void> _createCategory({
    required String categoryName,
    required int iconId,
  }) async {
    final db = await database.database;
    await db.transaction((txn) async {
      await txn.insert(database.categoryTable, {
        'type': 'Expenses',
        'title': categoryName,
        'totalAmount': 0.0.toString(),
        'entries': 0,
        'iconId': iconId,
      });
    });
  }

  Future<void> _createTransaction({
    required int categoryId,
    required String amount,
    required String description,
  }) async {
    final db = await database.database;
    await db.transaction((txn) async {
      await txn.insert(database.transactionTable, {
        'description': description,
        'amount': int.parse(amount),
        'currentMonth': DateFormat('dd-MMM-yyyy').format(DateTime.now()),
        'timeStamp': DateTime.now().millisecondsSinceEpoch,
        'categoryId': categoryId,
      });
    });
  }
}
