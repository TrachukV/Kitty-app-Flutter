part of 'calendar_bloc.dart';

class CalendarEvent {}

class SelectMonthEvent extends CalendarEvent {
  SelectMonthEvent({
    required this.month,
  });

  final int month;
}
