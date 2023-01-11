import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = 'settings_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DatabaseBloc, DatabaseState>(
        builder: (context, state) {
          return SizedBox(
              height: 400,
              child: Column(
                  children: List.generate(state.incomeCategories.length, (i) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Color(
                        //   int.parse('FF${state.expensesCategories[i].icon.color}',
                        //       radix: 16),
                        // ),
                      ),
                      child: SvgPicture.asset(state.incomeCategories[i].icon.pathToIcon),);
                  },)
              ));
        },
      ),
    );
  }
}
