part of 'database_bloc.dart';

class DatabaseState extends Equatable {
  final List<ExpenseCategoryModel> expensesCategories;
  final List<IncomeCategoryModel> incomeCategories;
  final IncomeModel incomes;
  final ExpensesModel expenses;
  final BalanceModel balance;
  final List<IconModel> icons;

  const DatabaseState({
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

  DatabaseState copyWith({
    List<ExpenseCategoryModel>? expensesCategories,
    List<IncomeCategoryModel>? incomeCategories,
    BalanceModel? balance,
    IncomeModel? income,
    ExpensesModel? expenses,
    List<IconModel>? icons


  }) {
   return DatabaseState(
     expensesCategories: expensesCategories ?? this.expensesCategories,
     incomeCategories: incomeCategories ?? this.incomeCategories,
     balance: balance ?? this.balance,
     expenses: expenses ?? this.expenses,
     icons: icons ?? this.icons,
   );
  }

  @override
  List<Object?> get props => [expensesCategories, incomeCategories, icons, expenses, balance];
}
