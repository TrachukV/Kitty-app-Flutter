import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty_app/blocs/user_bloc/user_bloc.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_images.dart';
import 'package:kitty_app/screens/lock_screen/lock_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<UserBloc>().add(UserInit());
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        log('SPLASH SCREEN');
        Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
          LockScreen.routeName,
          (_) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: AppColors.white,
      child: Center(
        child: SizedBox(
          width: width / 4,
          height: height / 8,
          child: Image.asset(AppImages.launchScreenLogo),
        ),
      ),
    );
  }
}
