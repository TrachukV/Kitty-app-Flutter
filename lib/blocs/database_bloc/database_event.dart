part of 'database_bloc.dart';

abstract class DatabaseEvent {}

class DatabaseInitialEvent extends DatabaseEvent {}

class GetIncomesCategoriesEvent extends DatabaseEvent {}

class GetExpensesCategoriesEvent extends DatabaseEvent {}

class GetTitleCategoryEvent extends DatabaseEvent {
  GetTitleCategoryEvent({required this.title});
  final String title;
}
class GetAmountCategoryEvent extends DatabaseEvent {
  GetAmountCategoryEvent({required this.amount});
  final String amount;
}

class GetDescriptionCategoryEvent extends DatabaseEvent {
  GetDescriptionCategoryEvent({required this.description});
  final String description;
}
class GetCategoryEvent extends DatabaseEvent {
  GetCategoryEvent({required this.category});
  final String category;
}
class ClearDatabaseEvent extends DatabaseEvent {}
