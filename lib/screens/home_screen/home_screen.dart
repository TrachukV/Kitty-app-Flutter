

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/blocs/navigation_bloc/navigation_bloc.dart';

import 'package:kitty_app/generated/locale_keys.g.dart';

import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_icons.dart';
import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/screens/search_screen/search_screen.dart';
import 'package:kitty_app/screens/widgets/avatar_widget.dart';
import 'package:kitty_app/screens/widgets/calendar_widget.dart';

import 'package:kitty_app/screens/home_screen/widgets/transactionsHistoryWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery
        .of(context)
        .size
        .height;

    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        if (state.icons.isEmpty) {
          CircularProgressIndicator(
            color: AppColors.blue,
          );
        }
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
                onTap: () {
                  context
                      .read<NavigationBloc>()
                      .add(NavigateTabEvent(tabIndex: 5, route: SearchScreen.routeName));
                },
                child: AppIcons.blackSearch,
              ),
              const SizedBox(width: 20),
              AvatarWidget(color: AppColors.grey,),
              const SizedBox(width: 17),
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              CalendarWidget(
                decrement: () {
                  context.read<DatabaseBloc>().add(
                    IncDecMonthEvent(command: 'decrement', screen: 'home'),
                  );
                },
                increment: () {
                  context.read<DatabaseBloc>().add(
                    IncDecMonthEvent(command: 'increment', screen: 'home'),
                  );
                },
                screen: 'home',
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
                        finance: '${state.balance.expenses}',
                        nameCategory: LocaleKeys.expenses.tr(),
                        style: AppTextStyles.redRegular,
                      ),
                      BalanceWidget(
                        icon: AppIcons.blackBalance,
                        finance: '${state.balance.actualBalance}',
                        nameCategory: LocaleKeys.balance.tr(),
                        style: AppTextStyles.greenRegular,
                      ),
                      BalanceWidget(
                        icon: AppIcons.blackIncome,
                        finance: '${state.balance.income}',
                        nameCategory: LocaleKeys.income.tr(),
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
