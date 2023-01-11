import 'dart:convert';

import 'package:kitty_app/database/database_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/icon_model/icon_model.dart';

class DBProvider {



   Database? _database;

  Future<Database> get database async {
    final dbDirectory = await getDatabasesPath();
    const dbName = 'kitty_app.db';
    final path = join(dbDirectory, dbName);

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
    return _database!;
  }

  final String exCatTable = 'expensesCategoriesTable';
  final String inCatTable = 'incomeCategoriesTable';
  final String exTable = 'expensesTable';
  final String inTable = 'incomeTable';

  Future<void> _createDb(Database db, int version) async {
    await db.transaction((txn) async {
      await txn.execute('''
      CREATE TABLE $exCatTable (
      title TEXT,
      totalAmount TEXT,
      entries INTEGER,
      icon TEXT)
      ''');
      await txn.execute('''
      CREATE TABLE $inCatTable (
      title TEXT,
      totalAmount TEXT,
      entries INTEGER,
      icon TEXT) 
      ''');
      await txn.execute('''
      CREATE TABLE $exTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      description TEXT,
      amount INTEGER,
      dateTime TEXT,
      category TEXT)
      ''');
      await txn.execute('''
      CREATE TABLE $inTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      description TEXT,
      amount INTEGER,
      dateTime TEXT,
      category TEXT)
      ''');

      final List<Map<String, String>> expenseIcons = DatabaseData.expenseIcons.values.toList();
      for (int i = 0; i < 9; i++) {
        await txn.insert(exCatTable, {
          'title': DatabaseData.expenseCategories[i],
          'totalAmount': (0.0).toString(),
          'entries': 0,
          'icon': json.encode(IconModel(
            pathToIcon: expenseIcons[i]['icon']!,
            color: expenseIcons[i]['color']!,
          )),
        });
      }
      final List<Map<String, String>> incomeIcons = DatabaseData.incomeIcons.values.toList();
      for (int i = 0; i < 6; i++) {
        await txn.insert(inCatTable, {
          'title': DatabaseData.incomeCategories[i],
          'totalAmount': (0.0).toString(),
          'entries': 0,
          'icon': json.encode(IconModel(
            pathToIcon: incomeIcons[i]['icon']!,
            color: incomeIcons[i]['color']!,

          )),
        });
      }
    });
  }
}
