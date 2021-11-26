import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/features/task/domain/entities/task.dart';
import 'package:todoey/features/task/presentation/bloc/states.dart';
import 'package:todoey/features/task/presentation/bloc/task_bloc.dart';

class TaskCountText extends StatelessWidget {
  const TaskCountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TodoTaskListState>(builder: (context, state) {
      if (state is TasksLoaded) {
        final count = state.tasks.length;
        return Text(
          '$count Tasks',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        );
      }
      return Container();
    });
  }
}
