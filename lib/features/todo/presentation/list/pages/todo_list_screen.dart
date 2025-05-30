import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivertodo/core/router/app_router.dart';
import 'package:rivertodo/features/todo/presentation/logic/categories_provider.dart';
import 'package:rivertodo/features/todo/presentation/list/logic/filter_provider.dart';
import 'package:rivertodo/features/todo/presentation/list/logic/todo_provider.dart';

@RoutePage()
class ToDoListPage extends ConsumerWidget {
  const ToDoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(filteredToDoListProvider);
    final categories = ref.watch(categoriesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('ToDo')),
      body: RefreshIndicator(
        onRefresh: () {
          ref.refresh(toDoListProvider);
          return Future.delayed(const Duration(milliseconds: 300));
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              categories.when(
                data: (data) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Wrap(
                      spacing: 8.0,
                      children: data.map((category) {
                        return CheckboxListTile(
                          value: ref.watch(filterProvider).contains(category),
                          title: Text(category.name),
                          onChanged: (value) {
                            ref
                                .read(filterProvider.notifier)
                                .toggleCategory(category);
                            ref.refresh(toDoListProvider);
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
                error: (error, _) => Center(child: Text(error.toString())),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
              todos.when(
                data: (data) => ListView.builder(
                  restorationId: 'todo_list_view',
                  itemCount: data.length,
                  shrinkWrap: true, // BAD PRACTICE, but f.e.
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data[index].title),
                      onTap: () => AutoRouter.of(
                        context,
                      ).push(ToDoReadRoute(todoId: data[index].id)),
                      leading: Checkbox(
                        value: data[index].completed,
                        onChanged: (value) {},
                      ),
                      trailing: CircleAvatar(
                        child: Text(
                          data[index].category?.name.substring(0, 1) ?? 'X',
                        ),
                      ),
                    );
                  },
                ),
                error: (error, _) => Center(child: Text(error.toString())),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async =>
            AutoRouter.of(context).push(ToDoEditRoute()).then((value) {
              if (value == true) {
                ref.refresh(toDoListProvider);
              }
            }),
        child: const Icon(Icons.add),
      ),
    );
  }
}
