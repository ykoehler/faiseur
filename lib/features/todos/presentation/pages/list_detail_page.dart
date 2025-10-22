import 'package:faiseur/features/lists/domain/entities/todo_list.dart';
import 'package:faiseur/features/todos/domain/entities/todo.dart';
// Generated providers
import 'package:faiseur/features/todos/presentation/providers/todos_providers.dart';
import 'package:faiseur/features/todos/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// List detail page displaying all todos for a specific list.
class ListDetailPage extends ConsumerWidget {
  /// Creates a list detail page.
  const ListDetailPage({required this.list, super.key});

  /// The list being displayed
  final TodoList list;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosState = ref.watch(todosProvider(list.id));
    final todosNotifier = ref.read(todosProvider(list.id).notifier);

    return Scaffold(
      appBar: AppBar(title: Text(list.title), elevation: 0),
      body: todosState.when(
        data: (todos) => _buildTodosView(context, todos, todosNotifier),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => _buildErrorView(context, error.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateTodoDialog(context, ref, todosNotifier),
        tooltip: 'Create Todo',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTodosView(BuildContext context, List<Todo> todos, dynamic todosNotifier) {
    if (todos.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.task_outlined, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text('No todos yet', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey[600])),
            const SizedBox(height: 8),
            Text(
              'Add your first task to get started',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[500]),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoItem(
          todo: todo,
          onTap: () => _showTodoDetailsSheet(context, todo, todosNotifier),
          onStatusChanged: (status) async {
            try {
              final updatedTodo = todo.copyWith(status: status);
              await todosNotifier.updateTodo(updatedTodo);
            } catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Error updating todo: $e'), backgroundColor: Colors.red));
              }
            }
          },
          onDelete: () => _showDeleteConfirmation(context, todo, todosNotifier),
        );
      },
    );
  }

  Widget _buildErrorView(BuildContext context, String error) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error_outline, size: 64, color: Colors.red[400]),
        const SizedBox(height: 16),
        Text('Error loading todos', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        Text(error, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
      ],
    ),
  );

  void _showCreateTodoDialog(BuildContext context, WidgetRef ref, dynamic todosNotifier) {
    showDialog<CreateTodoDialogParams>(context: context, builder: (context) => const CreateTodoDialog()).then((
      params,
    ) async {
      if (params == null) {
        return;
      }

      try {
        await todosNotifier.createTodo(
          title: params.title,
          description: params.description.isEmpty ? null : params.description,
          dueDate: params.dueDate,
        );

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Todo created successfully')));
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error creating todo: $e'), backgroundColor: Colors.red));
        }
      }
    });
  }

  void _showTodoDetailsSheet(BuildContext context, Todo todo, dynamic todosNotifier) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) => TodoDetailSheet(
        todo: todo,
        onUpdate: (updatedTodo) async {
          Navigator.of(context).pop();
          try {
            await todosNotifier.updateTodo(updatedTodo);
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Todo updated successfully')));
            }
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Error updating todo: $e'), backgroundColor: Colors.red));
            }
          }
        },
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, Todo todo, dynamic todosNotifier) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Todo'),
        content: Text('Are you sure you want to delete "${todo.title}"?\n\nThis action cannot be undone.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              try {
                await todosNotifier.deleteTodo(todo.id);
                if (context.mounted) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Todo deleted successfully')));
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Error deleting todo: $e'), backgroundColor: Colors.red));
                }
              }
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
