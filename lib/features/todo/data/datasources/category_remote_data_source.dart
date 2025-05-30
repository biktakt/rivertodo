import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:rivertodo/core/remote/request_helper.dart';
import 'package:rivertodo/features/todo/data/models/category_model.dart';
import 'package:rivertodo/features/todo/domain/entities/category.dart';

abstract class CategoryRemoteDataSource {
  Future<List<Category>> getCategories();
  Future<Category> getCategoryById(int id);
}

@LazySingleton(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl
    with RequestHelper
    implements CategoryRemoteDataSource {
  final Dio _dio;

  const CategoryRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<Category>> getCategories() {
    return handleListRequest(
      () => _dio.get('/categories'),
      (json) => CategoryModel.fromJson(json),
    );
  }

  @override
  Future<Category> getCategoryById(int id) {
    return handleRequest(
      () => _dio.get('/categories/$id'),
      (json) => CategoryModel.fromJson(json),
    );
  }
}
