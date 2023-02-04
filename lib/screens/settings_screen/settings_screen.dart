import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:kitty_app/blocs/user_bloc/user_bloc.dart';
import 'package:kitty_app/resources/app_colors.dart';

import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/screens/cart_screen/chart_screen.dart';
import 'package:kitty_app/screens/lock_screen/lock_screen.dart';
import 'package:kitty_app/screens/manage_screen/manage_screen.dart';
import 'package:kitty_app/screens/settings_screen/widgets/setting_item.dart';
import 'package:kitty_app/screens/widgets/avatar_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = 'settings_screen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        bool isSwitched = false;
        final height = MediaQuery.of(context).size.height;
        return Container(
          color: AppColors.grey,
          child: SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      return Container(
                        height: height / 6,
                        width: double.infinity,
                        color: AppColors.grey,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, left: 16, right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Settings',
                                style: AppTextStyles.blackBold,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  AvatarWidget( color: AppColors.white,),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.userModel.userName,
                                        style: AppTextStyles.blackMedium,
                                      ),
                                      Text(
                                        state.userModel.eMail,
                                        style: AppTextStyles.blackTitle,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SettingItem(
                          onTap: () {
                            context.read<NavigationBloc>().add(
                                  NavigateTabEvent(
                                    tabIndex: 6,
                                    route: ManageScreen.routeName,
                                  ),
                                );
                          },
                          rightWidget: Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.grey,
                            size: 24,
                          ),
                          title: 'Manage categories',
                          iconData: Icons.category_outlined,
                        ),
                        SettingItem(
                          onTap: () {
                            context.read<NavigationBloc>().add(
                                  NavigateTabEvent(
                                    tabIndex: 1,
                                    route: ChartScreen.routeName,
                                  ),
                                );
                          },
                          rightWidget: Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.grey,
                            size: 24,
                          ),
                          title: 'Export to PDF',
                          iconData: Icons.picture_as_pdf_outlined,
                        ),
                        SettingItem(
                          onTap: () {},
                          rightWidget: Row(
                            children: [
                              Text(
                                'eng',
                                style: AppTextStyles.greyCategory,
                              ),
                              Switch(
                                splashRadius: 0,
                                activeColor: AppColors.white,
                                activeTrackColor: AppColors.grey,
                                inactiveTrackColor: AppColors.grey,
                                value: isSwitched,
                                onChanged: (bool value) {
                                  setState(() {
                                    isSwitched = value;
                                    print(isSwitched);
                                  });
                                },
                              ),
                              Text(
                                'ukr',
                                style: AppTextStyles.greyCategory,
                              )
                            ],
                          ),
                          title: 'Choose language',
                          iconData: Icons.translate_outlined,
                        ),
                        SettingItem(
                          onTap: () {},
                          rightWidget: Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.grey,
                            size: 24,
                          ),
                          title: 'Frequently asked questions',
                          iconData: Icons.help_center_outlined,
                        ),
                        SettingItem(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamedAndRemoveUntil(LockScreen.routeName, (route) => false);
                          },
                          rightWidget: const SizedBox.shrink(),
                          title: 'Logout',
                          iconData: Icons.logout_outlined,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
