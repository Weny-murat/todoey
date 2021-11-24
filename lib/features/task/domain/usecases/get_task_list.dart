import 'package:dartz/dartz.dart';
import 'package:todoey/core/error/failures.dart';
import 'package:todoey/core/usecase/usecase.dart';
import 'package:todoey/features/task/domain/entities/task.dart';
import 'package:todoey/features/task/domain/repository_contracts/task_repository_contract.dart';

class GetTaskList extends UseCase<List<TodoTask>, NoParams> {
  final TaskRepositoryContract repository;
  GetTaskList(this.repository);

  @override
  Future<Either<Failure, List<TodoTask>>> call(params) async {
    return await repository.getTaskList();
  }
}
