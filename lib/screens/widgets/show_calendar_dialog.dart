import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/blocs/date_bloc/date_bloc.dart';
import 'package:kitty_app/generated/locale_keys.g.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/screens/home_screen/widgets/month_item.dart';

void dialogCalendar(BuildContext context, double width) {
  showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
      return BlocProvider.value(
        value: BlocProvider.of<DateBloc>(context),
        child: const DialogCalendar(),
      );
    },
    barrierColor: Colors.transparent,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    transitionDuration: const Duration(milliseconds: 200),
  );
}

class DialogCalendar extends StatefulWidget {
  const DialogCalendar({
    super.key,
  });

  @override
  State<DialogCalendar> createState() => _DialogCalendarState();
}

class _DialogCalendarState extends State<DialogCalendar> {
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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: width / 2.6),
        width: width - 80,
        padding: const EdgeInsets.only(
          top: 16,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(color: AppColors.sonicSilver.withOpacity(0.2), offset: const Offset(0, 4), blurRadius: 7)
          ],
        ),
        child: BlocConsumer<DateBloc, DateState>(
          // listenWhen: (oldState, newState) {
          //   return oldState.dateTime != newState.dateTime;
          // },
          listener: (context, state) {
            // context.read<DatabaseBloc>().add(GetDateEventInc(state.dateTime));
          },
          builder: (context, state) {
            final selectedDate = context.watch<DatabaseBloc>().state.selectedDate;
            return Material(
              color: AppColors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.pick_month.tr(),
                    style: AppTextStyles.blackTitle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            context.read<DateBloc>().add(IncYearEvent());
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 15,
                          )),
                      Text(state.dateTime.year.toString()),
                      IconButton(
                          onPressed: () {
                            context.read<DateBloc>().add(DecYearEvent());
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15,
                          ))
                    ],
                  ),
                  Flexible(
                    child: GridView.count(
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 20,
                      padding: const EdgeInsets.only(top: 8),
                      childAspectRatio: 2,
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      children: List.generate(12, (index) {
                        return MonthItem(
                            month: listOfMonths[index].substring(0, 3),
                            onTap: () {
                              context.read<DatabaseBloc>().add(GetDateEventInc(
                                    DateTime(
                                      state.dateTime.year,
                                      index + 1,
                                    ),
                                  ));
                              context.read<DateBloc>().add(
                                    ChooseDate(
                                      DateTime(
                                        state.dateTime.year,
                                        index + 1,
                                      ),
                                    ),
                                  );
                              // final selectedDate = context.read<DateBloc>().state.dateTime;
                              // context.read<DatabaseBloc>().add(
                              //       SelectMonthEvent(
                              //         month: index + 1,
                              //         screen: 'home',
                              //       ),
                              //     );
                            },
                            isActive: selectedDate.year == state.dateTime.year && selectedDate.month == index + 1);
                      }),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
