import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/utils/helpers/helpers.dart';

class TransactionHistoryWidget extends StatelessWidget {
  const TransactionHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        final transactionsMap = state.mapTransactions.entries;
        return Flexible(
          child: ListView.separated(
            padding: const EdgeInsets.all(15),
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: state.mapTransactions.length,
            itemBuilder: (
              context,
              index,
            ) {
              final dayTransactionsData = transactionsMap.elementAt(index).value;
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.grey, width: 1),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dateFormatHelper(transactionsMap.elementAt(index).key),
                            style: AppTextStyles.blackTitle,
                          ),
                          Text(
                            dayExpensesHelper(transactionsMap.elementAt(index).value),
                            style: AppTextStyles.blackTitle,
                          )
                        ],
                      ),
                    ),
                    ...List.generate(dayTransactionsData.length, (index) {
                      final transactions = state.expensesCategories.firstWhere(
                        (element) => element.categoryId == dayTransactionsData[index].categoryId,
                      );
                      return ListTile(
                        leading: SvgPicture.asset(transactions.icon.pathToIcon),
                        title: Text(
                          transactions.title,
                          style: AppTextStyles.blackRegular,
                        ),
                        subtitle: Text(dayTransactionsData[index].description, style: AppTextStyles.greyCategory),
                        trailing: Text('-${(dayTransactionsData[index].amount)}'
                          .toString(),
                          style: AppTextStyles.redRegular,
                        ),
                      );
                    })
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
