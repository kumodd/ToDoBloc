import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/todo_event.dart';
import 'package:todo/data/repository/to_do_reposittory.dart';
import 'package:todo/di/injection.dart';
import 'package:todo/ui/widget/todo_items_widget.dart';

import '../../bloc/todo_bloc.dart';
import '../../data/models/todo_model.dart';

class ShowToDoScreen extends StatelessWidget {
  final TodoRepository repository = TodoRepository();
  ShowToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(repository: repository)..add(LoadTodos()),
      // TodoBloc(getIt.get<TodoRepository>())..add(LoadTodos()),
      child: Scaffold(
        body: ToDoItemsWidget(),
      ),
    );
  }
}
