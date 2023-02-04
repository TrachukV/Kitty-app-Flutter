import 'package:intl/intl.dart';
import 'package:kitty_app/database/local_database.dart';
import 'package:kitty_app/models/balance_model/balance_model.dart';
import 'package:kitty_app/models/expense_category_model/transactions_categories_models.dart';
import 'package:kitty_app/models/expenses_model/transaction_model.dart';
import 'package:kitty_app/models/icon_model/icon_model.dart';
import 'package:kitty_app/models/statistics_model/statistics_model.dart';

class DatabaseRepo {
  DatabaseRepo(this.database);

  final DBProvider database;



  Future<List<IconModel>> getAllIcons() async {
    final db = await database.database;
    return db.transaction((txn) async {
      return await txn.query(database.iconTable).then((data) {
        final converted = List<Map<String, dynamic>>.from(data);
        return converted.map((e) => IconModel.fromJson(e)).toList();
      });
    });
  }

  Future<List<TransactionsCategoriesModel>> getCategories() async {
    final db = await database.database;
    final category = database.categoryTable;
    final icon = database.iconTable;
    return db.transaction((txn) async {
      return txn.rawQuery('''
      SELECT $category.categoryId, $category.title, $category.orderNum, 
      $category.totalAmount,$category.entries, $category.type, $icon.iconId, 
      $icon.pathToIcon,$icon.color
      FROM $category
      INNER JOIN $icon
      ON $category.iconId = $icon.iconId
      ORDER BY orderNum
      ''').then((data) {
        final converted = List<Map<String, dynamic>>.from(data);
        return converted.map((e) {
          return TransactionsCategoriesModel(
            categoryId: e['categoryId'],
            title: e['title'],
            type: e['type'],
            totalAmount: double.parse(e['totalAmount']),
            amount: 0,
            orderNum: e['orderNum'],
            icon: IconModel(
              iconId: e['iconId'],
              color: e['color'],
              pathToIcon: e['pathToIcon'],
            ),
          );
        }).toList();
      });
    });
  }

  Future<List<TransactionModel>> getAllTransaction() async {
    final db = await database.database;
    return db.transaction((txn) async {
      return await txn.query(database.transactionTable, orderBy: 'expenseId DESC').then((data) {
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
  }

  Future<List<TransactionModel>> getRangeDateTransaction({
    required firstDate,
    required lastDate,
  }) async {
    final db = await database.database;
    return db.transaction((txn) async {
      return await txn.rawQuery('''
      SELECT * FROM ${database.transactionTable} WHERE timeStamp BETWEEN $firstDate AND $lastDate
      ''').then((data) {
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
  }

  Future<void> createTransaction({
    required int categoryId,
    required String amount,
    required String description,
  }) async {
    final db = await database.database;
    return db.transaction((txn) async {
      await txn.insert(database.transactionTable, {
        'description': description,
        'amount': int.parse(amount),
        'currentMonth': DateFormat('dd-MMM-yyyy').format(DateTime.now()),
        'timeStamp': DateTime.now().millisecondsSinceEpoch,
        'categoryId': categoryId,
      });
    });
  }

  Future<void> createCategory({
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

  Future<BalanceModel> monthBalance({
    required int thisDate,
    required int lastDate,
  }) async {
    final db = await database.database;
    return await db.transaction((txn) async {
      final income = await txn.rawQuery('''
       SELECT SUM(amount) AS income FROM ${database.transactionTable} 
       WHERE timeStamp BETWEEN $thisDate AND $lastDate AND amount > 0
      ''').then((value) {
        final converted = List<Map<String, dynamic>>.from(value);
        return converted.first['income'] ?? 0;
      });
      final expenses = await txn.rawQuery('''
       SELECT SUM(amount) AS expense FROM ${database.transactionTable} 
       WHERE timeStamp BETWEEN $thisDate AND $lastDate AND amount < 0
          ''').then((value) {
        final converted = List<Map<String, dynamic>>.from(value);

        return converted.first['expense'] ?? 0;
      });

      return BalanceModel(income: income, expenses: expenses, actualBalance: expenses + income);
    });
  }

  Future<List<StatisticsModel>> getStatistics(int month) async {
    final int firstDate = DateTime(DateTime.now().year, month).subtract(const Duration(days: 1)).millisecondsSinceEpoch;
    final int lastDate = DateTime(DateTime.now().year, month + 1).millisecondsSinceEpoch;
    final icons = database.iconTable;
    final categoryTable = database.categoryTable;
    final transactionTable = database.transactionTable;
    final db = await database.database;
    return await db.transaction((txn) async {
      final int monthlySum = await txn.rawQuery('''
      SELECT SUM(amount) AS sum FROM $transactionTable 
      WHERE amount < 0
      AND timeStamp BETWEEN $firstDate AND $lastDate
      ''').then((data) {
        return data.first['sum'] as int;
      });
      return await txn.rawQuery('''
         SELECT COUNT(*) totalCount, $transactionTable.categoryId, 
         $categoryTable.title, SUM($transactionTable.amount) AS sumOfEntries, 
         $transactionTable.timeStamp, $icons.iconId, $icons.pathToIcon, $icons.color 
         FROM $transactionTable 
         INNER JOIN $categoryTable 
         ON $categoryTable.categoryId = $transactionTable.categoryId 
         JOIN iconTable 
         ON $categoryTable.iconId = $icons.iconId 
         WHERE $categoryTable.type = "Expenses" 
         AND $transactionTable.timeStamp BETWEEN $firstDate AND $lastDate 
         GROUP BY categoriesTable.categoryId, categoriesTable.title
          ''').then((data) {
        final converted = List<Map<String, dynamic>>.from(data);
        return converted.map((e) {
          return StatisticsModel(
            totalAmount: e['sumOfEntries'],
            title: e['title'],
            counterTransactions: e['totalCount'],
            percentage: e['sumOfEntries'] / monthlySum * 100,
            icon: IconModel(
              iconId: e['iconId'],
              color: e['color'],
              pathToIcon: e['pathToIcon'],
            ),
          );
        }).toList();
      });
    });
  }

  Future<List<TransactionsCategoriesModel>> getUsedCategories() async {
    final db = await database.database;
    final icons = database.iconTable;
    final categoryTable = database.categoryTable;
    final transactionTable = database.transactionTable;
    return await db.transaction((txn) async {
      return await txn.rawQuery('''
         SELECT  COUNT(*) totalCount, $transactionTable.categoryId, 
         $categoryTable.title, $categoryTable.type, $icons.iconId, $categoryTable.orderNum,
         $icons.pathToIcon, $icons.color
         FROM $transactionTable 
         INNER JOIN $categoryTable 
         ON $categoryTable.categoryId = $transactionTable.categoryId 
         JOIN iconTable 
         ON $categoryTable.iconId = $icons.iconId 
         GROUP BY categoriesTable.categoryId, categoriesTable.title
          ''').then((data) {
        final converted = List<Map<String, dynamic>>.from(data);
        return converted.map((e) {
          return TransactionsCategoriesModel(
            orderNum: e['orderNum'],
            categoryId: e['categoryId'],
            title: e['title'],
            type: e['type'],
            icon: IconModel(
              iconId: e['iconId'],
              pathToIcon: e['pathToIcon'],
              color: e['color'],
            ),
          );
        }).toList();
      });
    });
  }

  Future<List<TransactionModel>> getSearchedTransaction(List<int> categoriesIds, String searchValue) async {
    final db = await database.database;
    final categories = ' AND categoryId IN (${('?' * (categoriesIds.length)).split('').join(', ')})';
    return await db.transaction((txn) async {
      return await txn
          .query(database.transactionTable,
              where: 'description LIKE ?${categoriesIds.isNotEmpty ? categories : ''}',
              whereArgs: ['$searchValue%', ...categoriesIds],
              orderBy: 'expenseId DESC')
          .then((data) {
        final converted = List<Map<String, dynamic>>.from(data);
        return converted.map((e) {
          return TransactionModel(
            expenseId: e['expenseId'],
            description: e['description'],
            amount: e['amount'],
            timeStamp: e['timeStamp'],
            categoryId: e['categoryId'],
            currentMonth: DateFormat('dd-MMM-yyyy').parse(
              e['currentMonth'],
            ),
          );
        }).toList();
      });
    });
  }

  Future<void> saveSearchValue(String value) async {
    final db = await database.database;
    return await db.transaction((txn) async {
      final int count = await txn.rawQuery('SELECT COUNT(timeStamp) AS count FROM ${database.searches}').then((data) {
        final converted = List<Map<String, dynamic>>.from(data);
        return converted.first['count'] ?? 0;
      });
      if (count >= 3) {
        await txn.rawQuery('DELETE FROM ${database.searches} WHERE '
            'timeStamp = (SELECT MIN(timeStamp) FROM ${database.searches})');
      }
      await txn.insert(database.searches, {'value': value, 'timeStamp': DateTime.now().millisecondsSinceEpoch});
    });
  }

  Future<List<String>> getRecentSearchValues() async {
    final db = await database.database;
    return await db.transaction((txn) async {
      return await txn
          .rawQuery('SELECT * FROM ${database.searches} '
              'ORDER BY timeStamp DESC')
          .then((data) {
        final converted = List<Map<String, dynamic>>.from(data);
        return converted.map((e) => e['value'] as String).toList();
      });
    });
  }

  Future<void> dragCategories(int oldId, int newId) async {
    final db = await database.database;
    await db.transaction((txn) async {
      await txn.rawQuery('''
      UPDATE ${database.categoryTable} SET orderNum = 
      (CASE WHEN orderNum = $oldId THEN $newId ELSE $oldId END) 
      WHERE orderNum IN ($oldId, $newId) 
      ''');
    });
  }

  Future<void> editCategory({required int categoryId, required int iconId, required String title}) async {
    final db = await database.database;
    await db.transaction((txn) async {
      txn.update(
          database.categoryTable,
          {
            'title': title,
            'iconId': iconId,
          },
          where: 'categoryId = ?',
          whereArgs: [categoryId]);
    });
  }
}
