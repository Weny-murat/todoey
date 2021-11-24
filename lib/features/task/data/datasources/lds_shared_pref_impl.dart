import 'package:shared_preferences/shared_preferences.dart';

import 'package:todoey/features/task/data/datasources/local_data_source.dart';
import 'package:todoey/features/task/data/models/todo_task_model.dart';

class TodoTaskLDSSharedPreferences implements LocalDataSource {
  SharedPreferences sharedPreferences;
  TodoTaskLDSSharedPreferences({
    required this.sharedPreferences,
  });
  @override
  Future<void> addTaskToLocal(TodoTaskModel tempTaskModel) {
    return sharedPreferences.setString(
        tempTaskModel.id, tempTaskModel.toJson());
  }

  @override
  Future<List<TodoTaskModel>> getTodoTaskList() async {
    var tempTodoListKeys = sharedPreferences.getKeys();
    List<TodoTaskModel> result = [];
    tempTodoListKeys.forEach((element) {
      var tempModel = sharedPreferences.get(element);
      result.add(TodoTaskModel.fromJson(tempModel as String));
    });
    return Future.value(result);
  }

  @override
  Future<void> deleteTaskonLocal(String taskId) {
    return sharedPreferences.remove(taskId);
  }
}
