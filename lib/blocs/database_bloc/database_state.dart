part of 'database_bloc.dart';

class DatabaseState extends Equatable {
  final List<ExpenseCategoryModel> expensesCategories;
  final List<IncomeCategoryModel> incomeCategories;
  final IncomeModel incomes;
  final ExpensesModel expenses;
  final BalanceModel balance;
  final List<IconModel> icons;
  final String transactionType;
  final String category;
  final double amount;

  const DatabaseState({
    this.amount = 0,
    this.category = '',
    this.transactionType = '',
    this.expensesCategories = const [],
    this.incomeCategories = const [],
    this.incomes = const IncomeModel(
      income: 0,
      currentMonth: '01',
    ),
    this.icons = const [],
    this.balance = const BalanceModel(
      actualBalance: 0,
      currentMonth: '01',
    ),
    this.expenses = const ExpensesModel(
      totalExpenses: 0,
      currentMonth: '01',
    ),
  });

  DatabaseState copyWith(
      {String? category,
      String? transactionType,
      double? amount,
      List<ExpenseCategoryModel>? expensesCategories,
      List<IncomeCategoryModel>? incomeCategories,
      BalanceModel? balance,
      IncomeModel? income,
      ExpensesModel? expenses,
      List<IconModel>? icons}) {
    return DatabaseState(
      amount: amount ?? this.amount,
      category: category ?? this.category,
      transactionType: transactionType ?? this.transactionType,
      expensesCategories: expensesCategories ?? this.expensesCategories,
      incomeCategories: incomeCategories ?? this.incomeCategories,
      balance: balance ?? this.balance,
      expenses: expenses ?? this.expenses,
      icons: icons ?? this.icons,
    );
  }

  @override
  List<Object?> get props =>
      [expensesCategories, incomeCategories, icons, expenses, balance, transactionType, category, amount];
}
