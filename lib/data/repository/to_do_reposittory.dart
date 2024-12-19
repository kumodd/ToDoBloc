import 'package:todo/utils/custom_easy_loading.dart';

import '../models/todo_model.dart';

class TodoRepository {
  final List<Todo> _todos = []; // Simulated in-memory database.

  // Fetch all todos
  Future<List<Todo>> getTodos() async {
    await Future.delayed(const Duration(milliseconds: 5000)); // Simulate delay

    return List.from(_todos);
  }

  // Add a new todo
  Future<void> addTodo(Todo todo) async {
    await Future.delayed(const Duration(milliseconds: 3000));
    _todos.add(todo);
    CustomEasyLoading.dismiss();
  }

  // Update a todo
  Future<void> updateTodo(Todo updatedTodo) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _todos.indexWhere((t) => t.id == updatedTodo.id);
    if (index != -1) {
      _todos[index] = updatedTodo;
    }
  }

  // Delete a todo
  Future<void> deleteTodo(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _todos.removeWhere((t) => t.id == id);
  }
}
