import 'package:injectable/injectable.dart';
import 'package:rivertodo/features/todo/domain/entities/todo.dart';
import 'package:rivertodo/features/todo/domain/repositories/todo_repository.dart';

@injectable
class GetTodos {
  const GetTodos(this.repository);

  final ToDoRepository repository;

  Future<List<ToDo>> call({int? categoryId, bool? completed}) async {
    return await repository.getTodos(
      categoryId: categoryId,
      completed: completed,
    );
  }
}
