part of 'date_bloc.dart';

@immutable
abstract class DateEvent {


}

class DateMonthEvent extends DateEvent {}

class IncMonthEvent extends DateEvent {}

class DecMonthEvent extends DateEvent {}

class IncYearEvent extends DateEvent {}

class DecYearEvent extends DateEvent {}

class ChooseDate extends DateEvent {

  final DateTime selectedDate;

  ChooseDate(this.selectedDate);

}
