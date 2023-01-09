import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty_app/resources/app_colors.dart';

class AppIcons {
  const AppIcons._();

  static const String _path = 'assets/icons';

  static SvgPicture logo = SvgPicture.asset(
    '$_path/logo.svg',
  );
  static SvgPicture blackChartNotPressed = SvgPicture.asset('$_path/black_chart_not_pressed.svg');
  static SvgPicture blackChartPressed = SvgPicture.asset('$_path/black_chart_pressed.svg');
  static SvgPicture blackSettingsPressed = SvgPicture.asset('$_path/black_settings_pressed.svg');
  static SvgPicture blackSettingsNotPressed = SvgPicture.asset('$_path/black_settings_not_pressed.svg');
  static SvgPicture blackHomeNotPressed = SvgPicture.asset('$_path/black_home_not_pressed.svg');
  static SvgPicture blackHomePressed = SvgPicture.asset('$_path/black_home_pressed.svg');
  static SvgPicture blackHealthAndSafety = SvgPicture.asset('$_path/black_health_and_safety.svg');
  static SvgPicture blackSearch = SvgPicture.asset('$_path/black_search.svg');
  static SvgPicture pointerLeft = SvgPicture.asset('$_path/pointer_left.svg');
  static SvgPicture blackBack = SvgPicture.asset('$_path/black_back.svg');
  static SvgPicture blackDropDown = SvgPicture.asset('$_path/black_dropdown.svg');
  static SvgPicture whiteAddPlus = SvgPicture.asset('$_path/black_add_plus.svg', color: AppColors.white,);
  static SvgPicture pointerRight = SvgPicture.asset('$_path/pointer_right.svg');
  static SvgPicture blackCalendar = SvgPicture.asset('$_path/black_calendar.svg');
  static SvgPicture blackBalance = SvgPicture.asset('$_path/black_balance.svg');
  static SvgPicture blackIncome = SvgPicture.asset('$_path/black_income.svg');
  static SvgPicture blackExpenses = SvgPicture.asset('$_path/black_expenses.svg');
  static SvgPicture coloredTransportation = SvgPicture.asset('$_path/colored_transportation.svg');
  static SvgPicture coloredSport = SvgPicture.asset('$_path/colored_sport.svg');
  static SvgPicture coloredSelfDevelopment = SvgPicture.asset('$_path/colored_self_development.svg');
  static SvgPicture coloredSaving = SvgPicture.asset('$_path/colored_saving.svg');
  static SvgPicture coloredRestaurant = SvgPicture.asset('$_path/colored_restaurant.svg');
  static SvgPicture coloredParty = SvgPicture.asset('$_path/colored_party.svg');
  static SvgPicture coloredMoney = SvgPicture.asset('$_path/colored_money.svg');
  static SvgPicture coloredMaintenance = SvgPicture.asset('$_path/colored_maintenance.svg');
  static SvgPicture coloredLiquor = SvgPicture.asset('$_path/colored_liquor.svg');
  static SvgPicture coloredLaundry = SvgPicture.asset('$_path/colored_laundry.svg');
  static SvgPicture coloredInstitute = SvgPicture.asset('$_path/colored_institute.svg');
  static SvgPicture coloredHealth = SvgPicture.asset('$_path/colored_health.svg');
  static SvgPicture coloredGroceries = SvgPicture.asset('$_path/colored_groceries.svg');
  static SvgPicture coloredGifts = SvgPicture.asset('$_path/colored_gifts.svg');
  static SvgPicture coloredFuel = SvgPicture.asset('$_path/colored_fuel.svg');
  static SvgPicture coloredElectronics = SvgPicture.asset('$_path/colored_electronics.svg');
  static SvgPicture coloredEducation = SvgPicture.asset('$_path/colored_education.svg');
  static SvgPicture coloredDonate = SvgPicture.asset('$_path/colored_cafe.svg');
}