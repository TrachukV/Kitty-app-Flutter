part of 'statistics_bloc.dart';

class StatisticsEvent {}

class StatisticsEventLog extends StatisticsEvent {
  final DateTime dateTime;

  StatisticsEventLog(this.dateTime);
}

class StatisticInitialEvent extends StatisticsEvent {}
