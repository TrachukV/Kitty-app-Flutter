part of 'database_bloc.dart';

abstract class DatabaseEvent {}

class DatabaseInitialEvent extends DatabaseEvent {}

class CreateCategoryEvent extends DatabaseEvent {
  CreateCategoryEvent({
    required this.categoryName,
  });

  final String categoryName;
}

class GetExpensesCategoriesEvent extends DatabaseEvent {}

class GetAllModelsEvent extends DatabaseEvent {}

class GetIconEvent extends DatabaseEvent {
  GetIconEvent({required this.selectedIcon});

  final IconModel selectedIcon;
}
class SelectMonthEvent extends DatabaseEvent {
  SelectMonthEvent({
    required this.month,
  });

  final int month;
}

class IncDecMonthEvent extends DatabaseEvent {
  IncDecMonthEvent({
    required this.command,
  });

  final String command;

}

class GetMonthTransactions extends DatabaseEvent {
  GetMonthTransactions({required this.transactionsModels});

  final List<TransactionModel> transactionsModels;
}

class GetCreatedTransaction extends DatabaseEvent {
  GetCreatedTransaction({
    required this.amount,
    required this.description,
  });

  final String amount;
  final String description;
}

class GetDescriptionCategoryEvent extends DatabaseEvent {
  GetDescriptionCategoryEvent({required this.description});

  final String description;
}

class GetCategoryEvent extends DatabaseEvent {
  GetCategoryEvent({required this.transactionCategory});

  final TransactionsCategoriesModel transactionCategory;
}

class GetNewCategoryEvent extends DatabaseEvent {
  GetNewCategoryEvent({required this.newCategory});

  final String newCategory;
}

class ClearDatabaseEvent extends DatabaseEvent {}

class ClearEvent extends DatabaseEvent {}
