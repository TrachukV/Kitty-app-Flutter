part of 'database_bloc.dart';

class DatabaseState extends Equatable {
  final List<TransactionsCategoriesModel> expensesCategories;
  final List<TransactionsCategoriesModel> incomeCategories;
  final List<TransactionModel> transaction;
  final List<IconModel> icons;
  final TransactionsCategoriesModel? createdCategory;
  final IconModel? selectedIcon;
  final BalanceModel balance;
  final Map<String, List<TransactionModel>> mapTransactions;
  final int activeMonth;
  final List<StatisticsModel> statisticsModels;

  const DatabaseState({
    this.statisticsModels = const [],
    this.activeMonth = 0,
    this.mapTransactions = const {},
    this.incomeCategories = const [],
    this.expensesCategories = const [],
    this.transaction = const [],
    this.icons = const [],
    this.createdCategory,
    this.selectedIcon,
    this.balance = const BalanceModel(
      income: 0,
      expenses: 0,
      actualBalance: 0,
    ),
  });

  DatabaseState copyWith({
    List<StatisticsModel>? statisticsModels,
    int? activeMonth,
    Map<String, List<TransactionModel>>? mapTransactions,
    List<TransactionsCategoriesModel>? expensesCategories,
    List<TransactionsCategoriesModel>? incomeCategories,
    List<TransactionModel>? transaction,
    List<IconModel>? icons,
    IconModel? selectedIcon,
    TransactionsCategoriesModel? createdCategory,
    BalanceModel? balance,
  }) {
    return DatabaseState(
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
