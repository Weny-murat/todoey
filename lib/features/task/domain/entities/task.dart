// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class TodoTask extends Equatable {
  final String id;
  final String name;
  bool isDone;

  TodoTask({required this.id, required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }

  @override
  List<Object?> get props => [id];
}
