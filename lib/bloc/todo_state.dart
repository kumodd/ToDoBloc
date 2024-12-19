import '../data/models/todo_model.dart';

abstract class TodoState {}

// Initial state when nothing is loaded
class TodosInitial extends TodoState {}

// State when todos are loaded successfully
class TodosLoaded extends TodoState {
  final List<Todo> todos;
  TodosLoaded(this.todos);
}

// State when an error occurs
class TodoError extends TodoState {
  final String message;
  TodoError(this.message);
}
