import 'package:injectable/injectable.dart';
import 'package:rivertodo/features/todo/domain/entities/todo.dart';
import 'package:rivertodo/features/todo/domain/repositories/todo_repository.dart';

@injectable
class GetToDoById {
  final ToDoRepository repository;

  const GetToDoById(this.repository);

  Future<ToDo> call(int id) async {
    return await repository.getTodoById(id);
  }
}
