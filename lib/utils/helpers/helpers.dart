import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:kitty_app/models/expenses_model/transaction_model.dart';

// Map<String, List<TransactionModel>> groupByHelper(List<TransactionModel> transactionModels) {
//   return transactionModels.groupListsBy((model) => stringDateHelper(model.currentMonth));
// }

Map<String, List<TransactionModel>> groupByTimeStampHelper(List<TransactionModel> transactionModels) {
  return transactionModels.groupListsBy((model) => stringTimeStampHelper(model.timeStamp));
}

// String stringDateHelper(DateTime dateTime) {
//   return DateFormat('dd-MMM-yyyy').format(dateTime);
// }

String stringTimeStampHelper(int timeStamp) {
  final date =  DateTime.fromMillisecondsSinceEpoch(timeStamp);
  return DateFormat('dd-MMM-yyyy').format(date);
}

String dateFormatHelper(String dayTransaction) {
  final parseActualDate = DateFormat('dd-MMM-yyyy').parse(dayTransaction);
  final actualFormatterDate = DateFormat('Md').format(parseActualDate);
  final DateTime today = DateTime.now();
  final DateFormat parseDateNow = DateFormat('dd-MMM-yyyy');
  final todayFormat = parseDateNow.format(today);
  DateTime yesterday = today.subtract(const Duration(days: 1));
  final yesterdayFormat = parseDateNow.format(yesterday);
  if (dayTransaction == todayFormat) {
    return 'TODAY';
  } else if (dayTransaction == yesterdayFormat) {
    return 'YESTERDAY';
  }

  return actualFormatterDate;
}

String dayExpensesHelper(List<TransactionModel> models) {
  final result = models.fold(0, (previousValue, element) => previousValue + element.amount);
  return '$result';
}

