import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivertodo/features/todo/domain/entities/category.dart';

final filterProvider =
    StateNotifierProvider<CategoryFilterNotifier, Set<Category>>((ref) {
      return CategoryFilterNotifier();
    });

class CategoryFilterNotifier extends StateNotifier<Set<Category>> {
  CategoryFilterNotifier() : super({});

  void toggleCategory(Category category) {
    if (!state.contains(category)) {
      state = {...state, category};
    } else {
      state = state.where((c) => c != category).toSet();
    }
  }

  void clearFilters() {
    state = {};
  }
}
