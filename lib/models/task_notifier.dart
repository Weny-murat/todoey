import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

import 'task.dart';

class TaskNotifier extends ChangeNotifier {
  final List<Task> _taskList = [Task(name: 'Deneme')];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_taskList);

  void addTask(String newTask) {
    _taskList.add(Task(name: newTask));
    notifyListeners();
  }
}
