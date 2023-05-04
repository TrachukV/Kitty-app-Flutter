import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty_app/resources/app_colors.dart';

class AppIcons {
  const AppIcons._();

  static const String _path = 'assets/icons';
  static const String _pathCategories = 'assets/icons/categories';

  static SvgPicture logo = SvgPicture.asset(
    '$_path/logo.svg',
  );
  //[START] Black Icons

  static SvgPicture blackDrag = SvgPicture.asset('$_path/black_drag.svg');
  static SvgPicture blackChartNotPressed =
      SvgPicture.asset('$_path/black_chart_not_pressed.svg');
  static SvgPicture blackChartPressed =
      SvgPicture.asset('$_path/black_chart_pressed.svg');
  static SvgPicture blackSettingsPressed =
      SvgPicture.asset('$_path/black_settings_pressed.svg');
  static SvgPicture blackSettingsNotPressed =
      SvgPicture.asset('$_path/black_settings_not_pressed.svg');
  static SvgPicture blackHomeNotPressed =
      SvgPicture.asset('$_path/black_home_not_pressed.svg');
  static SvgPicture blackHomePressed =
      SvgPicture.asset('$_path/black_home_pressed.svg');
  static SvgPicture blackHealthAndSafety =
      SvgPicture.asset('$_path/black_health_and_safety.svg');
  static SvgPicture blackSearch = SvgPicture.asset('$_path/black_search.svg');
  static SvgPicture pointerLeft = SvgPicture.asset('$_path/pointer_left.svg');
  static SvgPicture blackBack = SvgPicture.asset('$_path/black_back.svg');
  static SvgPicture blackDropDown =
      SvgPicture.asset('$_path/black_dropdown.svg');
  static SvgPicture blackAddPlus =
      SvgPicture.asset('$_path/black_add_plus.svg');
  static SvgPicture whiteAddPlus = SvgPicture.asset(
    '$_path/black_add_plus.svg',
    color: AppColors.white,
  );
  static SvgPicture pointerRight = SvgPicture.asset('$_path/pointer_right.svg');
  static SvgPicture blackCalendar =
      SvgPicture.asset('$_path/black_calendar.svg');
  static SvgPicture blackBalance = SvgPicture.asset('$_path/black_balance.svg');
  static SvgPicture blackIncome = SvgPicture.asset('$_path/black_income.svg');
  static SvgPicture blackExpenses =
      SvgPicture.asset('$_path/black_expenses.svg');
  static SvgPicture blackMore = SvgPicture.asset('$_path/black_more.svg');
  //[END] Black Icons

  //[Start] Colored Icons
  static SvgPicture coloredTransportation =
      SvgPicture.asset('$_path/colored_transportation.svg');
  static SvgPicture coloredSport = SvgPicture.asset('$_path/colored_sport.svg');
  static SvgPicture coloredSelfDevelopment =
      SvgPicture.asset('$_path/colored_self_development.svg');
  static SvgPicture coloredSaving =
      SvgPicture.asset('$_path/colored_saving.svg');
  static SvgPicture coloredRestaurant =
      SvgPicture.asset('$_path/colored_restaurant.svg');
  static SvgPicture coloredParty = SvgPicture.asset('$_path/colored_party.svg');
  static SvgPicture coloredMoney = SvgPicture.asset('$_path/colored_money.svg');
  static SvgPicture coloredMaintenance =
      SvgPicture.asset('$_path/colored_maintenance.svg');
  static SvgPicture coloredLiquor =
      SvgPicture.asset('$_path/colored_liquor.svg');
  static SvgPicture coloredLaundry =
      SvgPicture.asset('$_path/colored_laundry.svg');
  static SvgPicture coloredInstitute =
      SvgPicture.asset('$_path/colored_institute.svg');
  static SvgPicture coloredHealth =
      SvgPicture.asset('$_path/colored_health.svg');
  static SvgPicture coloredGroceries =
      SvgPicture.asset('$_path/colored_groceries.svg');
  static SvgPicture coloredGifts = SvgPicture.asset('$_path/colored_gifts.svg');
  static SvgPicture coloredFuel = SvgPicture.asset('$_path/colored_fuel.svg');
  static SvgPicture coloredElectronics =
      SvgPicture.asset('$_path/colored_electronics.svg');
  static SvgPicture coloredEducation =
      SvgPicture.asset('$_path/colored_education.svg');
  static SvgPicture coloredDonate = SvgPicture.asset('$_path/colored_cafe.svg');
  //[END] Colored Icons

  //[Start] Categories Icons
  static const String cafe = '$_path/colored_cafe.svg';
  static const String donate = '$_path/colored_donate.svg';
  static const String education = '$_path/colored_education.svg';
  static const String electronics = '$_path/colored_electronics.svg';
  static const String fuel = '$_path/colored_fuel.svg';
  static const String gifts = '$_path/colored_gifts.svg';
  static const String groceries = '$_path/colored_groceries.svg';
  static const String health = '$_path/colored_health.svg';
  static const String institute = '$_path/colored_institute.svg';
  static const String laundry = '$_path/colored_laundry.svg';
  static const String liquor = '$_path/colored_liquor.svg';
  static const String maintenance = '$_path/colored_maintenance.svg';
  static const String money = '$_path/colored_money.svg';
  static const String party = '$_path/colored_party.svg';
  static const String restaurant = '$_path/colored_restaurant.svg';
  static const String savings = '$_path/colored_savings.svg';
  static const String selfDevelopment = '$_path/colored_self_development.svg';
  static const String sport = '$_path/colored_sport.svg';
  static const String transportation = '$_path/colored_transportation.svg';
//[END] Categories Icon
//
  static const String cafee = '$_pathCategories/cafe.svg';
  static const String donatee = '$_pathCategories/donate.svg';
  static const String educationn = '$_pathCategories/education.svg';
  static const String electronicss = '$_pathCategories/electronics.svg';
  static const String fuell = '$_pathCategories/fuel.svg';
  static const String giftss = '$_pathCategories/gifts.svg';
  static const String groceriess = '$_pathCategories/groceries.svg';
  static const String healthh = '$_pathCategories/health.svg';
  static const String institutee = '$_pathCategories/institute.svg';
  static const String laundryy = '$_pathCategories/laundry.svg';
  static const String liquorr = '$_pathCategories/liquor.svg';
  static const String maintenancee = '$_pathCategories/maintenance.svg';
  static const String moneyy = '$_pathCategories/money.svg';
  static const String partyy = '$_pathCategories/party.svg';
  static const String restaurantt = '$_pathCategories/restaurant.svg';
  static const String savingss = '$_pathCategories/savings.svg';
  static const String selfDevelopmentt = '$_pathCategories/self_development.svg';
  static const String sportt = '$_pathCategories/sport.svg';
  static const String transportationn = '$_pathCategories/transportation.svg';

  static String kittiLogo = '$_path/logo.svg';
}
