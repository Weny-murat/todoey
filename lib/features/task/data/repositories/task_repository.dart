import 'package:todoey/features/task/data/datasources/local_data_source.dart';
import 'package:todoey/features/task/data/models/todo_task_model.dart';
import 'package:todoey/features/task/domain/entities/task.dart';
import 'package:todoey/core/success/success.dart';
import 'package:todoey/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:todoey/features/task/domain/repository_contracts/task_repository_contract.dart';
import 'package:uuid/uuid.dart';

class TaskRepository implements TaskRepositoryContract {
  final LocalDataSource localDataSource;
  final Uuid uuid = Uuid();

  TaskRepository({required this.localDataSource});

  @override
  Future<Either<Failure, TodoTask>> addTask(String name) async {
    try {
      String id = uuid.v1();
      TodoTaskModel newTask = TodoTaskModel(
        id: id,
        name: name,
        isDone: false,
      );
      await localDataSource.addTaskToLocal(newTask);
      return Right(TodoTask(
        id: newTask.id,
        name: newTask.name,
        isDone: newTask.isDone,
      ));
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, DeleteSuccess>> deleteTask(String taskId) async {
    try {
      await localDataSource.deleteTaskonLocal(taskId);
      return Right(DeleteSuccess());
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<TodoTask>>> getTaskList() async {
    try {
      List<TodoTaskModel> modelList = await localDataSource.getTodoTaskList();
      final result = modelList
          .map((e) => TodoTask(
                id: e.id,
                name: e.name,
                isDone: e.isDone,
              ))
          .toList();
      return Right(result);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, TodoTask>> updateTask(TodoTask task) async {
    try {
      await localDataSource.deleteTaskonLocal(task.id);
      await localDataSource.addTaskToLocal(
          TodoTaskModel(id: task.id, name: task.name, isDone: task.isDone));
      return Right(task);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
