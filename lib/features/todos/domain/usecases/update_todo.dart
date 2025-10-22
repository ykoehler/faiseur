import 'package:faiseur/features/todos/domain/entities/todo.dart';
import 'package:faiseur/features/todos/domain/repositories/todos_repository.dart';

/// Use case for updating an existing todo
///
/// Validates the todo and delegates to the repository
/// to persist the changes to the data store.
class UpdateTodo {
  UpdateTodo(this.repository);
  final TodosRepository repository;

  /// Updates an existing todo
  ///
  /// The todo must have a valid ID and listId. All other fields
  /// can be modified through this use case.
  ///
  /// Parameters:
  /// - [todo]: The updated Todo entity with all fields
  ///
  /// Throws [ArgumentError] if the todo is invalid
  /// Throws [Exception] if the todo cannot be updated in Firestore
  Future<Todo> call(Todo todo) async {
    // Validate todo
    if (todo.id.isEmpty) {
      throw ArgumentError('todo.id cannot be empty');
    }
    if (todo.listId.isEmpty) {
      throw ArgumentError('todo.listId cannot be empty');
    }
    if (todo.title.isEmpty) {
      throw ArgumentError('todo.title cannot be empty');
    }
    if (todo.title.length > 500) {
      throw ArgumentError('todo.title cannot exceed 500 characters');
    }
    if (todo.description != null && todo.description!.length > 5000) {
      throw ArgumentError('todo.description cannot exceed 5000 characters');
    }

    return repository.updateTodo(todo);
  }
}
