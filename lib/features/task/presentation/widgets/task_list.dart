import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/features/task/domain/entities/task.dart';
import 'package:todoey/features/task/presentation/bloc/events.dart';
import 'package:todoey/features/task/presentation/bloc/states.dart';
import 'package:todoey/features/task/presentation/bloc/task_bloc.dart';
import 'package:todoey/features/task/presentation/widgets/task_list_builder.dart';
import 'package:todoey/features/task/presentation/widgets/task_tile.dart';

class TaskListView extends StatelessWidget {
  TaskListView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          BlocBuilder<TaskBloc, TodoTaskListState>(builder: (context, state) {
        if (state is TasksInitialState) {
          context.read<TaskBloc>().add(LoadTasks());
          return Text('Welcome to Todoey! ');
        } else if (state is TasksLoading) {
          return CircularProgressIndicator();
        } else if (state is TasksNotLoaded) {
          return Text("Ops! Can't load tasks.");
        } else if (state is TasksLoaded) {
          return (state.tasks.length > 0)
              ? TaskListBuilder(state.tasks)
              : Text('No tasks :)');
        }
        return Text('Unknown State!');
      }),
    );
  }
}
