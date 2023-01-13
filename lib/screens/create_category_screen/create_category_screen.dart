import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_icons.dart';
import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/screens/create_category_screen/widgets/dotted_border.dart';

class CreateCategoryScreen extends StatefulWidget {
  const CreateCategoryScreen({Key? key}) : super(key: key);
  static const routeName = 'create_category_screen';

  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
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
              'Add new category',
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (state.pathToIcon.isEmpty)
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
                                  categories: state.allModels,
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
                      SvgPicture.asset(state.pathToIcon),
                    SizedBox(
                      height: height / 12,
                      width: width / 1.5,
                      child: TextFormField(
                        textInputAction: TextInputAction.go,
                        onChanged: (newCategory) {
                          context.read<DatabaseBloc>().add(
                                GetNewCategoryEvent(newCategory: newCategory),
                              );
                        },
                        onTap: () {
                          _closeBottomSheet();
                          setState(() {
                            isActive = false;
                          });
                        },
                        keyboardType: TextInputType.phone,
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
                ),
                SizedBox(
                  height: height / 3,
                ),
                GestureDetector(
                  onTap: (){
                    context.read<DatabaseBloc>().add(ClearEvent());
                    context.read<NavigationBloc>().add(
                      NavigateTabEvent(tabIndex: 0, route: CreateCategoryScreen.routeName),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    height: height / 14,
                    width: width / 1.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: state.newCategory.isEmpty || state.pathToIcon.isEmpty ? AppColors.sonicSilver : AppColors.blue,
                    ),
                    child: Center(
                        child: Text(
                      'Add new category',
                      style: AppTextStyles.whiteRegular,
                    )),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class IconSelections extends StatelessWidget {
  final List categories;
  final Widget? addCategoryButton;

  const IconSelections({
    Key? key,
    required this.categories,
    this.addCategoryButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppIcons.blackDrag,
            const SizedBox(height: 10),
            Text(
              'CHOOSE CATEGORY ICON',
              style: AppTextStyles.blackTitle,
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1.7,
                  ),
                  itemCount: categories.length,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        context.read<DatabaseBloc>().add(
                              GetIconEvent(pathToIcon: categories[index].icon.pathToIcon),
                            );
                      },
                      child: SvgPicture.asset(categories[index].icon.pathToIcon),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
