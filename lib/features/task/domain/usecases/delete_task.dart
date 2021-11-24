import 'package:dartz/dartz.dart';
import 'package:todoey/core/error/failures.dart';
import 'package:todoey/core/success/success.dart';
import 'package:todoey/core/usecase/usecase.dart';
import 'package:todoey/features/task/domain/repository_contracts/task_repository_contract.dart';

class DeleteTask extends UseCase<DeleteSuccess, DeleteTaskParams> {
  final TaskRepositoryContract repository;
  DeleteTask(this.repository);

  @override
  Future<Either<Failure, DeleteSuccess>> call(params) async {
    return await repository.deleteTask(params.id);
  }
}
