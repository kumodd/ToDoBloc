import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/todo_bloc.dart';
import 'package:todo/bloc/todo_state.dart';

import '../../bloc/todo_event.dart';
import '../../data/models/todo_model.dart';
import '../../data/repository/to_do_reposittory.dart';
import '../../di/injection.dart';

class ToDoItemsWidget extends StatelessWidget {
  const ToDoItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodosInitial ||
              state is TodosLoaded && state.todos.isEmpty) {
            return const Center(
              child: Text('No To-Dos yet. Add one!'),
            );
          }

          if (state is TodosLoaded) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return TodoItem(todo: todo);
              },
            );
          }

          if (state is TodoError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewTodo(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addNewTodo(BuildContext context) {
    final todo = Todo(
      title: 'New Task',
    );
    // Dispatch the AddTodo event to BLoC
    context.read<TodoBloc>().add(AddTodo(todo));
  }
}

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        subtitle: Text(todo.title),
        trailing: Checkbox(
          value: todo.isCompleted,
          onChanged: (value) {
            // Update the todo and trigger the UpdateTodo event
            final updatedTodo = todo.copyWith(isCompleted: value);
          },
        ),
        onLongPress: () {
          // Delete the todo and trigger the DeleteTodo event
          context.read<TodoBloc>().add(DeleteTodo(todo.id));
        },
      ),
    );
  }
}
