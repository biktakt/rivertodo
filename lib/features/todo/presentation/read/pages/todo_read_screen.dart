import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivertodo/features/todo/domain/entities/todo.dart';
import 'package:rivertodo/features/todo/presentation/read/logic/todo_read_provider.dart';

@RoutePage()
class ToDoReadScreen extends ConsumerWidget {
  const ToDoReadScreen({super.key, required this.todoId});

  final int todoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(toDoProvider(todoId));

    return Scaffold(
      appBar: AppBar(title: const Text('ToDo Details')),
      body: todo.when(
        data: (data) => ToDoDetails(toDo: data),
        error: (error, _) => Center(child: Text(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class ToDoDetails extends StatelessWidget {
  const ToDoDetails({super.key, required this.toDo});

  final ToDo toDo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(toDo.title, style: Theme.of(context).textTheme.headlineLarge),
          Text(toDo.description, style: Theme.of(context).textTheme.bodyLarge),
          Text(
            'Category ID: ${toDo.categoryId}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            'Completed: ${toDo.completed ? "Yes" : "No"}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
