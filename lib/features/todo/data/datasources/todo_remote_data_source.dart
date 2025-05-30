import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:rivertodo/core/remote/request_helper.dart';
import 'package:rivertodo/features/todo/data/models/todo_model.dart';
import 'package:rivertodo/features/todo/domain/entities/todo.dart';

abstract class ToDoRemoteDataSource {
  Future<List<ToDo>> getTodos({int? categoryId, bool? completed});
  Future<ToDo> getTodoById(int id);
  Future<ToDo> addTodo({
    required String title,
    required String description,
    required int categoryId,
  });
}

@LazySingleton(as: ToDoRemoteDataSource)
class ToDoRemoteDataSourceImpl
    with RequestHelper
    implements ToDoRemoteDataSource {
  final Dio _dio;

  const ToDoRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<ToDo>> getTodos({int? categoryId, bool? completed}) {
    return handleListRequest(
      () => _dio.get(
        '/todos',
        queryParameters: {
          if (categoryId != null) 'categoryId': categoryId,
          if (completed != null) 'completed': completed,
        },
      ),
      (json) => ToDoModel.fromJson(json),
    );
  }

  @override
  Future<ToDo> getTodoById(int id) {
    return handleRequest(
      () => _dio.get('/todos/$id'),
      (json) => ToDoModel.fromJson(json),
    );
  }

  @override
  Future<ToDo> addTodo({
    required String title,
    required String description,
    required int categoryId,
  }) {
    return handleRequest(
      () => _dio.post(
        '/todos',
        data: {
          'title': title,
          'description': description,
          'categoryId': categoryId,
          'completed': false,
        },
      ),
      (json) => ToDoModel.fromJson(json),
    );
  }
}
