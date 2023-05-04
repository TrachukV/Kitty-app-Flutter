import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty_app/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:kitty_app/generated/locale_keys.g.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/screens/create_category_screen/create_category_screen.dart';
import 'package:kitty_app/screens/edit_category_screen/edit_category_screen.dart';
import 'package:kitty_app/screens/widgets/icon_view.dart';

import '../../blocs/database_bloc/database_bloc.dart';

class ManageScreen extends StatelessWidget {
  const ManageScreen({Key? key}) : super(key: key);
  static const routeName = 'manage_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.category_name.tr(),
          style: AppTextStyles.blackRegular,
        ),
        backgroundColor: AppColors.grey,
        elevation: 0,
        leadingWidth: 50,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            child: Icon(
              Icons.arrow_back,
              color: AppColors.black,
            ),
            onTap: () {
              context.read<NavigationBloc>().add(
                    NavigationPopEvent(),
                  );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<NavigationBloc>().add(NavigateTabEvent(tabIndex: 4, route: CreateCategoryScreen.routeName));
        },
        label: Text(
          LocaleKeys.add_category.tr(),
          style: AppTextStyles.whiteRegular,
        ),
        backgroundColor: AppColors.blue,
      ),
      body: BlocBuilder<DatabaseBloc, DatabaseState>(
        builder: (context, state) {
          return ReorderableListView.builder(
              onReorderStart: (_) {
                HapticFeedback.vibrate();
              },
              itemBuilder: (context, index) {
                return ListTile(
                  key: ValueKey(index),
                  leading: IconView(
                    icon: state.expensesCategories[index].icon.pathToIcon,
                    color: state.expensesCategories[index].icon.color,
                  ),
                  title: Text(
                    state.expensesCategories[index].title,
                    style: AppTextStyles.blackRegular,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {
                          context
                              .read<NavigationBloc>()
                              .add(NavigateTabEvent(tabIndex: 7, route: EditCategoryScreen.routeName));
                          context.read<DatabaseBloc>().add(
                                GetEditCategoryEvent(
                                  editCategory: state.expensesCategories[index],
                                ),
                              );
                        },
                        child: Text(
                          LocaleKeys.edit.tr(),
                          style: AppTextStyles.blueRegular,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.drag_indicator_outlined,
                        color: AppColors.grey,
                      )
                    ],
                  ),
                );
              },
              itemCount: state.expensesCategories.length,
              onReorder: (
                oldIndex,
                newIndex,
              ) {
                context.read<DatabaseBloc>().add(DragCategoriesEvent(
                      oldIndex: oldIndex,
                      newIndex: newIndex,
                    ));
              });
        },
      ),
    );
  }
}
