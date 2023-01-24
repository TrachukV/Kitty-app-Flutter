import 'package:flutter/material.dart';
import 'package:kitty_app/blocs/calendar_bloc/calendar_bloc.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:kitty_app/database/local_database.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_icons.dart';
import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/routes/app_routes.dart';
import 'package:kitty_app/screens/cart_screen/chart_screen.dart';
import 'package:kitty_app/screens/create_category_screen/create_category_screen.dart';
import 'package:kitty_app/screens/home_screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty_app/screens/settings_screen/settings_screen.dart';
import 'package:kitty_app/screens/transaction_screen/transaction_screen.dart';
import 'package:kitty_app/screens/widgets/bottom_bar_widget.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  static const routeName = '/main_screen';
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  static const List<String> _pages = [
    HomeScreen.routeName,
    ChartScreen.routeName,
    SettingsScreen.routeName,
    TransactionScreen.routeName,
    CreateCategoryScreen.routeName,
  ];

  Future<bool> _maybePop() async {
    return await _navigatorKey.currentState!.maybePop();
  }

  void _onSelectTab(int index) {
    if (_navigatorKey.currentState != null) {
      _navigatorKey.currentState!.pushNamedAndRemoveUntil(
        _pages[index],
        (_) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => DatabaseBloc(DBProvider())
        //     ..add(
        //       DatabaseInitialEvent(),
        //     ),
        // ),
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
      ],
      child: BlocConsumer<NavigationBloc, NavigationState>(
        listener: (context, state) {
          if (state.status == NavigationStateStatus.tab) {
            _onSelectTab(state.currentIndex);
          }
        },
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async {
              final bool maybePop = await _maybePop();
              if (!maybePop) {
                context.read<NavigationBloc>().add(NavigationPopEvent());
              }
              return maybePop;
            },
            child: Scaffold(
              key: _key,
              floatingActionButton: state.currentIndex == 0
                  ? FloatingActionButton.extended(
                      onPressed: () {
                        context.read<NavigationBloc>().add(
                              NavigateTabEvent(
                                tabIndex: 3,
                                route: TransactionScreen.routeName,
                              ),
                            );
                      },
                      label: Text('Add new', style: AppTextStyles.whiteRegular),
                      icon: AppIcons.whiteAddPlus,
                      backgroundColor: AppColors.blue,
                    )
                  : null,
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              bottomNavigationBar: state.currentIndex == 3 || state.currentIndex == 4
                  ? null
                  : BottomBar(
                      onSelect: (index) {
                        if (state.currentIndex != index) {
                          context.read<NavigationBloc>().add(
                                NavigateTabEvent(
                                  tabIndex: index,
                                  route: _pages[index],
                                ),
                              );
                        }
                      },
                      currentTab: state.currentIndex,
                    ),
              body: Navigator(
                key: _navigatorKey,
                initialRoute: HomeScreen.routeName,
                onGenerateRoute: AppRouter.generateRoute,
              ),
            ),
          );
        },
      ),
    );
  }
}
