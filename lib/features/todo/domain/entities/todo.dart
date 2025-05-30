import 'package:equatable/equatable.dart';
import 'package:rivertodo/features/todo/domain/entities/category.dart';

class ToDo extends Equatable {
  const ToDo({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.completed,
    this.category,
  });

  final int id;
  final int categoryId;
  final String title;
  final String description;
  final bool completed;

  final Category? category;

  ToDo copyWith({
    int? categoryId,
    String? title,
    String? description,
    bool? completed,
    Category? category,
  }) {
    return ToDo(
      id: id,
      categoryId: categoryId ?? this.categoryId,
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props => [id, categoryId, title, description, completed];
}
