import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}

abstract class Params extends Equatable {}

class NoParams extends Params {
  @override
  List<Object> get props => [];
}

class AddTaskParams extends Params {
  final String name;

  AddTaskParams(this.name);

  @override
  List<Object> get props => [name];
}

class DeleteTaskParams extends Params {
  final String id;

  DeleteTaskParams(this.id);

  @override
  List<Object> get props => [id];
}
