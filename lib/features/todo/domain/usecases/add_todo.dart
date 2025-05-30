import 'package:injectable/injectable.dart';
import 'package:rivertodo/features/todo/domain/entities/todo.dart';
import 'package:rivertodo/features/todo/domain/repositories/todo_repository.dart';

@injectable
class AddToDo {
  final ToDoRepository repository;

  const AddToDo(this.repository);

  Future<ToDo> call({
    required String title,
    required int categoryId,
    required String description,
  }) async {
    return await repository.addTodo(
      title: title,
      categoryId: categoryId,
      description: description,
    );
  }
}
