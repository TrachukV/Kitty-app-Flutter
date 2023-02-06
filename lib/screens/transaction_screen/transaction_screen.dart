import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:kitty_app/generated/locale_keys.g.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_icons.dart';
import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/screens/create_category_screen/create_category_screen.dart';
import 'package:kitty_app/screens/home_screen/home_screen.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);
  static const routeName = 'transaction_screen';

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String _amount = '';
  String _description = '';
  final TextEditingController _descriptionController = TextEditingController();
  PersistentBottomSheetController? _bottomSheetController;
  final FocusNode focusNode = FocusNode();
  String selectedType = LocaleKeys.transaction.tr();

  void _closeBottomSheet() {
    if (_bottomSheetController != null) {
      _bottomSheetController!.close();
    }
  }

  void _editingComplete() {
    setState(() {
      if (FocusScope.of(context).hasFocus) {
        FocusScope.of(context).unfocus();
      }
    });
  }

  PersistentBottomSheetController<dynamic> bottomSheet(BuildContext context, DatabaseState state) {
    final height = MediaQuery.of(context).size.height;
    return showBottomSheet(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        context: context,
        constraints: BoxConstraints(maxHeight: height / 2),
        // isScrollControlled: true,
        enableDrag: false,
        builder: (_) {
          if (selectedType == LocaleKeys.expenses.tr()) {
            return CategorySelections(
              categories: state.expensesCategories,
              addCategoryButton: OutlinedButton(
                  onPressed: () {
                    context.read<NavigationBloc>().add(
                          NavigateTabEvent(tabIndex: 4, route: CreateCategoryScreen.routeName),
                        );
                  },
                  child: Text(
                    LocaleKeys.add_category.tr(),
                    style: AppTextStyles.blueRegular,
                  )),
            );
          } else if (selectedType == LocaleKeys.income.tr()) {
            return CategorySelections(
              categories: state.incomeCategories,
            );
          }
          return const SizedBox.shrink();
        });
  }

  List<String> typeTransaction = [
    LocaleKeys.expenses.tr(),
    LocaleKeys.income.tr(),
  ];
  String? value;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        _closeBottomSheet();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            LocaleKeys.add_smth.tr(),
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
          child: Center(
            child: BlocBuilder<DatabaseBloc, DatabaseState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      DropdownButtonFormField(
                        onTap: _closeBottomSheet,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: AppColors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(color: AppColors.blue, width: 1)),
                        ),
                        hint:  Text(
                          LocaleKeys.select.tr(),
                        ),
                        borderRadius: BorderRadius.circular(8),
                        elevation: 1,
                        isExpanded: true,
                        icon: AppIcons.blackDropDown,
                        items: typeTransaction.map(buildMenuItem).toList(),
                        onChanged: (value) {
                          if (state.createdCategory != null) {
                            context.read<DatabaseBloc>().add(ClearDatabaseEvent());
                          }
                          setState(() {
                            selectedType = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          labelText: LocaleKeys.category_name.tr(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: AppColors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(color: AppColors.blue, width: 1)),
                        ),
                        readOnly: true,
                        controller: _categoryController..text = (state.createdCategory?.title ?? ''),
                        onTap: () {
                          _bottomSheetController = bottomSheet(context, state);
                        },
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        onChanged: (amount) {
                          _amount = amount;
                        },
                        decoration: InputDecoration(
                          labelText: LocaleKeys.enter_amount.tr(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: AppColors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(color: AppColors.blue, width: 1)),
                        ),
                        onTap: _closeBottomSheet,
                        textInputAction: TextInputAction.go,
                        onEditingComplete: _editingComplete,
                        keyboardType: TextInputType.number,
                        controller: _amountController,
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        onChanged: (description) {
                          _description = description;
                        },
                        decoration: InputDecoration(
                          labelText: LocaleKeys.description.tr(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: AppColors.grey, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(color: AppColors.blue, width: 1)),
                        ),
                        onTap: _closeBottomSheet,
                        onEditingComplete: _editingComplete,
                        controller: _descriptionController,
                      ),
                      SizedBox(
                        height: height / 10,
                      ),
                      ValueListenableBuilder(
                        valueListenable: _amountController,
                        builder: (BuildContext context, TextEditingValue value, Widget? child) {
                          return BlueButton(
                            selectedType: selectedType,
                            check: state.createdCategory != null && selectedType != 'type' && value.text.isNotEmpty,
                            callback: () {
                              context.read<DatabaseBloc>().add(
                                    GetCreatedTransaction(
                                        amount: selectedType == 'Expenses' ? '-${value.text}' : value.text,
                                        description: _description),
                                  );
                              context.read<DatabaseBloc>().add(DatabaseInitialEvent());
                              context
                                  .read<NavigationBloc>()
                                  .add(NavigateTabEvent(tabIndex: 0, route: HomeScreen.routeName));
                            },
                          );
                        },
                      ),
                    ],
                  ),
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
          child: Column(
            children: [
              AppIcons.blackDrag,
              const SizedBox(height: 10),
              Text(
                LocaleKeys.choose_icon.tr(),
                style: AppTextStyles.blackTitle,
              ),
              const SizedBox(height: 10),
              Flexible(
                child: GridView.builder(
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
                                GetCategoryEvent(
                                  transactionCategory: categories[index],
                                ),
                              );
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset(categories[index].icon.pathToIcon),
                        nameCategory: categories[index].title,
                      );
                    }),
              ),
              addCategoryButton ?? const SizedBox.shrink(),
            ],
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

class BlueButton extends StatelessWidget {
  const BlueButton({
    Key? key,
    required this.selectedType,
    this.check = false,
    required this.callback,
  }) : super(key: key);

  final String selectedType;
  final bool check;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: AppTextStyles.buttonStyle,
      onPressed: check ? callback : null,
      child: SizedBox(
        height: height / 14,
        width: width / 1.1,
        child: Center(
          child: Text('${LocaleKeys.add_new.tr()} $selectedType'),
        ),
      ),
    );
  }
}
