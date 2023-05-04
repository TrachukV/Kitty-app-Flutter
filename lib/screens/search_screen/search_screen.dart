import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty_app/blocs/database_bloc/database_bloc.dart';
import 'package:kitty_app/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:kitty_app/generated/locale_keys.g.dart';
import 'package:kitty_app/resources/app_colors.dart';
import 'package:kitty_app/resources/app_text_styles.dart';
import 'package:kitty_app/screens/home_screen/widgets/transactionsHistoryWidget.dart';
import 'package:kitty_app/screens/search_screen/widgets/category_for_search_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const routeName = 'search_screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String searchedValue = '';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        context.read<DatabaseBloc>().add(CategoriesForSearchEvent());
        return Scaffold(
            body: SafeArea(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      onFieldSubmitted: (v) {
                        if (_searchController.text.isNotEmpty) {
                          context.read<DatabaseBloc>().add(
                            SaveHistoryElementEvent(
                              searchController: _searchController.text,
                            ),
                          );
                        }

                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      textInputAction: TextInputAction.search,
                      controller: _searchController,
                      onEditingComplete: () {},
                      onChanged: (String value) {
                        context.read<DatabaseBloc>().add(
                          TransactionSearchEvent(searchedValue: value),
                        );
                      },
                      cursorWidth: 1,
                      cursorColor: AppColors.black,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: IconButton(
                              onPressed: () {
                                context.read<DatabaseBloc>().add(HomeScreenInitialEvent());
                                context.read<NavigationBloc>().add(NavigationPopEvent());
                                context.read<DatabaseBloc>().add(ClearSearchList());
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: AppColors.black,
                              )),
                          hintText: LocaleKeys.search.tr(),
                          hintStyle: AppTextStyles.greyRegular),
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.separated(
                          key: ValueKey(state.selectedCategories.length),
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 8),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return CategoryForSearchItem(
                              searchedValue: searchedValue,
                              icon: state.categoriesForSearch[index].icon.pathToIcon,
                              title: state.categoriesForSearch[index].title,
                              categoryId: state.categoriesForSearch[index].categoryId,
                              isActive: state.selectedCategories.contains(state.categoriesForSearch[index].categoryId),
                              icons: state.categoriesForSearch[index].icon,
                            );
                          },
                          separatorBuilder: (_, __) {
                            return const SizedBox(
                              width: 12,
                            );
                          },
                          itemCount: state.categoriesForSearch.length),
                    ),
                    Container(
                      height: 1,
                      color: AppColors.grey,
                      width: double.infinity,
                    ),
                    if (state.selectedCategories.isEmpty && state.searchedValue.isEmpty) ...[
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.searchHistory.length,
                          padding: const EdgeInsets.all(16),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                context
                                    .read<DatabaseBloc>()
                                    .add(TransactionSearchEvent(searchedValue: state.searchHistory[index]));
                                _searchController.text = state.searchHistory[index];
                              },
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.history,
                                    color: AppColors.sonicSilver,
                                  ),
                                  SizedBox(width: width / 15),
                                  Expanded(
                                    child: Text(
                                      state.searchHistory[index],
                                      style: AppTextStyles.blackMedium,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.north_west,
                                      color: AppColors.sonicSilver,
                                    ),
                                    onPressed: () {},
                                  ),


                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ] else
                      ...[
                        const TransactionHistoryWidget(
                          page: 'search',
                        ),
                      ]
                  ],
                ),
              ),
            ));
      },
    );
  }
}
