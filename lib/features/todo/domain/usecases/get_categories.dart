import 'package:injectable/injectable.dart';
import 'package:rivertodo/features/todo/domain/entities/category.dart';
import 'package:rivertodo/features/todo/domain/repositories/category_repository.dart';

@injectable
class GetCategories {
  final CategoryRepository repository;

  const GetCategories(this.repository);

  Future<List<Category>> call() async {
    return await repository.getCategories();
  }
}
