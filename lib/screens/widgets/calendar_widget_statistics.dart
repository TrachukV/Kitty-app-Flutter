import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty_app/blocs/statistics_bloc/statistics_bloc.dart';
import 'package:kitty_app/blocs/statistics_date_bloc/statistics_date_bloc.dart';
import 'package:kitty_app/generated/locale_keys.g.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/screens/widgets/show_calendar_statistics.dart';

class CalendarWidgetStatistics extends StatefulWidget {
  const CalendarWidgetStatistics({
    Key? key,
  }) : super(key: key);

  @override
  State<CalendarWidgetStatistics> createState() =>
      _CalendarWidgetStatisticsState();
}

class _CalendarWidgetStatisticsState extends State<CalendarWidgetStatistics> {
  final List<String> listOfMonths = [
    LocaleKeys.months_jan.tr(),
    LocaleKeys.months_feb.tr(),
    LocaleKeys.months_mar.tr(),
    LocaleKeys.months_apr.tr(),
    LocaleKeys.months_may.tr(),
    LocaleKeys.months_jun.tr(),
    LocaleKeys.months_jul.tr(),
    LocaleKeys.months_aug.tr(),
    LocaleKeys.months_sep.tr(),
    LocaleKeys.months_oct.tr(),
    LocaleKeys.months_nov.tr(),
    LocaleKeys.months_dec.tr(),
  ];
  DateTime selectedDate = DateTime.now();

  void _incDate() {
    context.read<StatisticsDateBloc>().add(IncMonthEvent());
  }

  void _decDate() {
    context.read<StatisticsDateBloc>().add(DecMonthEvent());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocListener<StatisticsDateBloc, StatisticsDateState>(
      listener: (context, state) {
        final date = context.read<StatisticsDateBloc>().state.dateTime;

        context.read<StatisticsBloc>().add(StatisticsEventLog(date));
      },
      listenWhen: (oldValue, newValue) {
        return oldValue != newValue;
      },
      child: BlocBuilder<StatisticsBloc, StatisticsState>(
        builder: (context, state) {
          final String dateString =
              '${listOfMonths[state.selectedDateStatistics.month - 1]}, ${state.selectedDateStatistics.year}';
          print(dateString);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: _decDate,
                    icon: const Icon(Icons.arrow_back_ios_new_outlined)),
                GestureDetector(
                  onTapDown: (TapDownDetails tapDownDetails) {
                    dialogCalendarStatistics(context, width);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          color: AppColors.sonicSilver,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(dateString),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _incDate,
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
