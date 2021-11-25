import 'package:todoey/features/task/domain/entities/task.dart';

abstract class TodoTaskEvent {}

class LoadTasks extends TodoTaskEvent {}

class AddTask extends TodoTaskEvent {
  final String taskName;
  AddTask(this.taskName);
}

class UpdateTask extends TodoTaskEvent {
  final TodoTask updatedTask;
  UpdateTask(this.updatedTask);
}

class DeleteTask extends TodoTaskEvent {
  final TodoTask task;
  DeleteTask(this.task);
}
