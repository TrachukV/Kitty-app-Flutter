import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_icons.dart';
import 'package:kitty_app/resources/app_text_styles.dart';


class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);
  static const routeName = 'transaction_screen';

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final TextEditingController _categoryController = TextEditingController();
  PersistentBottomSheetController? _bottomSheetController;
  final FocusNode focusNode = FocusNode();

  void _closeBottomSheet() {
    if (_bottomSheetController != null) {
      _bottomSheetController!.close();
    }
  }

  List<String> typeTransaction = ['Expenses', 'Income'];
  String? value;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        _closeBottomSheet();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.grey,
          elevation: 0,
          leadingWidth: 104,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  child: AppIcons.blackBack,
                  onTap: () {
                    _closeBottomSheet();
                    context.read<NavigationBloc>().add(
                          NavigationPopEvent(),
                        );
                  },
                ),
              ),
              Text(
                'Add new',
                style: AppTextStyles.blackRegular,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Center(
            child: BlocBuilder<DatabaseBloc, DatabaseState>(
              builder: (context, state) {
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      width: width / 1.1,
                      height: height / 11.1,
                      child: DropdownButtonFormField(
                        onTap: _closeBottomSheet,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: AppColors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(color: AppColors.blue, width: 2)),
                        ),
                        hint: const Text(
                          'Select category',
                        ),
                        borderRadius: BorderRadius.circular(4),
                        elevation: 1,
                        isExpanded: true,
                        icon: AppIcons.blackDropDown,
                        items: typeTransaction.map(buildMenuItem).toList(),
                        onChanged: (value) {
                          if (state.transactionType.isNotEmpty) {
                            context.read<DatabaseBloc>().add(ClearDatabaseEvent());
                          }
                          setState(() {
                            this.value = value!;
                            context.read<DatabaseBloc>().add(GetCategoryEvent(category: value));
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: width / 1.1,
                      child: TextFormField(
                        controller: _categoryController..text = state.transactionType,
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
                              builder: (_) { if(state.category == 'Expenses') {
                                CategorySelections(
                                  categories: state.expensesCategories,
                                  addCategoryButton: OutlinedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Add new category',
                                        style: AppTextStyles.blueRegular,
                                      )),
                                );
                              }
                              if(state.category == 'Income') {
                                return CategorySelections(
                                  categories: state.incomeCategories,
                                );
                              }
                                return const SizedBox.shrink();
                              });
                        },
                        style: AppTextStyles.blackRegular,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: AppColors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(color: AppColors.blue, width: 2)),
                          labelText: 'Category name',
                        ),
                        readOnly: true,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: width / 1.1,
                      child: TextFormField(
                        textInputAction: TextInputAction.go,
                        onChanged: (amount) {
                          context.read<DatabaseBloc>().add(GetAmountCategoryEvent(
                                amount: amount,
                              ));
                        },
                        onTap: () {},
                        keyboardType: TextInputType.phone,
                        style: AppTextStyles.blackRegular,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: AppColors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(color: AppColors.blue, width: 2)),
                          labelText: 'Amount',
                          hintText: 'Enter amount',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: width / 1.1,
                      child: TextFormField(
                        maxLength: 15,
                        textInputAction: TextInputAction.go,
                        onChanged: (description) {
                          context.read<DatabaseBloc>().add(
                                GetDescriptionCategoryEvent(description: description),
                              );
                        },
                        onTap: () {},
                        style: AppTextStyles.blackRegular,
                        decoration: InputDecoration(
                          counterText: '',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: AppColors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: AppColors.blue, width: 2),
                          ),
                          labelText: 'Description',
                          hintText: 'Description (Optional)',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        height: height / 14,
                        width: width / 1.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: state.transactionType.isEmpty || state.amount == 0 || state.category.isEmpty
                              ? AppColors.sonicSilver
                              : AppColors.blue,
                        ),
                        child: Center(
                            child: Text(
                          state.transactionType.isEmpty || state.amount == 0 || state.category.isEmpty
                              ? 'Complete the field'
                              : state.category == 'Income'
                                  ? 'Add new income'
                                  : 'Add new expense',
                          style: AppTextStyles.whiteRegular,
                        )),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(item),
    );
  }
}

class BlueButtonWidget extends StatelessWidget {
  const BlueButtonWidget({
    Key? key,
    required this.colorButton,
    required this.text,
  }) : super(key: key);

  final Color colorButton;
  final String text;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        height: height / 14,
        width: width / 1.1,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: colorButton),
        child: Center(
            child: Text(
          text,
          style: AppTextStyles.whiteRegular,
        )),
      ),
    );
  }
}

//
class CategorySelections extends StatelessWidget {
  final List categories;
  final Widget? addCategoryButton;

  const CategorySelections({
    Key? key,
    required this.categories,
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppIcons.blackDrag,
                const SizedBox(height: 10),
                Text(
                  'CHOOSE CATEGORY',
                  style: AppTextStyles.blackTitle,
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemCount: categories.length,
                      padding: const EdgeInsets.all(10),
                      itemBuilder: (context, index) {
                        return ChoiceCategoryWidget(
                          onTap: () {
                            context.read<DatabaseBloc>().add(
                                  GetTitleCategoryEvent(
                                    title: categories[index].title,
                                  ),
                                );
                            Navigator.pop(context);
                          },
                          // icon: SvgPicture.asset(state.expensesCategories[index].icon.pathToIcon),
                          // nameCategory: state.expensesCategories[index].title);

                          icon: SvgPicture.asset(categories[index].icon.pathToIcon),
                          nameCategory: categories[index].title,
                        );
                      }),
                ),
                addCategoryButton ?? const SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ChoiceCategoryWidget extends StatelessWidget {
  const ChoiceCategoryWidget({
    super.key,
    required this.icon,
    required this.nameCategory,
    required this.onTap,
  });

  final SvgPicture icon;
  final String nameCategory;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          Text(
            nameCategory,
            style: AppTextStyles.blackBottom,
          ),
        ],
      ),
    );
  }
}
