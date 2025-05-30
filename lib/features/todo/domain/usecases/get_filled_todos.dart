import 'package:injectable/injectable.dart';
import 'package:rivertodo/features/todo/domain/entities/category.dart';
import 'package:rivertodo/features/todo/domain/entities/todo.dart';
import 'package:rivertodo/features/todo/domain/repositories/category_repository.dart';
import 'package:rivertodo/features/todo/domain/repositories/todo_repository.dart';

@injectable
class GetFilledTodos {
  const GetFilledTodos({
    required this.repository,
    required this.categoryRepository,
  });

  final ToDoRepository repository;
  final CategoryRepository categoryRepository;

  Future<List<ToDo>> call() async {
    final categories = await categoryRepository.getCategories();
    final todos = await repository.getTodos();
    final filledTodos = todos.map((todo) {
      final category = categories.firstWhere(
        (category) => category.id == todo.categoryId,
        orElse: () => const Category(id: 0, name: 'Uncategorized'),
      );
      return todo.copyWith(category: category);
    }).toList();

    return filledTodos;
  }
}
