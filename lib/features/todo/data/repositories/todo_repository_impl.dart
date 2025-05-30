import 'package:injectable/injectable.dart';
import 'package:rivertodo/features/todo/data/datasources/todo_remote_data_source.dart';
import 'package:rivertodo/features/todo/domain/entities/todo.dart';
import 'package:rivertodo/features/todo/domain/repositories/todo_repository.dart';

@LazySingleton(as: ToDoRepository)
class ToDoRepositoryImpl implements ToDoRepository {
  const ToDoRepositoryImpl({required this.toDoRemoteDataSource});

  final ToDoRemoteDataSource toDoRemoteDataSource;

  @override
  Future<ToDo> addTodo({
    required String title,
    required int categoryId,
    required String description,
  }) {
    return toDoRemoteDataSource.addTodo(
      title: title,
      categoryId: categoryId,
      description: description,
    );
  }

  @override
  Future<ToDo> getTodoById(int id) {
    return toDoRemoteDataSource.getTodoById(id);
  }

  @override
  Future<List<ToDo>> getTodos({int? categoryId, bool? completed}) {
    return toDoRemoteDataSource.getTodos(
      categoryId: categoryId,
      completed: completed,
    );
  }
}
