import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repository/to_do_reposittory.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;

  TodoBloc({required this.repository}) : super(TodosInitial()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<DeleteTodo>(_onDeleteTodo);
    on<ToggleTodoCompletion>(_onToggleCompletion);
  }

  // Load all todos
  Future<void> _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    try {
      final todos = await repository.getTodos();
      emit(TodosLoaded(todos));
    } catch (e) {
      emit(TodoError("Failed to load todos"));
    }
  }

  // Add a new todo
  Future<void> _onAddTodo(AddTodo event, Emitter<TodoState> emit) async {
    try {
      await repository.addTodo(event.todo);
      add(LoadTodos()); // Reload todos after adding
    } catch (e) {
      emit(TodoError("Failed to add todo"));
    }
  }

  // Delete a todo
  Future<void> _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) async {
    try {
      await repository.deleteTodo(event.id);
      add(LoadTodos()); // Reload todos after deleting
    } catch (e) {
      emit(TodoError("Failed to delete todo"));
    }
  }

  // Toggle completion status
  Future<void> _onToggleCompletion(
      ToggleTodoCompletion event, Emitter<TodoState> emit) async {
    try {
      final todos = await repository.getTodos();
      final todo = todos.firstWhere((t) => t.id == event.id);
      await repository
          .updateTodo(todo.copyWith(isCompleted: !todo.isCompleted));
      add(LoadTodos()); // Reload todos after update
    } catch (e) {
      emit(TodoError("Failed to update todo"));
    }
  }
}
