import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'statistics_date_event.dart';

part 'statistics_date_state.dart';

class StatisticsDateBloc
    extends Bloc<StatisticsDateEvent, StatisticsDateState> {
  StatisticsDateBloc() : super(StatisticsDateState(DateTime.now())) {
    on<IncMonthEvent>((event, emit) {
      emit(state.copyWith(
          dateTime: DateTime(state.dateTime.year, state.dateTime.month + 1)));
    });

    on<DecMonthEvent>((event, emit) {
      emit(state.copyWith(
          dateTime: DateTime(state.dateTime.year, state.dateTime.month - 1)));
    });

    on<IncYearEvent>((event, emit) {
      emit(state.copyWith(
          dateTime: DateTime(state.dateTime.year - 1, state.dateTime.month)));
    });

    on<DecYearEvent>((event, emit) {
      emit(state.copyWith(
          dateTime: DateTime(state.dateTime.year + 1, state.dateTime.month)));
    });

    on<ChooseDate>((event, emit) {
      emit(state.copyWith(dateTime: event.selectedDate));
    });
  }
}
