import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:kitty_app/models/expenses_model/transaction_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

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
Future<String> pickImageHelper() async {
  final path = await getApplicationDocumentsDirectory();
  final fileName =
      '${path.path}/avatar-${DateTime.now().millisecondsSinceEpoch}.jpg';
  final XFile? image =
  await ImagePicker().pickImage(source: ImageSource.gallery);
  if (image == null) return '';
  await image.saveTo(fileName);
  return fileName;
}
String dayExpensesHelper(List<TransactionModel> models) {
  final result = models.fold(0, (previousValue, element) => previousValue + element.amount);
  return '$result';
}

bool validateEmailHelper(String email) {
  return RegExp(
      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])')
      .hasMatch(email);
}

