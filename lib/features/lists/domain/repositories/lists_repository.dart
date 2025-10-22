import 'package:faiseur/features/lists/domain/entities/todo_list.dart';

/// Repository interface for TodoList operations
abstract class ListsRepository {
  /// Gets all lists for a user (owned and collaborated)
  Future<List<TodoList>> getUserLists(String userId);

  /// Gets a specific list by ID
  Future<TodoList?> getList(String listId);

  /// Creates a new list
  Future<TodoList> createList({
    required String title,
    required String color,
    required String ownerId,
    String? description,
  });

  /// Updates an existing list
  Future<TodoList> updateList(TodoList list);

  /// Deletes a list
  Future<void> deleteList(String listId);

  /// Watches user lists for real-time updates
  Stream<List<TodoList>> watchUserLists(String userId);

  /// Watches a specific list for real-time updates
  Stream<TodoList?> watchList(String listId);
}
