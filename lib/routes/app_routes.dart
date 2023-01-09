import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kitty_app/screens/cart_screen/chart_screen.dart';
import 'package:kitty_app/screens/home_screen/home_screen.dart';
import 'package:kitty_app/screens/main_screen.dart';
import 'package:kitty_app/screens/settings_screen/settings_screen.dart';
import 'package:kitty_app/screens/splash_screen/splash_screen.dart';
import 'package:kitty_app/screens/transaction_screen/transaction_screen.dart';



class AppRouter {
  const AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    if (kDebugMode) {
      print(settings.name);
    }
    switch (settings.name) {
      // [START] Main pages
      // case AuthScreen.routeName:
      //   builder = (_) =>  const AuthScreen();
      //   break;
      case MainScreen.routeName:
        builder = (_) => MainScreen();
        break;
      case HomeScreen.routeName:
        builder = (_) => const HomeScreen();
        break;
      case ChartScreen.routeName:
        builder = (_) => const ChartScreen();
        break;
      case TransactionScreen.routeName:
        builder = (_) => const TransactionScreen();
        break;

      // [END] Main pages

      // [START] Settings pages
      case SettingsScreen.routeName:
        builder = (_) => const SettingsScreen();
        break;
      // [ENDS] Settings pages

      // [START] Registration pages

      // [END] Registration pages

      // [START] Splash Screen pages
      case SplashScreen.routeName:
        builder = (_) => const SplashScreen();
        break;
      // [END] Splash Screen pages

      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}