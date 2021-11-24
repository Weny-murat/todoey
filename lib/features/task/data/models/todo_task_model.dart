import 'dart:convert';

import 'package:equatable/equatable.dart';

class TodoTaskModel extends Equatable {
  final String id;
  final String name;
  final bool isDone;

  TodoTaskModel({
    required this.id,
    required this.name,
    required this.isDone,
  });

  @override
  List<Object> get props => [id, name, isDone];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isDone': isDone,
    };
  }

  factory TodoTaskModel.fromMap(Map<String, dynamic> map) {
    return TodoTaskModel(
      id: map['id'],
      name: map['name'],
      isDone: map['isDone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoTaskModel.fromJson(String source) =>
      TodoTaskModel.fromMap(json.decode(source));

  TodoTaskModel copyWith({
    String? id,
    String? name,
    bool? isDone,
  }) {
    return TodoTaskModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  bool get stringify => true;
}
