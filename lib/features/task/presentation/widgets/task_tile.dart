import 'package:flutter/material.dart';
import 'package:todoey/features/task/domain/entities/task.dart';

class TaskTile extends StatelessWidget {
  final TodoTask task;
  final Function checkboxCallBack;

  TaskTile({required this.task, required this.checkboxCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        task.name,
        style: TextStyle(
          fontSize: 18,
          decoration: task.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: task.isDone,
        onChanged: (newValue) {
          checkboxCallBack(newValue);
        },
      ),
    );
  }
}
