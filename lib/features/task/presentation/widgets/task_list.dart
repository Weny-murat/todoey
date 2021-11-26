import 'package:flutter/material.dart';
import 'package:todoey/features/task/domain/entities/task.dart';
import 'package:todoey/features/task/presentation/widgets/task_tile.dart';

class TaskListView extends StatelessWidget {
  final List<TodoTask> tasks;
  TaskListView(this.tasks);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          task: tasks[index],
          checkboxCallBack: (bool checkboxState) {
            //
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
