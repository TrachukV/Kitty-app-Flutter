import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_icons.dart';
import 'package:kitty_app/resources/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = 'home_screen';

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(child: AppIcons.pointerLeft),
                const CalendarWidget(),
                GestureDetector(child: AppIcons.pointerRight),
              ],
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Container(
              width: width * 0.88,
              height: height * 0.13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 2, color: AppColors.grey),
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
            SizedBox(
              height: height * 0.025,
            ),
            DayTransactionsWidget(
              width: width * 0.88,
            ),
            SizedBox(
              height: height * 0.025,
            ),
            DayTransactionsWidget(
              width: width * 0.88,
            ),
          ],
        ),
      ),
    );
  }
}

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: 32,
      width: width / 2.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.grey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppIcons.blackCalendar,
          Text(
            'January, 2023',
            style: AppTextStyles.blackMedium,
          ),
        ],
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

class DayTransactionsWidget extends StatelessWidget {
  const DayTransactionsWidget({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 2,
          color: AppColors.grey,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TODAY',
                  style: AppTextStyles.blackTitle,
                ),
                Text(
                  '-300',
                  style: AppTextStyles.blackTitle,
                ),
              ],
            ),
          ),
          Column(
            children: [
              TransactionItem(
                icon: AppIcons.coloredGroceries,
                description: 'Egg & veggies',
                category: 'Groceries',
                transactionAmount: '-100',
              ),
              TransactionItem(
                icon: AppIcons.coloredGroceries,
                description: 'Egg & veggies',
                category: 'Groceries',
                transactionAmount: '-100',
              ),
              TransactionItem(
                icon: AppIcons.coloredGroceries,
                description: 'Egg & veggies',
                category: 'Groceries',
                transactionAmount: '-100',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.icon,
    required this.description,
    required this.category,
    required this.transactionAmount,
  });

  final SvgPicture icon;
  final String description;
  final String category;
  final String transactionAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            children: [
              icon,
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: AppTextStyles.blackRegular,
                  ),
                  Text(
                    category,
                    style: AppTextStyles.greyCategory,
                  ),
                ],
              ),
            ],
          ),
          Text(
            transactionAmount,
            style: AppTextStyles.redRegular,
          ),
        ],
      ),
    );
  }
}


