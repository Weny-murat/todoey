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
        return Dismissible(
          key: Key(currentTask.id.toString()),
          background: Container(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.delete, color: Colors.white),
                  Text('You are deleting', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),

          confirmDismiss: (DismissDirection direction) async {
            return await buildShowDialog(context, currentTask.isDone);
          },
          onDismissed: (DismissDirection direction) {
            context.read<TaskBloc>().add(DeleteTask(currentTask));
          },
          child: Container(
            decoration: BoxDecoration(border: Border.all(color:Colors.lightBlueAccent),borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Container(
                  child: IconButton(
                      onPressed: () async {
                        bool? deleteTask = await buildShowDialog(context, currentTask.isDone);
                        if (deleteTask == null) {
                          return;
                        } else if (deleteTask == true) {
                          context.read<TaskBloc>().add(DeleteTask(currentTask));
                        } else {
                          return;
                        }
                      },
                      icon: Icon(Icons.delete_forever_outlined)),
                ),
                Expanded(
                  child: TaskTile(
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
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: tasks.length,
    );
  }

  Future<bool?> buildShowDialog(BuildContext context, bool isDone) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete task"),
          content:
           Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Are you sure you want to delete this task?"),
                    isDone == false?Text("Because this task hasn't been done",style: TextStyle(color: Colors.red),):Text("")
                  ],
                ),
          actions: <Widget>[
            TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text("Delete")),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
