part of 'statistics_date_bloc.dart';

@immutable
abstract class StatisticsDateEvent {}

class DateMonthEvent extends StatisticsDateEvent {}

class IncMonthEvent extends StatisticsDateEvent {}

class DecMonthEvent extends StatisticsDateEvent {}

class IncYearEvent extends StatisticsDateEvent {}

class DecYearEvent extends StatisticsDateEvent {}

class ChooseDate extends StatisticsDateEvent {
  final DateTime selectedDate;

  ChooseDate(this.selectedDate);
}
