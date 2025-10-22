import 'package:faiseur/features/lists/domain/entities/todo_list.dart';
import 'package:faiseur/features/lists/presentation/providers/lists_providers.dart';
import 'package:faiseur/features/lists/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Lists home page displaying all user lists.
class ListsPage extends ConsumerWidget {
  /// Creates a lists page.
  const ListsPage({super.key, this.selectedListId, this.selectedTodoId});

  /// Optional selected list ID for detail view
  final String? selectedListId;

  /// Optional selected todo ID for detail view
  final String? selectedTodoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listsState = ref.watch(listsProvider);
    final listsNotifier = ref.read(listsProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('My Lists'), elevation: 0),
      body: listsState.when(
        data: (lists) => _buildListsView(context, lists, listsNotifier),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            _buildErrorView(context, error.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateListDialog(context, listsNotifier),
        tooltip: 'Create List',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildListsView(
    BuildContext context,
    List<TodoList> lists,
    dynamic listsNotifier,
  ) {
    if (lists.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.list, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'No lists yet',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            Text(
              'Create your first list to get started',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[500]),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: lists.length,
      itemBuilder: (context, index) {
        final list = lists[index];
        return ListCard(
          list: list,
          onTap: () {
            // Navigate to list detail
            // This will be implemented when routing is set up
          },
          onEdit: () => _showEditListDialog(context, list, listsNotifier),
          onDelete: () => _showDeleteConfirmation(context, list, listsNotifier),
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
        Text(
          'Error loading lists',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          error,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );

  void _showCreateListDialog(BuildContext context, dynamic listsNotifier) {
    showDialog<CreateListDialogParams>(
      context: context,
      builder: (context) => const CreateListDialog(),
    ).then((params) async {
      if (params == null) {
        return;
      }

      try {
        await listsNotifier.createList(
          title: params.title,
          color: params.color,
          description: params.description.isEmpty ? null : params.description,
        );

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('List created successfully')),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error creating list: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    });
  }

  void _showEditListDialog(
    BuildContext context,
    TodoList list,
    dynamic listsNotifier,
  ) {
    showDialog<EditListDialogParams>(
      context: context,
      builder: (context) => EditListDialog(list: list),
    ).then((params) async {
      if (params == null) {
        return;
      }

      try {
        final updatedList = list.copyWith(
          title: params.title,
          description: params.description.isEmpty ? null : params.description,
          color: params.color,
        );

        await listsNotifier.updateList(updatedList);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('List updated successfully')),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error updating list: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    });
  }

  void _showDeleteConfirmation(
    BuildContext context,
    TodoList list,
    dynamic listsNotifier,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete List'),
        content: Text(
          'Are you sure you want to delete "${list.title}"?\n\nThis action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              try {
                await listsNotifier.deleteList(list.id);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('List deleted successfully')),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error deleting list: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
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
