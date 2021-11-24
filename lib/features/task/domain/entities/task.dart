import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }

  @override
  List<Object?> get props => [name];
}
