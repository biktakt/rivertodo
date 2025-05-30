import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivertodo/features/todo/domain/entities/category.dart';
import 'package:rivertodo/features/todo/presentation/edit/logic/todo_edit_provider.dart';
import 'package:rivertodo/features/todo/presentation/logic/categories_provider.dart';

@RoutePage()
class ToDoEditScreen extends ConsumerStatefulWidget {
  final int? todoId;
  bool get isEditing => todoId != null;

  const ToDoEditScreen({super.key, this.todoId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ToDoEditScreenState();
}

class _ToDoEditScreenState extends ConsumerState<ToDoEditScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todoEdit = ref.watch(todoEditProvider);
    final categories = ref.watch(categoriesProvider);
    final title = widget.isEditing ? 'Edit ToDo' : 'Create ToDo';

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onChanged: (value) =>
                  ref.read(todoEditProvider.notifier).setTitle(value),
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              onChanged: (value) =>
                  ref.read(todoEditProvider.notifier).setDescription(value),
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            categories.when(
              data: (categories) => DropdownButtonFormField<Category>(
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                items: categories
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name),
                      ),
                    )
                    .toList(),
                onChanged: (value) => ref
                    .read(todoEditProvider.notifier)
                    .setCategoryId(value?.id ?? 0),
              ),
              error: (error, _) => Text('Error loading categories: $error'),
              loading: () => const CircularProgressIndicator(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: todoEdit.canSave
                  ? () async {
                      final result = await ref
                          .read(todoEditProvider.notifier)
                          .createTodo();
                      if (result && context.mounted) {
                        AutoRouter.of(context).pop(result);
                      }
                    }
                  : null,
              child: const Text('Add ToDo'),
            ),
          ],
        ),
      ),
    );
  }
}
