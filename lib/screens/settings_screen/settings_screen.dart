import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/resources/app_text_styles.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = 'settings_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DatabaseBloc, DatabaseState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) {
                final transation = state.expensesCategories.firstWhere((element) {
                  return element.categoryId == state.transaction[index].categoryId;
                });
                return ListTile(
                  leading: SvgPicture.asset(transation.icon.pathToIcon),
                  title: Text(
                    state.transaction[index].description,
                    style: AppTextStyles.blackRegular,
                  ),
                  subtitle: Text(transation.title, style: AppTextStyles.greyCategory),
                  trailing: Text(
                    (state.transaction[index].amount).toString(),
                    style: AppTextStyles.redRegular,
                  ),
                );
              });
        },
      ),
    );
  }
}
