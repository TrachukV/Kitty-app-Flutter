import 'package:flutter/material.dart';

import 'package:kitty_app/resources/app_icons.dart';
import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/screens/widgets/calendar_widget.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);
  static const routeName = 'chart_screen';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 100,
        title: Text(
          'Statistics',
          style: AppTextStyles.blackBold,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
        ),
        actions: [
          GestureDetector(
            child: AppIcons.blackSearch,
          ),
          const SizedBox(width: 20),
          GestureDetector(child: AppIcons.blackMore),
          const SizedBox(width: 17),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.01,
          ),
           CalendarWidget(decrement: () {  }, increment: () {  }, selectMonth: () {  },)
        ]

      ),
    );
  }
}
