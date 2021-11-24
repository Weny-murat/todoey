import 'package:todoey/features/task/domain/entities/task.dart';

abstract class TaskRepositoryContract {
  Future<Task> getTasks();
  Future<bool> addTask(Task newTask);
}
