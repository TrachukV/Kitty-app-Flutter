import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitty_app/resources/app_icons.dart';
import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/services/auth_services.dart';

Future<bool> authenticateIsAvailable() async {
  final isAvailable = await LocalAuth.canAuthenticate();
  final isDeviceSupported = await LocalAuth.supported();
  return isAvailable && isDeviceSupported;
}

class AppBarPinWidget extends StatelessWidget {
  const AppBarPinWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          AppIcons.kittiLogo,
          height: 120,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: AppTextStyles.greyBold,
        ),
      ],
    );
  }
}
