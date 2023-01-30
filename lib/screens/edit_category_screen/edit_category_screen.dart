import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/screens/create_category_screen/create_category_screen.dart';

class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({Key? key}) : super(key: key);
  static const routeName = 'edit_category_screen';

  @override
  Widget build(BuildContext context) {
    final TextEditingController _categoryController = TextEditingController();
    PersistentBottomSheetController? _bottomSheetController;

    void _closeBottomSheet() {
      if (_bottomSheetController != null) {
        _bottomSheetController!.close();
      }
    }

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: ValueListenableBuilder(
            valueListenable: _categoryController,
            builder: (BuildContext context, TextEditingValue value, Widget? child) {
              return ElevatedButton(
                style: AppTextStyles.buttonStyle,
                onPressed: state.selectedIcon != null && value.text.isNotEmpty
                    ? () {
                        context.read<DatabaseBloc>().add(
                              EditCategoryEvent(
                                editTitle: _categoryController.text,
                                editIcon: state.selectedIcon!,
                              ),
                            );
                        context.read<NavigationBloc>().add(
                          NavigationPopEvent(),
                        );
                      }
                    : null,
                child: SizedBox(
                  width: width * 0.9,
                  child: const Center(
                    heightFactor: 1,
                    child: Text('Add new category'),
                  ),
                ),
              );
            },
          ),
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              'Edit category',
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
                  _closeBottomSheet();
                  context.read<NavigationBloc>().add(
                        NavigationPopEvent(),
                      );
                },
              ),
            ),
          ),
          body: SingleChildScrollView(
            reverse: true,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                SizedBox(
                  height: height / 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _bottomSheetController = showBottomSheet(
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            context: context,
                            constraints: BoxConstraints(maxHeight: height / 2),
                            // isScrollControlled: true,
                            enableDrag: false,
                            builder: (_) {
                              return IconSelections(
                                iconModels: state.icons,
                              );
                            });
                      },
                      child: SvgPicture.asset(
                        state.selectedIcon == null
                            ? state.editCategory!.icon.pathToIcon
                            : state.selectedIcon!.pathToIcon,
                      ),
                    ),
                    SizedBox(
                      height: height / 12,
                      width: width / 1.5,
                      child: TextFormField(
                        controller: _categoryController..text = state.editCategory!.title,
                        textInputAction: TextInputAction.go,
                        style: AppTextStyles.blackRegular,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: AppColors.sonicSilver, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(color: AppColors.blue, width: 1)),
                          labelText: 'Category name',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
