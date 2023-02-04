import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/database/local_database.dart';

import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_icons.dart';
import 'package:kitty_app/resources/app_text_styles.dart';

import '../home_screen/widgets/month_item.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    Key? key,
    required this.decrement,
    required this.increment,
     required this.screen,
  }) : super(key: key);
  final VoidCallback decrement;
  final VoidCallback increment;

  final String screen;

  @override
  Widget build(BuildContext context) {
    final List<String> monthsList = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            state.activeMonth == 1
                ? Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.grey,
                  )
                : GestureDetector(
                    onTap: decrement,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.sonicSilver,
                    ),
                  ),
            GestureDetector(
              child: Container(
                height: 32,
                width: width / 2.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.grey,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppIcons.blackCalendar,
                    Text(
                      state.activeMonth == 0 ?
                      '${monthsList.first}, ${DateTime.now().year}' :
                      '${monthsList[state.activeMonth - 1]}, ${DateTime.now().year}',
                      style: AppTextStyles.blackMedium,
                    ),
                  ],
                ),
              ),
              onTap: () {
                showGeneralDialog(
                  context: context,
                  pageBuilder:
                      (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
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
                            BoxShadow(
                                color: AppColors.sonicSilver.withOpacity(0.2),
                                offset: const Offset(0, 4),
                                blurRadius: 7)
                          ],
                        ),
                        child: BlocBuilder<DatabaseBloc, DatabaseState>(
                          builder: (context, state) {
                            return Material(
                              color: AppColors.white,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'PICK A MONTH',
                                    style: AppTextStyles.blackTitle,
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
                                          month: monthsList[index].substring(0, 3),
                                          onTap: () {
                                            context.read<DatabaseBloc>().add(
                                                  SelectMonthEvent(
                                                    month: index + 1, screen: screen,
                                                  ),
                                                );
                                          },
                                          isActive: state.activeMonth == index + 1,
                                        );
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
                  },
                  barrierColor: Colors.transparent,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                  transitionDuration: const Duration(milliseconds: 200),
                );
              },
            ),
            state.activeMonth == 12
                ? Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.grey,
                  )
                : GestureDetector(
                    onTap: increment,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.sonicSilver,
                    ),
                  ),
          ],
        );
      },
    );
  }
}
