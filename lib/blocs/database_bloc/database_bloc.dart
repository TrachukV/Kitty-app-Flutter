import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kitty_app/database/local_database.dart';
import 'package:kitty_app/models/balance_model/balance_model.dart';
import 'package:kitty_app/models/expense_category_model/expense_category.dart';
import 'package:kitty_app/models/expenses_model/expenses_model.dart';
import 'package:kitty_app/models/icon_model/icon_model.dart';
import 'package:kitty_app/models/income_category_model/income_category_model.dart';
import 'package:kitty_app/models/income_model/income_model.dart';
import 'package:sqflite/sqflite.dart';

part 'database_event.dart';

part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseBloc() : super(DatabaseState()) {
    on<DatabaseInitialEvent>((event, emit) async {
      // await _getExpensesCategoryModels(emit);
      // await _getIncomesCategoryModels(emit);
      add(GetIncomesCategoriesEvent());
      add(GetExpensesCategoriesEvent());
    });
    on<GetExpensesCategoriesEvent>((event, emit) async {
      await _getExpensesCategoryModels(emit);
    });
    on<GetIncomesCategoriesEvent>((event, emit) async {
      await _getIncomesCategoryModels(emit);
    });
    on<GetTitleCategoryEvent>((event, emit) {
      print(event.title);
      emit(state.copyWith(
        transactionType: event.title,
      ));
    });
    on<GetAmountCategoryEvent>((event, emit) {
      print('${state.expensesCategories.length} Expenses length ');
      print('${state.incomeCategories.length} Income length ');
      final doubleAmount = double.parse(event.amount);
      print(doubleAmount);
      emit(state.copyWith(
        amount: doubleAmount
      ));
    });
    on<GetDescriptionCategoryEvent>((event, emit) {

    });
    on<GetCategoryEvent>((event, emit) {
      emit(state.copyWith(category: event.category));

    });
    on<ClearDatabaseEvent>((event, emit) {
      emit(state.copyWith(transactionType: ''));
    });
  }

  final DBProvider databaseProvider = DBProvider();

  Future<void> _getIncomesCategoryModels(Emitter emit) async {
    List<IncomeCategoryModel> incomesCategoryModels = [];
    final Database database = await databaseProvider.database;
    await database.transaction((txn) async {
      await txn.query(databaseProvider.inCatTable).then((data) {
        final converted = List<Map<String, dynamic>>.from(data);
        incomesCategoryModels = converted.map((element) {
          final iconData = json.decode(element['icon']);
          return IncomeCategoryModel(
            title: element['title'],
            icon: IconModel.fromJson(iconData),
          );
        }).toList();
      });
    });
    emit(
      state.copyWith(incomeCategories: incomesCategoryModels),
    );
  }

  Future<void> _getExpensesCategoryModels(Emitter emit) async {
    List<ExpenseCategoryModel> expensesCategoryModels = [];
    final Database database = await databaseProvider.database;
    await database.transaction((txn) async {
      await txn.query(databaseProvider.exCatTable).then((data) {
        final converted = List<Map<String, dynamic>>.from(data);
        expensesCategoryModels = converted.map((element) {
          final iconData = json.decode(element['icon']);
          return ExpenseCategoryModel(
            title: element['title'],
            icon: IconModel.fromJson(iconData),
          );
        }).toList();
      });
    });
    emit(
      state.copyWith(expensesCategories: expensesCategoryModels),
    );
  }
}
