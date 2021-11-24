import 'package:dartz/dartz.dart';
import 'package:todoey/core/error/failures.dart';
import 'package:todoey/core/success/success.dart';
import 'package:todoey/features/task/domain/entities/task.dart';

abstract class TaskRepositoryContract {
  Future<Either<Failure, List<TodoTask>>> getTaskList();
  Future<Either<Failure, AddSuccess>> addTask(String name);
  Future<Either<Failure, DeleteSuccess>> deleteTask(String taskId);
}
