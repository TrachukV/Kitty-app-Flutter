import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/blocs/date_bloc/date_bloc.dart';
import 'package:kitty_app/generated/locale_keys.g.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/screens/widgets/show_calendar_dialog.dart';

class CalendarWidgetInc extends StatefulWidget {
  const CalendarWidgetInc({Key? key}) : super(key: key);

  @override
  State<CalendarWidgetInc> createState() => _CalendarWidgetIncState();
}

class _CalendarWidgetIncState extends State<CalendarWidgetInc> {
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
    context.read<DateBloc>().add(IncMonthEvent());
    // final date = context.read<DateBloc>().state.dateTime;
    // print(date);
    // context.read<DatabaseBloc>().add(GetDateEventInc(date));
  }

  void _decDate() {
    context.read<DateBloc>().add(DecMonthEvent());
    // final date = context.read<DateBloc>().state.dateTime;
    // print(date);
    // context.read<DatabaseBloc>().add(GetDateEventInc(date));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocListener<DateBloc, DateState>(
      listener: (context, state) {
        final date = context.read<DateBloc>().state.dateTime;
        print(date);
        context.read<DatabaseBloc>().add(GetDateEventInc(date));
      },
      listenWhen: (oldValue, newValue) {
        return oldValue != newValue;
      },
      child: BlocBuilder<DatabaseBloc, DatabaseState>(
        builder: (context, state) {
          final String dateString = '${listOfMonths[state.selectedDate.month - 1]}, ${state.selectedDate.year}';
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: _decDate, icon: const Icon(Icons.arrow_back_ios_new_outlined)),
                GestureDetector(
                  onTapDown: (TapDownDetails tapDownDetails) {
                    dialogCalendar(context, width);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
