import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/models/icon_model/icon_model.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_text_styles.dart';

class CategoryForSearchItem extends StatefulWidget {
  CategoryForSearchItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.categoryId,
    required this.isActive,
    required this.searchedValue, required this.icons,
  }) : super(key: key);
  final String icon;
  final String title;
  final int categoryId;
  bool isActive;
  final String searchedValue;
  final IconModel icons;

  @override
  State<CategoryForSearchItem> createState() => _CategoryForSearchItemState();
}

class _CategoryForSearchItemState extends State<CategoryForSearchItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<DatabaseBloc>().add(
              CategorySearchSelectEvent(
                categoryId: widget.categoryId,
                searchedValue: '',
              ),
            );
        setState(() {
          widget.isActive = !widget.isActive;
        });
      },
      child: widget.isActive
          ? Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blue),
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.lifgtBlue),
              child: Row(
                children: [
                  Icon(
                    Icons.check,
                    color: AppColors.blue,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.title,
                    style: AppTextStyles.blackMedium,
                  )
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey),
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.white),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(widget.icon, color: AppColors.sonicSilver),
                  SizedBox(width: 5,),
                  Text(
                    widget.title,
                    style: AppTextStyles.blackMedium,
                  ),
                ],
              ),
            ),
    );
  }
}
