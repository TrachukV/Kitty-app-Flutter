// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:kitty_app/database/local_database.dart';
// import 'package:kitty_app/models/expenses_model/transaction_model.dart';
// import 'package:meta/meta.dart';
//
// part 'calendar_event.dart';
//
// part 'calendar_state.dart';
//
// class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
//   CalendarBloc(this.database) : super(CalendarState()) {
//     on<SelectMonthEvent>((event, emit) async {
//       final thisDate = DateTime(DateTime.now().year, event.month + 1).millisecondsSinceEpoch;
//       final lastDate = DateTime(DateTime.now().year, event.month + 2).millisecondsSinceEpoch;
//       print(thisDate);
//       print(lastDate);
//       await _getRangeDateTransaction(firstDate: thisDate, lastDate: lastDate, emit: emit);
// print('v nutri calendara *${state.transactionModels.length}*');
//     });
//
//   }
//
//    DBProvider database;
//
//   Future<void> _getRangeDateTransaction ({required firstDate, required lastDate, required Emitter emit}) async {
//     List<TransactionModel> transactions = [];
//     final db = await database.database;
//     await db.transaction((txn) async {
//       transactions = await txn.rawQuery('''
//       SELECT * FROM ${database.transactionTable} WHERE timeStamp BETWEEN $firstDate AND $lastDate
//       ''').then((data) {
//         final converted = List<Map<String, dynamic>>.from(data);
//         return converted.map((e) {
//           return TransactionModel(
//             expenseId: e['expenseId'],
//             amount: e['amount'],
//             currentMonth: DateFormat('dd-MMM-yyyy').parse(e['currentMonth']),
//             description: e['description'],
//             categoryId: e['categoryId'],
//             timeStamp: e['timeStamp'],
//           );
//         }).toList();
//       });
//     });
// print(transactions.length);
//     emit(state.copyWith(
//       transactionModels: transactions
//     ));
//
//   }
// }
