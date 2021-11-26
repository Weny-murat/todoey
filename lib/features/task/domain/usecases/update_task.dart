import 'package:todoey/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:todoey/core/usecase/usecase.dart';
import 'package:todoey/features/task/domain/entities/task.dart';
import 'package:todoey/features/task/domain/repository_contracts/task_repository_contract.dart';

class UpdateTask extends UseCase<TodoTask, UpdateTaskParams> {
  final TaskRepositoryContract repository;
  UpdateTask(this.repository);

  @override
  Future<Either<Failure, TodoTask>> call(params) async {
    return await repository.updateTask(params.task);
  }
}

class UpdateTaskParams extends Params {
  final TodoTask task;

  UpdateTaskParams(this.task);

  @override
  List<Object> get props => [task];
}
