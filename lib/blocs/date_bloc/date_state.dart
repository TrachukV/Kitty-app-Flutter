part of 'date_bloc.dart';

class DateState {
  final DateTime dateTime;

  DateState(this.dateTime);

  DateState copyWith({
    DateTime? dateTime,
  }) {
    return DateState(
      dateTime ?? this.dateTime,
    );
  }
}
