import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivertodo/core/di/injection.dart';
import 'package:rivertodo/features/todo/domain/usecases/add_todo.dart';
import 'package:rivertodo/features/todo/presentation/edit/logic/todo_edit_model.dart';

final todoEditProvider =
    StateNotifierProvider.autoDispose<TodoEditNotifier, TodoEditModel>(
      (ref) => TodoEditNotifier(),
    );

class TodoEditNotifier extends StateNotifier<TodoEditModel> {
  TodoEditNotifier() : super(const TodoEditModel());

  void setTitle(String title) {
    state = state.copyWith(title: () => title);
  }

  void setDescription(String description) {
    state = state.copyWith(description: () => description);
  }

  void setCategoryId(int categoryId) {
    state = state.copyWith(categoryId: () => categoryId);
  }

  Future<bool> createTodo() async {
    try {
      if (!state.canSave) {
        return false;
      }

      final addTodo = sl.get<AddToDo>();

      await addTodo(
        title: state.title!,
        description: state.description!,
        categoryId: state.categoryId!,
      );

      return true;
    } catch (e) {
      return false;
    }
  }
}
