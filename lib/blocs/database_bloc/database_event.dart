part of 'database_bloc.dart';

abstract class DatabaseEvent {}

class DatabaseInitial extends DatabaseEvent {}

class GetIncomesCategories extends DatabaseEvent {}

class GetExpensesCategories extends DatabaseEvent {}
