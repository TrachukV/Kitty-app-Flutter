import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:kitty_app/generated/locale_keys.g.dart';
import 'package:kitty_app/models/icon_model/icon_model.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_icons.dart';
import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/screens/create_category_screen/widgets/dotted_border.dart';
import 'package:kitty_app/screens/home_screen/home_screen.dart';
import 'package:kitty_app/utils/constants/database_data.dart';

class CreateCategoryScreen extends StatefulWidget {
  const CreateCategoryScreen({Key? key}) : super(key: key);
  static const routeName = 'create_category_screen';

  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
  final TextEditingController _categoryController = TextEditingController();
  PersistentBottomSheetController? _bottomSheetController;
  bool isActive = false;

  void _closeBottomSheet() {
    if (_bottomSheetController != null) {
      _bottomSheetController!.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              LocaleKeys.add_category.tr(),
              style: AppTextStyles.blackRegular,
            ),
            backgroundColor: AppColors.grey,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.black,
                ),
                onTap: () {
                  context.read<DatabaseBloc>().add(ClearDatabaseEvent());
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (state.selectedIcon!.pathToIcon.isEmpty)
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
                          setState(() {
                            isActive = true;
                          });
                        },
                        child: DottedBorderWidget(
                          width: 1,
                          size: 50,
                          color: isActive ? AppColors.blue : AppColors.silver,
                          icon: Icon(
                            Icons.add_circle,
                            size: 30,
                            color: AppColors.silver,
                          ),
                        ),
                      )
                    else
                      SvgPicture.asset(
                        state.selectedIcon!.pathToIcon,
                        width: 55,
                      ),
                    SizedBox(
                      height: height / 12,
                      width: width / 1.5,
                      child: TextFormField(
                        controller: _categoryController,
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
                          labelText: LocaleKeys.category_name.tr(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 3,
                ),
              ],
            ),
          ),
          floatingActionButton: ValueListenableBuilder(
            valueListenable: _categoryController,
            builder: (BuildContext context, TextEditingValue value, Widget? child) {
              return ElevatedButton(
                style: AppTextStyles.buttonStyle,
                onPressed:  state.selectedIcon != null && value.text.isNotEmpty ? () {
                  showSnackBar(context);
                context.read<DatabaseBloc>().add(CreateCategoryEvent(categoryName: value.text, categoryType: DatabaseData.categoryType));
                context.read<NavigationBloc>().add(NavigateTabEvent(tabIndex: 0, route: HomeScreen.routeName));
              } : null,
                child: SizedBox(
                  width: width * 0.9,
                  child:  Center(heightFactor: 1, child: Text(LocaleKeys.add_category.tr())),
                ),
              );
            },
          ),
        );
      },
    );
  }
  void showSnackBar(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.add_category.tr(),
            style: AppTextStyles.whiteRegular,
          ),
          GestureDetector(
            onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            child: Icon(
              Icons.close,
              color: AppColors.grey,
            ),
          )
        ],
      ),
      margin: EdgeInsets.only(bottom: height / 1.5),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.black,
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }
}

class IconSelections extends StatelessWidget {
  final List<IconModel> iconModels;
  final Widget? addCategoryButton;

  const IconSelections({
    Key? key,
    required this.iconModels,
    this.addCategoryButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ]),
          child: Column(
            children: [
              AppIcons.blackDrag,
              const SizedBox(height: 10),
              Text(
                LocaleKeys.choose_category.tr(),
                style: AppTextStyles.blackTitle,
              ),
              const SizedBox(height: 10),
              Flexible(
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1.7,
                    ),
                    itemCount: iconModels.length,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          context.read<DatabaseBloc>().add(
                                GetIconEvent(selectedIcon: iconModels[index]),
                              );
                        },
                        child: SvgPicture.asset(iconModels[index].pathToIcon),
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }

}
