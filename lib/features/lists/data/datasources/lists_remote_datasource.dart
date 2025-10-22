import 'package:faiseur/features/lists/domain/entities/todo_list.dart';

/// Remote datasource interface for TodoList operations
abstract class ListsRemoteDatasource {
  /// Gets all lists for a user
  Future<List<TodoList>> getUserLists(String userId);

  /// Gets a specific list by ID
  Future<TodoList?> getList(String listId);

  /// Creates a new list
  Future<TodoList> createList(TodoList list);

  /// Updates an existing list
  Future<TodoList> updateList(TodoList list);

  /// Deletes a list
  Future<void> deleteList(String listId);

  /// Watches user lists for real-time updates
  Stream<List<TodoList>> watchUserLists(String userId);

  /// Watches a specific list for real-time updates
  Stream<TodoList?> watchList(String listId);
}
