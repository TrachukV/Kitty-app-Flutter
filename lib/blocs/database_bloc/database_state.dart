part of 'database_bloc.dart';

class DatabaseState extends Equatable {
  final List<TransactionsCategoriesModel> expensesCategories;
  final List<TransactionsCategoriesModel> incomeCategories;
  final List<TransactionModel> transaction;
  final List<IconModel> icons;
  final TransactionsCategoriesModel? createdCategory;
  final TransactionsCategoriesModel? editCategory;
  final IconModel? selectedIcon;
  final BalanceModel balance;
  final Map<String, List<TransactionModel>> mapTransactions;
  final int activeMonth;
  final List<StatisticsModel> statisticsModels;
  final List<TransactionsCategoriesModel> categoriesForSearch;
  final List<int> selectedCategories;
  final String searchedValue;
  final List<String> searchHistory;

  const DatabaseState({
    this.editCategory,
    this.searchHistory = const [],
    this.searchedValue = '',
    this.selectedCategories = const [],
    this.categoriesForSearch = const [],
    this.statisticsModels = const [],
    this.activeMonth = 0,
    this.mapTransactions = const {},
    this.incomeCategories = const [],
    this.expensesCategories = const [],
    this.transaction = const [],
    this.icons = const [],
    this.createdCategory = DatabaseBloc.zeroCategory,
    this.selectedIcon = DatabaseBloc.zeroIcon,
    this.balance = const BalanceModel(
      income: 0,
      expenses: 0,
      actualBalance: 0,
    ),
  });

  DatabaseState copyWith({
    TransactionsCategoriesModel? createdCategory,
    List<String>? searchHistory,
    String? searchedValue,
    List<int>? selectedCategories,
    List<TransactionsCategoriesModel>? categoriesForSearch,
    List<StatisticsModel>? statisticsModels,
    int? activeMonth,
    Map<String, List<TransactionModel>>? mapTransactions,
    List<TransactionsCategoriesModel>? expensesCategories,
    List<TransactionsCategoriesModel>? incomeCategories,
    List<TransactionModel>? transaction,
    List<IconModel>? icons,
    IconModel? selectedIcon,
    TransactionsCategoriesModel? editCategory,
    BalanceModel? balance,
  }) {
    return DatabaseState(
      editCategory: editCategory ?? this.editCategory,
      searchHistory: searchHistory ?? this.searchHistory,
      searchedValue: searchedValue ?? this.searchedValue,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      categoriesForSearch: categoriesForSearch ?? this.categoriesForSearch,
      statisticsModels: statisticsModels ?? this.statisticsModels,
      balance: balance ?? this.balance,
      activeMonth: activeMonth ?? this.activeMonth,
      mapTransactions: mapTransactions ?? this.mapTransactions,
      expensesCategories: expensesCategories ?? this.expensesCategories,
      incomeCategories: incomeCategories ?? this.incomeCategories,
      transaction: transaction ?? this.transaction,
      icons: icons ?? this.icons,
      createdCategory: createdCategory ?? this.createdCategory,
      selectedIcon: selectedIcon ?? this.selectedIcon,
    );
  }

  @override
  List<Object?> get props => [
    editCategory,
        searchHistory,
        searchedValue,
        selectedCategories,
        categoriesForSearch,
        statisticsModels,
        activeMonth,
        expensesCategories,
        incomeCategories,
        icons,
        selectedIcon,
        transaction,
        createdCategory,
        mapTransactions,
        balance,
      ];
}
