import 'package:injectable/injectable.dart';
import 'package:rivertodo/features/todo/data/datasources/category_remote_data_source.dart';
import 'package:rivertodo/features/todo/domain/entities/category.dart';
import 'package:rivertodo/features/todo/domain/repositories/category_repository.dart';

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  const CategoryRepositoryImpl({required this.categoryRemoteDataSource});

  final CategoryRemoteDataSource categoryRemoteDataSource;

  @override
  Future<List<Category>> getCategories() {
    return categoryRemoteDataSource.getCategories();
  }

  @override
  Future<Category> getCategoryById(int id) {
    return categoryRemoteDataSource.getCategoryById(id);
  }
}
