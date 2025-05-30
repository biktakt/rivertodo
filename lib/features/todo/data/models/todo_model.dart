import 'package:rivertodo/features/todo/domain/entities/todo.dart';

class ToDoModel extends ToDo {
  const ToDoModel({
    required super.id,
    required super.categoryId,
    required super.title,
    required super.description,
    required super.completed,
  });

  factory ToDoModel.fromJson(Map<String, dynamic> json) {
    return ToDoModel(
      id: json['id'] as int,
      categoryId: json['categoryId'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      completed: json['completed'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'title': title,
      'description': description,
      'completed': completed,
    };
  }
}
