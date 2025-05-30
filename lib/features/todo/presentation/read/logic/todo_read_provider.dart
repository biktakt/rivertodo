import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivertodo/core/di/injection.dart';
import 'package:rivertodo/features/todo/domain/entities/todo.dart';
import 'package:rivertodo/features/todo/domain/usecases/get_todo_by_id.dart';

final toDoProvider = FutureProvider.family<ToDo, int>((ref, int id) {
  final GetToDoById getTodo = sl<GetToDoById>();
  return getTodo(id);
});
