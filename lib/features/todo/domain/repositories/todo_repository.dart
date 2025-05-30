import 'package:rivertodo/features/todo/domain/entities/todo.dart';

abstract class ToDoRepository {
  Future<ToDo> addTodo({
    required String title,
    required int categoryId,
    required String description,
  });
  Future<List<ToDo>> getTodos({int? categoryId, bool? completed});
  Future<ToDo> getTodoById(int id);
}
