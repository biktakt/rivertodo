import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivertodo/core/di/injection.dart';
import 'package:rivertodo/features/todo/domain/entities/todo.dart';
import 'package:rivertodo/features/todo/domain/usecases/get_filled_todos.dart';
import 'package:rivertodo/features/todo/presentation/list/logic/filter_provider.dart';

final toDoListProvider = FutureProvider<List<ToDo>>((ref) {
  final GetFilledTodos getTodos = sl<GetFilledTodos>();
  return getTodos();
});

final filteredToDoListProvider = FutureProvider.autoDispose<List<ToDo>>((ref) {
  final todoList = ref.watch(toDoListProvider);
  final filter = ref.watch(filterProvider);

  final filteredTodos = todoList.when<List<ToDo>>(
    data: (todos) {
      if (filter.isEmpty) return todos;
      return todos.where((todo) => filter.contains(todo.category)).toList();
    },
    loading: () => [],
    error: (error, stack) => [],
  );

  return filteredTodos;
});
