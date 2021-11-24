import 'package:todoey/features/task/data/models/todo_task_model.dart';

abstract class LocalDataSource {
  Future<List<TodoTaskModel>> getTodoTaskList();
  Future<void> addTaskToLocal(TodoTaskModel tempTaskModel);
  Future<void> deleteTaskonLocal(String taskId);
}
