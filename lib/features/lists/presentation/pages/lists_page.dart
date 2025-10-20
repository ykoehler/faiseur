import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Lists page widget.
class ListsPage extends ConsumerWidget {
  /// Creates a lists page.
  const ListsPage({super.key, this.selectedListId, this.selectedTodoId});

  /// Optional selected list ID for detail view
  final String? selectedListId;

  /// Optional selected todo ID for detail view
  final String? selectedTodoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(title: const Text('My Lists')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.list, size: 64),
          const SizedBox(height: 16),
          const Text('Lists Page'),
          if (selectedListId != null) Text('Selected List: $selectedListId'),
          if (selectedTodoId != null) Text('Selected Todo: $selectedTodoId'),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement lists feature
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('TODO: Implement lists')));
            },
            child: const Text('Create List'),
          ),
        ],
      ),
    ),
  );
}
