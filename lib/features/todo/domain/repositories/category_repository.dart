import 'package:rivertodo/features/todo/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategories();
  Future<Category> getCategoryById(int id);
}
