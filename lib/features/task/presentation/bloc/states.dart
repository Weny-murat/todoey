import 'package:todoey/features/task/domain/entities/task.dart';

class TodoTaskListState {
  List<TodoTask> tasks;
  TodoTaskListState([this.tasks = const []]);
}

class TasksInitialState extends TodoTaskListState {}

class TasksLoading extends TodoTaskListState {}

class TasksLoaded extends TodoTaskListState {
  TasksLoaded(tasks) : super(tasks);
}

class TasksNotLoaded extends TodoTaskListState {}
