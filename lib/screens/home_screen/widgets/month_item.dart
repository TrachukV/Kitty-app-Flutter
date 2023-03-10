import 'package:flutter/material.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_text_styles.dart';

class MonthItem extends StatefulWidget {
  final String month;
  final VoidCallback onTap;
  final bool isActive;

  const MonthItem({
    Key? key,
    required this.month,
    required this.onTap,
    required this.isActive,
  }) : super(key: key);

  @override
  State<MonthItem> createState() => _MonthItemState();
}

class _MonthItemState extends State<MonthItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: widget.onTap,
        child: widget.isActive
            ? Container(
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
                width: double.infinity,
                child: Center(
                  child: Text(
                    widget.month,
                    style: AppTextStyles.whiteRegular,
                  ),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.grey,
                    )),
                padding: const EdgeInsets.symmetric(vertical: 8),
                width: double.infinity,
                child: Center(
                  child: Text(
                    widget.month,
                    style: AppTextStyles.blackRegular,
                  ),
                ),
              ),
      ),
    );
  }
}
