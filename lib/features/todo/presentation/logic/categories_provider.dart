import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivertodo/core/di/injection.dart';
import 'package:rivertodo/features/todo/domain/entities/category.dart';
import 'package:rivertodo/features/todo/domain/usecases/get_categories.dart';

final categoriesProvider = FutureProvider<List<Category>>((ref) {
  final GetCategories getCategories = sl<GetCategories>();
  return getCategories();
});
