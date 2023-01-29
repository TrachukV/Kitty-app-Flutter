

import 'package:kitty_app/database/database_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



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

  final String iconTable = 'iconTable';
  final String categoryTable = 'categoriesTable';
  final String transactionTable = 'transactionTable';
  final String searches = 'searchValues';


  Future<void> _createDb(Database db, int version) async {
    await db.transaction((txn) async {
      await txn.execute('''
      CREATE TABLE $categoryTable (
      categoryId INTEGER PRIMARY KEY AUTOINCREMENT,
      type TEXT,
      title TEXT,
      totalAmount TEXT,
      entries INTEGER,
      iconId INTEGER NOT NULL,
      FOREIGN KEY (iconId) REFERENCES $iconTable (iconId)
      )
          ''');
      await txn.execute('''
      CREATE TABLE $transactionTable (
      expenseId INTEGER PRIMARY KEY AUTOINCREMENT,
      description TEXT,
      amount INTEGER,
      currentMonth TEXT,
      timeStamp INTEGER,
      categoryId INTEGER NOT NULL,
      FOREIGN KEY (categoryId) REFERENCES $categoryTable (categoryId)
      )
      ''');

      await txn.execute('''
      CREATE TABLE $iconTable (
      iconId INTEGER PRIMARY KEY,
      pathToIcon TEXT,
      color TEXT
      )
      ''');

      await txn.execute('''
      CREATE TABLE $searches (
      value TEXT,
      timeStamp INTEGER)
      ''');

      final List<Map<String, String>> allIcons = DatabaseData.allIcons.values.toList();
      for (int i = 0; i < allIcons.length; i++) {
        await txn.insert(iconTable, {
          'iconId': i,
          'pathToIcon': allIcons[i]['icon'],
          'color': allIcons[i]['color'],
        });
      }
      for (int i = 0; i < 6; i++) {
        await txn.insert(categoryTable, {
          'type': 'Income',
          'title': DatabaseData.incomeCategories[i],
          'totalAmount': (0.0).toString(),
          'entries': 0,
          'iconId': i,
        });
      }
      for (int i = 6; i < DatabaseData.expenseCategories.length + 6; i++,) {
        await txn.insert(categoryTable, {
          'type': 'Expenses',
          'title': DatabaseData.expenseCategories[i - 6],
          'totalAmount': 0.0.toString(),
          'entries': 0,
          'iconId': i,
        });
      }
    });
  }
}
