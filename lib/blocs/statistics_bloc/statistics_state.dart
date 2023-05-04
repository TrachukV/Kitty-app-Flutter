part of 'statistics_bloc.dart';

class StatisticsState extends Equatable {
  final DateTime selectedDateStatistics;
  final List<StatisticsModel> statisticsModels;

  const StatisticsState(
    this.selectedDateStatistics, {
    this.statisticsModels = const [],
  });

  StatisticsState copyWith({
    DateTime? selectedDateStatistics,
    List<StatisticsModel>? statisticsModels,
  }) {
    return StatisticsState(
      selectedDateStatistics ?? this.selectedDateStatistics,
      statisticsModels: statisticsModels ?? this.statisticsModels,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        selectedDateStatistics,
        statisticsModels,
      ];
}
