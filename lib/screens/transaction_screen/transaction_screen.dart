import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_icons.dart';
import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/screens/home_screen/home_screen.dart';


class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);
  static const routeName = 'transaction_screen';

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  List<String> typeTransaction = ['Expenses', 'Income'];
  String? value;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                  context.read<NavigationBloc>().add(
                        NavigateTab(
                          tabIndex: 0,
                          route: HomeScreen.routeName,
                        ),
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
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                width: width / 1.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.grey, width: 2),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(4),
                    elevation: 1,
                    value: value,
                    isExpanded: true,
                    icon: AppIcons.blackDropDown,
                    items: typeTransaction.map(buildMenuItem).toList(),
                    onChanged: (
                      String? value,
                    ) =>
                        setState(
                      () => this.value = value,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: width / 1.1,
                child: TextFormField(
                  onTap: () {
                    showBottomSheet(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        context: context,
                        constraints: BoxConstraints(maxHeight: height / 2),
                        // isScrollControlled: true,
                        enableDrag: false,
                        builder: (_) {
                          return ExpensesCategorySelections();
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
                  style: AppTextStyles.blackRegular,
                  decoration: InputDecoration(
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
                height: height / 6,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: height / 14,
                  width: width / 1.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.blue,
                  ),
                  child: Center(
                      child: Text(
                    'Add new expense',
                    style: AppTextStyles.whiteRegular,
                  )),
                ),
              )
            ],
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

//
class ExpensesCategorySelections extends StatelessWidget {
  const ExpensesCategorySelections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'CHOOSE CATEGORY',
                style: AppTextStyles.blackTitle,
              ),
              SingleChildScrollView(
                child: GridView.builder(

                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,

                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                    ),
                    itemCount: state.expensesCategories.length,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      return ChoiceCategoryWidget(
                        icon: SvgPicture.asset(state.expensesCategories[index].icon.pathToIcon),
                        nameCategory: state.expensesCategories[index].title,
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

class ChoiceCategoryWidget extends StatelessWidget {
  const ChoiceCategoryWidget({
    super.key,
    required this.icon,
    required this.nameCategory,
  });

  final SvgPicture icon;
  final String nameCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        Text(
          nameCategory,
          style: AppTextStyles.blackBottom,
        ),
      ],
    );
  }
}

