import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);
  static const routeName = 'chart_screen';

  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.now();


    var dt = DateTime.fromMillisecondsSinceEpoch(time.millisecondsSinceEpoch);

// 12 Hour format:
    var d12 = DateFormat('MM/dd/yyyy, hh:mm a').format(dt); // 12/31/2000, 10:00 PM

// 24 Hour format:
    var d24 = DateFormat('dd/MM/yyyy, HH:mm').format(dt); // 31/12/2000, 22:00
    print(time.millisecondsSinceEpoch);
    print(d12);
    print(d24);
return Container();
  }
}
