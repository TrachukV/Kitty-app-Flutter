

import 'package:flutter/material.dart';
import 'package:kitty_app/resources/app_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle blackBold = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: 20,
    color: AppColors.black,
    fontWeight: AppFonts.bold,
    letterSpacing: 0,
  );
  static TextStyle blackMedium = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: 14,
    color: AppColors.black,
    fontWeight: AppFonts.regular,
    letterSpacing: 0,
  );
  static TextStyle greyCategory = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: 12,
    color: AppColors.silver,
    fontWeight: AppFonts.regular,
    letterSpacing: 0,
  );
  static TextStyle blackBottom = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: 12,
    color: AppColors.black,
    fontWeight: AppFonts.regular,
    letterSpacing: 0,
  );
  static TextStyle redRegular = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: 14,
    color: AppColors.red,
    fontWeight: AppFonts.extraRegular,
    letterSpacing: 0,
  );
  static TextStyle greenRegular = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: 14,
    color: AppColors.green,
    fontWeight: AppFonts.extraRegular,
    letterSpacing: 0,
  );
  static TextStyle whiteRegular = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: 14,
    color: AppColors.white,
    fontWeight: AppFonts.extraRegular,
    letterSpacing: 0,
  );
  static TextStyle blackRegular = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: 14,
    color: AppColors.black,
    fontWeight: AppFonts.extraRegular,
    letterSpacing: 0,
  );
  static TextStyle blueRegular = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: 14,
    color: AppColors.blue,
    fontWeight: AppFonts.extraRegular,
    letterSpacing: 0,
  );
  static TextStyle greyRegular = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: 14,
    color: AppColors.silver,
    fontWeight: AppFonts.extraRegular,
    letterSpacing: 0,
  );
  static TextStyle blackTitle = TextStyle(
    fontFamily: AppFonts.fontFamily,
    fontSize: 10,
    color: AppColors.black,
    fontWeight: AppFonts.extraRegular,
    letterSpacing: 1.5,
  );
}