import 'package:flutter/material.dart';
import 'package:todoey/features/task/domain/entities/task.dart';
import 'package:todoey/features/task/presentation/bloc/events.dart';
import 'package:todoey/features/task/presentation/bloc/task_bloc.dart';

import 'package:todoey/features/task/presentation/widgets/task_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListBuilder extends StatelessWidget {
  final List<TodoTask> tasks;
  const TaskListBuilder(
    this.tasks, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final currentTask = tasks[index];
        return TaskTile(
          task: currentTask,
          // TODO: remove callback here
          // instead,  add UpdateTask event inside the TaskTile widget
          checkboxCallBack: (bool checkboxState) {
            final updatedTask = TodoTask(
              id: currentTask.id,
              name: currentTask.name,
              isDone: checkboxState,
            );
            context.read<TaskBloc>().add(UpdateTask(updatedTask));
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
