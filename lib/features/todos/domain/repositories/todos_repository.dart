import 'package:faiseur/features/todos/domain/entities/todo.dart';

/// Repository interface for Todo operations
abstract class TodosRepository {
  /// Gets all todos for a list
  Future<List<Todo>> getTodos(String listId);

  /// Gets a specific todo by ID
  Future<Todo?> getTodo(String listId, String todoId);

  /// Creates a new todo
  Future<Todo> createTodo({
    required String listId,
    required String title,
    required String createdBy,
    String? description,
    DateTime? dueDate,
    List<String>? assignedTo,
    List<String>? tags,
  });

  /// Updates an existing todo
  Future<Todo> updateTodo(Todo todo);

  /// Deletes a todo
  Future<void> deleteTodo(String listId, String todoId);

  /// Watches todos for a list for real-time updates
  Stream<List<Todo>> watchTodos(String listId);

  /// Watches a specific todo for real-time updates
  Stream<Todo?> watchTodo(String listId, String todoId);
}
