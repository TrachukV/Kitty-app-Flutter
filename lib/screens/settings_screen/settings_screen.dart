import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_text_styles.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = 'settings_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        final transactionsMap = state.mapTransactions.entries;
        return ListView.separated(
          separatorBuilder: (_, __) {
            return const SizedBox(height: 10,);
          },
          itemCount: state.mapTransactions.length,
          itemBuilder: (
            context,
            index,
          ) {
            final dayTransactionsData = transactionsMap.elementAt(index).value;
            return Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.grey, width: 1),
              ),
              child: Column(
                children: [
                  Text(
                    transactionsMap.elementAt(index).key,
                    style: AppTextStyles.redRegular,
                  ),

                  ...List.generate(dayTransactionsData.length, (index) {
                    final transactions = state.expensesCategories.firstWhere(
                      (element) => element.categoryId == dayTransactionsData[index].categoryId,
                    );
                    return ListTile(
                      leading: SvgPicture.asset(transactions.icon.pathToIcon),
                      title: Text(transactions.title, style: AppTextStyles.blackRegular,),
                      subtitle: Text(dayTransactionsData[index].description, style: AppTextStyles.greyCategory),
                      trailing: Text(
                        (dayTransactionsData[index].amount).toString(),
                        style: AppTextStyles.redRegular,
                      ),
                    );
                  })
                ],
              ),
            );
          },
        );
      },
    );
  }
}
