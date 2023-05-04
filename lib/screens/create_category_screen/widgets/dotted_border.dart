import 'dart:math';

import 'package:flutter/material.dart';

class DottedBorderPainter extends CustomPainter {
  Color lineColor = Colors.transparent;
  Color completeColor;
  double width;

  DottedBorderPainter({required this.completeColor, required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint complete = Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 1);
    var percent = (size.width * 0.001) / 1;

    double arcAngle = 1 * pi * percent;

    for (var i = 0; i < 20; i++) {
      var init = (-pi / 10) * (i / 1);

      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), init,
          arcAngle, false, complete);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class DottedBorderWidget extends StatelessWidget {
  final Color color;
  final double size;
  final double width;
  final Widget icon;

  const DottedBorderWidget({
    Key? key,
    this.color = Colors.blue,
    this.size = 70,
    this.width = 7.0,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          icon,
          CustomPaint(
            size: Size(size, size),
            foregroundPainter:
                DottedBorderPainter(completeColor: color, width: width),
          ),
        ],
      ),
    );
  }
}
