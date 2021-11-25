import 'package:equatable/equatable.dart';

abstract class Success extends Equatable {
  @override
  List<Object> get props => [];
}

class AddSuccess extends Success {}

class DeleteSuccess extends Success {}

class UpdateSuccess extends Success {}
