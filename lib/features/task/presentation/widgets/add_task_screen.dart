import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/features/task/presentation/bloc/events.dart';
import 'package:todoey/features/task/presentation/bloc/task_bloc.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String taskString = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            'Add Task',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.lightBlueAccent),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            autofocus: true,
            onChanged: (newValue) {
              taskString = newValue;
            },
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(2),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlueAccent),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: MaterialButton(
            height: 40,
            minWidth: double.maxFinite,
            onPressed: () {
              context.read<TaskBloc>().add(AddTask(taskString));
              Navigator.pop(context);
            },
            color: Colors.lightBlueAccent,
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
