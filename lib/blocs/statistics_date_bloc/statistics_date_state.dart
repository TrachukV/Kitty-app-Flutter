part of 'statistics_date_bloc.dart';

class StatisticsDateState {
  final DateTime dateTime;

  StatisticsDateState(this.dateTime);

  StatisticsDateState copyWith({
    DateTime? dateTime,
  }) {
    return StatisticsDateState(
      dateTime ?? this.dateTime,
    );
  }
}
