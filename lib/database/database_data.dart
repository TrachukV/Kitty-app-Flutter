import 'package:kitty_app/resources/app_icons.dart';

class DatabaseData {
  static const List<String> incomeCategories = [
    'Salary',
    'Gifts',
    'Wages',
    'Interest',
    'Savings',
    'Allowance',
  ];
  static const List<String> expenseCategories = [
    'Groceries',
    'Restaurant',
    'Electronics',
    'Gifts',
    'Bar & Cafe',
    'Health',
    'Commute',
    'Laundry',
    'Liquor',

  ];
  static const Map<String, Map<String, String>> incomeIcons = {
    'money': {'color': 'FFCCBC', 'icon': AppIcons.sport},
    'giftcard': {'color': 'E1BEE7', 'icon': AppIcons.gifts},
    'donation': {'color': 'FFF9C4', 'icon': AppIcons.donate},
    'institute': {'color': 'FFE0B2', 'icon': AppIcons.institute},
    'savings': {'color': 'C5CAE9', 'icon': AppIcons.savings},
    'allowance': {'color': 'C8E6C9', 'icon': AppIcons.money},
  };
  static const Map<String, Map<String, String>> expenseIcons = {
    'groceries': {'color': 'C8E6C9', 'icon': AppIcons.groceries},
    'cafe': {'color': 'FFECB3', 'icon': AppIcons.cafe},
    'electronics': {'color': 'FFCDD2', 'icon': AppIcons.electronics},
    'gifts': {'color': 'E1BEE7', 'icon': AppIcons.gifts},
    'laundry': {'color': 'B3E5FC', 'icon': AppIcons.laundry},
    'liquor': {'color': 'DCEDC8', 'icon': AppIcons.liquor},
    'health': {'color': 'B39DDB', 'icon': AppIcons.health},
    'restaurant': {'color': 'C8E6C9', 'icon': AppIcons.restaurant},
    'Commute': {'color': 'C8E6C9', 'icon': AppIcons.transportation},
  };
  static const Map<String, Map<String, String>> allIcons = {
    'groceries': {'color': 'C8E6C9', 'icon': AppIcons.groceries},
    'cafe': {'color': 'FFECB3', 'icon': AppIcons.cafe},
    'electronics': {'color': 'FFCDD2', 'icon': AppIcons.electronics},
    'gifts': {'color': 'E1BEE7', 'icon': AppIcons.gifts},
    'laundry': {'color': 'B3E5FC', 'icon': AppIcons.laundry},
    'liquor': {'color': 'DCEDC8', 'icon': AppIcons.liquor},
    'health': {'color': 'B39DDB', 'icon': AppIcons.health},
    'restaurant': {'color': 'C8E6C9', 'icon': AppIcons.restaurant},
    'Commute': {'color': 'C8E6C9', 'icon': AppIcons.transportation},
    'money': {'color': 'FFCCBC', 'icon': AppIcons.money},
    'giftcard': {'color': 'E1BEE7', 'icon': AppIcons.gifts},
    'donation': {'color': 'FFF9C4', 'icon': AppIcons.donate},
    'institute': {'color': 'FFE0B2', 'icon': AppIcons.institute},
    'savings': {'color': 'C5CAE9', 'icon': AppIcons.savings},
    'education': {'color': 'C8E6C9', 'icon': AppIcons.education},
    'fuel': {'color': 'D7CCC8', 'icon': AppIcons.fuel},
    'maintenance': {'color': 'B39DDB', 'icon': AppIcons.maintenance},
    'party': {'color': 'BBDEFB', 'icon': AppIcons.party},
    'self_development': {'color': 'CFD8DC', 'icon': AppIcons.selfDevelopment},







  };
}