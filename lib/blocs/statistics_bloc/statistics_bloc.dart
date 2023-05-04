import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kitty_app/models/statistics_model/statistics_model.dart';
import 'package:kitty_app/repository/database_repository.dart';
import 'package:meta/meta.dart';

part 'statistics_event.dart';
part 'statistics_state.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  StatisticsBloc(this.dbRepo) : super(StatisticsState(DateTime.now())) {
    on<StatisticsEventLog>((event, emit) async {
      final int firstDayOfMonth =
          DateTime.utc(event.dateTime.year, event.dateTime.month, 1)
              .millisecondsSinceEpoch;
      final int lastDayOfMonth = DateTime.utc(
        event.dateTime.year,
        event.dateTime.month + 1,
      ).subtract(const Duration(minutes: 1)).millisecondsSinceEpoch;
      List<StatisticsModel> statistics;
      try {
        statistics = await dbRepo.getStatisticss(
            thisDate: firstDayOfMonth, lastDate: lastDayOfMonth);
      } catch (e) {
        statistics = [];
      }
      emit(state.copyWith(
        selectedDateStatistics: event.dateTime,
        statisticsModels: statistics,
      ));
    });

    on<StatisticInitialEvent>((event, emit) async {
      final statistics = await dbRepo.getStatistics(DateTime.now().month);
      emit(state.copyWith(statisticsModels: statistics));
    });
  }

  DatabaseRepo dbRepo;
}
