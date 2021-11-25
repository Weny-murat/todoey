import 'package:todoey/features/task/domain/entities/task.dart';

class TodoTaskListState {
  List<TodoTask> tasks;
  TodoTaskListState([this.tasks = const []]);
}

class TasksInitialState extends TodoTaskListState {}

class TasksLoading extends TodoTaskListState {}

class TasksLoaded extends TodoTaskListState {}

class TasksNotLoaded extends TodoTaskListState {}
