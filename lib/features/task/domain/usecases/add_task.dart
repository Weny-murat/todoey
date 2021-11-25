import 'package:todoey/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:todoey/core/usecase/usecase.dart';
import 'package:todoey/features/task/domain/entities/task.dart';
import 'package:todoey/features/task/domain/repository_contracts/task_repository_contract.dart';

class AddTask extends UseCase<TodoTask, AddTaskParams> {
  final TaskRepositoryContract repository;
  AddTask(this.repository);

  @override
  Future<Either<Failure, TodoTask>> call(params) async {
    return await repository.addTask(params.name);
  }
}
