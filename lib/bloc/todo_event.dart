import '../data/models/todo_model.dart';

abstract class TodoEvent {}

// Event to load all todos
class LoadTodos extends TodoEvent {}

// Event to add a new todo
class AddTodo extends TodoEvent {
  final Todo todo;
  AddTodo(this.todo);
}

// Event to delete a todo
class DeleteTodo extends TodoEvent {
  final String id;
  DeleteTodo(this.id);
}

// Event to toggle todo completion
class ToggleTodoCompletion extends TodoEvent {
  final String id;
  ToggleTodoCompletion(this.id);
}
