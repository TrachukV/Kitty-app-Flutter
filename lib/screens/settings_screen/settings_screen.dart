import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_icons.dart';
import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/screens/cart_screen/chart_screen.dart';

import '../../repository/database_repository.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = 'settings_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        return ChartWidget(
          statistics: state.statisticsModels,
        );
      },
    );
  }
}
