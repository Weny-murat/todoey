import 'package:todoey/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:todoey/core/success/success.dart';
import 'package:todoey/core/usecase/usecase.dart';
import 'package:todoey/features/task/domain/repository_contracts/task_repository_contract.dart';

class AddTask extends UseCase<AddSuccess, AddTaskParams> {
  final TaskRepositoryContract repository;
  AddTask(this.repository);

  @override
  Future<Either<Failure, AddSuccess>> call(params) async {
    return await repository.addTask(params.name);
  }
}
