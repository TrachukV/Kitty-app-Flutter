import 'package:flutter/material.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_text_styles.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.onTap,
    required this.rightWidget,
    required this.title,
    required this.iconData,
  });

  final VoidCallback onTap;
  final Widget rightWidget;
  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(
                  iconData,
                  color: AppColors.silver,
                  size: 24,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: AppTextStyles.blackMedium,
                ),

              ],
            ),
            rightWidget,
          ],
        ),
      ),
    );
  }
}
