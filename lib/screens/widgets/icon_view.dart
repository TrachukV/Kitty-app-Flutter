import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitty_app/utils/helpers/helpers.dart';

class IconView extends StatelessWidget {
  const IconView({
    Key? key,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final String icon;
  final String color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: fromHex(color),
      ),
      child: SvgPicture.asset(icon),
    );
  }
}