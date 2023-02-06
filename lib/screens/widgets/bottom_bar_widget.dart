import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/generated/locale_keys.g.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_icons.dart';
import 'package:kitty_app/resources/app_text_styles.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
    required this.onSelect,
    required this.currentTab,
  });

  final void Function(int) onSelect;
  final int currentTab;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(

      height: height / 10,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(width: 2, color: AppColors.grey),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ItemButton(
            title: LocaleKeys.stats.tr(),
            iconPressed: AppIcons.blackChartPressed,
            iconNotPressed: AppIcons.blackChartNotPressed,
            onPressed: () {
              widget.onSelect(1);
            },
            isActive: widget.currentTab == 1,
          ),
          ItemButton(
            title: LocaleKeys.home.tr(),
            iconPressed: AppIcons.blackHomePressed,
            iconNotPressed: AppIcons.blackHomeNotPressed,
            onPressed: () {
              context.read<DatabaseBloc>().add(HomeScreenInitialEvent());
              widget.onSelect(0);
            },
            isActive: widget.currentTab == 0,
          ),
          ItemButton(
            title: LocaleKeys.settings.tr(),
            iconPressed: AppIcons.blackSettingsPressed,
            iconNotPressed: AppIcons.blackSettingsNotPressed,
            onPressed: () {
              widget.onSelect(2);
            },
            isActive: widget.currentTab == 2,
          ),
        ],
      ),
    );
  }
}

class ItemButton extends StatelessWidget {
  final String title;
  final SvgPicture iconPressed;
  final SvgPicture iconNotPressed;
  final VoidCallback onPressed;
  final bool isActive;

  const ItemButton({
    super.key,
    required this.title,
    required this.iconPressed,
    required this.iconNotPressed,
    required this.onPressed,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isActive ? iconPressed : iconNotPressed,
          Text(
            title,
            style: AppTextStyles.blackBottom,
          ),
        ],
      ),
    );
  }
}