import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_icons.dart';
import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/screens/home_screen/widgets/month_item.dart';
import 'package:kitty_app/screens/home_screen/widgets/transactionsHistoryWidget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static const routeName = 'home_screen';
  final List<String> listOfMonths = [
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

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 100,
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppIcons.logo,
                Text(
                  'Kitty',
                  style: AppTextStyles.blackBold,
                ),
              ],
            ),
            actions: [
              GestureDetector(
                child: AppIcons.blackSearch,
              ),
              const SizedBox(width: 20),
              GestureDetector(
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(color: AppColors.grey, shape: BoxShape.circle),
                  child: Center(
                      child: Text(
                    'M',
                    style: AppTextStyles.blackMedium,
                  )),
                ),
              ),
              const SizedBox(width: 17),
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(child: AppIcons.pointerLeft),
                  CalendarWidget(
                    onTap: () {
                      showGeneralDialog(
                        context: context,
                        pageBuilder: (BuildContext buildContext, Animation<double> animation,
                            Animation<double> secondaryAnimation) {
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
                              child: Material(
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
                                            month: listOfMonths[index].substring(0, 3),
                                            onTap: () {},
                                          );
                                        }),
                                      ),
                                    )
                                  ],
                                ),
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
                  GestureDetector(child: AppIcons.pointerRight),
                ],
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                ),
                child: Container(
                  height: height * 0.13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: AppColors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BalanceWidget(
                        icon: AppIcons.blackExpenses,
                        finance: '-1,000',
                        nameCategory: 'Expenses',
                        style: AppTextStyles.redRegular,
                      ),
                      BalanceWidget(
                        icon: AppIcons.blackBalance,
                        finance: '10,000',
                        nameCategory: 'Balance',
                        style: AppTextStyles.greenRegular,
                      ),
                      BalanceWidget(
                        icon: AppIcons.blackIncome,
                        finance: '15,000',
                        nameCategory: 'Income',
                        style: AppTextStyles.blackRegular,
                      ),
                    ],
                  ),
                ),
              ),
              const TransactionHistoryWidget(),
            ],
          ),
        );
      },
    );
  }
}

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        width: width / 2.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColors.grey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcons.blackCalendar,
            Text(
              'January, 2023',
              style: AppTextStyles.blackMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    super.key,
    required this.icon,
    required this.finance,
    required this.nameCategory,
    required this.style,
  });

  final SvgPicture icon;
  final String finance;
  final String nameCategory;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(height: 5),
        Text(
          finance,
          style: style,
        ),
        Text(
          nameCategory,
          style: AppTextStyles.greyCategory,
        )
      ],
    );
  }
}
