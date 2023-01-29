import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_icons.dart';
import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/screens/cart_screen/chart_screen.dart';
import 'package:kitty_app/screens/manage_screen/manage_screen.dart';

import '../../repository/database_repository.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = 'settings_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: AppColors.grey,
                  child: Column(
                    children: [
                       Text(
                        'Settings',
                        style: AppTextStyles.blackRegular,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Wrap(
                        children: [
                           CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text('M', style: AppTextStyles.blackRegular),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Text(
                                'Muhammed Mahmudov',
                                style: AppTextStyles.blackTitle,
                              ),
                              Text(
                                'muhmed@shahid.iran',
                                style: AppTextStyles.blackTitle,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: (){
                      context
                          .read<NavigationBloc>()
                          .add(NavigateTabEvent(tabIndex: 6, route: ManageScreen.routeName));
                    },
                    child: Text('Manage categories'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
