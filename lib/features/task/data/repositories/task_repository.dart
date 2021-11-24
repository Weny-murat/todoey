import 'package:todoey/features/task/data/datasources/local_data_source.dart';
import 'package:todoey/features/task/domain/entities/task.dart';
import 'package:todoey/core/success/success.dart';
import 'package:todoey/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:todoey/features/task/domain/repository_contracts/task_repository_contract.dart';

class TaskRepository extends TaskRepositoryContract {
  final LocalDataSource localDataSource;

  TaskRepository({required this.localDataSource});

  @override
  Future<Either<Failure, AddSuccess>> addTask(String name) {
    // TODO: implement addTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, DeleteSuccess>> deleteTask(String taskId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TodoTask>>> getTaskList() {
    // TODO: implement getTaskList
    throw UnimplementedError();
  }
}
