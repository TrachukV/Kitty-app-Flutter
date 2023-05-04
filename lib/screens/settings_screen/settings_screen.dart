import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:kitty_app/blocs/user_bloc/user_bloc.dart';
import 'package:kitty_app/generated/locale_keys.g.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_icons.dart';

import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/screens/chart_screen/chart_screen.dart';
import 'package:kitty_app/screens/faq_screen/faq_screen.dart';

import 'package:kitty_app/screens/manage_screen/manage_screen.dart';
import 'package:kitty_app/screens/settings_screen/widgets/setting_item.dart';
import 'package:kitty_app/screens/splash_screen/splash_screen.dart';
import 'package:kitty_app/screens/widgets/avatar_widget.dart';
import 'package:kitty_app/services/secure_storage.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = 'settings_screen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    print('test ${SecuredStorageService.changeLanguage}');

    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
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
                        height: 100,
                        width: double.infinity,
                        color: AppColors.grey,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 16, right: 16),
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
                                  AvatarWidget(
                                    color: AppColors.white,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.userModel.userName,
                                        style: AppTextStyles.blackMedium,
                                      ),
                                      SizedBox(
                                        height: 10,
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
                          title: LocaleKeys.manage_cat.tr(),
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
                          title: LocaleKeys.export.tr(),
                          iconData: Icons.picture_as_pdf_outlined,
                        ),
                        SettingItem(
                          onTap: () {},
                          rightWidget: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.setLocale(Locale('en'));
                                },
                                child: Container(
                                  height: height / 30,
                                  width: height / 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: AppColors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Center(child: Text('🇬🇧')),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.setLocale(Locale('uk'));
                                },
                                child: Container(
                                  height: height / 30,
                                  width: height / 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: AppColors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Center(child: Text('🇺🇦')),
                                ),
                              ),
                            ],
                          ),
                          title: LocaleKeys.language.tr(),
                          iconData: Icons.translate_outlined,
                        ),
                        SettingItem(
                          onTap: () {
                            context.read<NavigationBloc>().add(NavigateTabEvent(
                                tabIndex: 8, route: FAQScreen.routeName));
                          },
                          rightWidget: Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.grey,
                            size: 24,
                          ),
                          title: LocaleKeys.faq.tr(),
                          iconData: Icons.help_center_outlined,
                        ),
                        SettingItem(
                          onTap: () {
                            _callAlertDialog(context: context, height: height);
                          },
                          rightWidget: const SizedBox.shrink(),
                          title: LocaleKeys.logout.tr(),
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

  Future<void> _callAlertDialog(
      {required BuildContext context, required double height}) {
    return _alertDialog(
      context: context,
      height: height,
      title: LocaleKeys.q_delete_acc.tr(),
      tapYes: () {
        Navigator.of(context, rootNavigator: true).pop();
        _alertDialog(
          context: context,
          height: height,
          title: LocaleKeys.q_sure_delete_acc.tr(),
          tapYes: () {
            context.read<UserBloc>().add(DeleteUsers());
            context.read<DatabaseBloc>().add(DeleteDataBaseEvent());
            Navigator.of(context, rootNavigator: true).pop();
            Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
              SplashScreen.routeName,
              (_) => false,
            );
          },
          tapNo: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          titleButtonYes: LocaleKeys.yes.tr(),
          titleButtonNo: LocaleKeys.no.tr(),
        );
      },
      tapNo: () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      },
      titleButtonYes: LocaleKeys.delete_acc.tr(),
      titleButtonNo: LocaleKeys.close_app.tr(),
    );
  }

  Future<void> _alertDialog({
    required BuildContext context,
    required double height,
    required String title,
    required VoidCallback tapYes,
    required VoidCallback tapNo,
    required String titleButtonYes,
    required String titleButtonNo,
  }) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: SizedBox(
              width: double.infinity,
              height: height / 5,
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppIcons.kittiLogo,
                    height: 50,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    title,
                    style: AppTextStyles.greyRegular,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.sonicSilver),
                          ),
                          onPressed: tapYes,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            titleButtonYes,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.whiteRegular,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.sonicSilver),
                          ),
                          onPressed: tapNo,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            titleButtonNo,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: AppTextStyles.whiteRegular,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
