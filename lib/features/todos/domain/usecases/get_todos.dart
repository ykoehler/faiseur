import 'package:faiseur/features/todos/domain/entities/todo.dart';
import 'package:faiseur/features/todos/domain/repositories/todos_repository.dart';

/// Use case for retrieving all todos for a given list
///
/// This use case encapsulates the business logic for fetching todos.
/// It handles validation and delegates to the repository.
class GetTodos {
  GetTodos(this.repository);
  final TodosRepository repository;

  /// Retrieves all todos for a specific list
  ///
  /// Throws [ArgumentError] if listId is empty
  Future<List<Todo>> call(String listId) async {
    if (listId.isEmpty) {
      throw ArgumentError('listId cannot be empty');
    }
    return repository.getTodos(listId);
  }

  /// Watches todos for real-time updates
  ///
  /// Returns a stream that emits updated todo lists whenever
  /// the data changes in the repository
  Stream<List<Todo>> watch(String listId) {
    if (listId.isEmpty) {
      throw ArgumentError('listId cannot be empty');
    }
    return repository.watchTodos(listId);
  }
}
