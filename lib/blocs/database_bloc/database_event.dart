part of 'database_bloc.dart';

abstract class DatabaseEvent {}

class CategoriesForSearchEvent extends DatabaseEvent {}

class CategorySearchSelectEvent extends DatabaseEvent {
  CategorySearchSelectEvent({required this.categoryId, required this.searchedValue});

  final int categoryId;
  final String searchedValue;
}

class TransactionSearchEvent extends DatabaseEvent {
  TransactionSearchEvent({
    required this.searchedValue,
  });

  final String searchedValue;
}

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
    required this.screen,
  });

  final String screen;
  final int month;
}

class IncDecMonthEvent extends DatabaseEvent {
  IncDecMonthEvent({
    required this.screen,
    required this.command,
  });

  final String screen;
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

class SaveHistoryElementEvent extends DatabaseEvent {
  SaveHistoryElementEvent({required this.searchController});

  final String searchController;
}

class GetCategoryEvent extends DatabaseEvent {
  GetCategoryEvent({required this.transactionCategory});

  final TransactionsCategoriesModel transactionCategory;
}

class GetNewCategoryEvent extends DatabaseEvent {
  GetNewCategoryEvent({required this.newCategory});

  final String newCategory;
}
class DeleteDataBaseEvent extends DatabaseEvent {

}

class ClearDatabaseEvent extends DatabaseEvent {}

class StatisticInitialEvent extends DatabaseEvent {}

class GetEditCategoryEvent extends DatabaseEvent {
  GetEditCategoryEvent({required this.editCategory});

  final TransactionsCategoriesModel editCategory;
}

class EditCategoryEvent extends DatabaseEvent {
  EditCategoryEvent({
    required this.editTitle,
    required this.editIcon,
  });

  final String editTitle;
  final IconModel editIcon;
}

class HomeScreenInitialEvent extends DatabaseEvent {}

class DragCategoriesEvent extends DatabaseEvent {
  DragCategoriesEvent({
    required this.oldIndex,
    required this.newIndex,
  });

  final int oldIndex;
  final int newIndex;
}
