import 'package:faiseur/features/todos/domain/repositories/todos_repository.dart';

/// Use case for deleting a todo
///
/// Validates the input parameters and delegates to the repository
/// to remove the todo from the data store.
class DeleteTodo {
  DeleteTodo(this.repository);
  final TodosRepository repository;

  /// Deletes a todo by its ID
  ///
  /// Parameters:
  /// - [listId]: ID of the list containing the todo
  /// - [todoId]: ID of the todo to delete
  ///
  /// Throws [ArgumentError] if parameters are invalid
  /// Throws [Exception] if the todo cannot be deleted from Firestore
  Future<void> call(String listId, String todoId) async {
    if (listId.isEmpty) {
      throw ArgumentError('listId cannot be empty');
    }
    if (todoId.isEmpty) {
      throw ArgumentError('todoId cannot be empty');
    }

    return repository.deleteTodo(listId, todoId);
  }
}
