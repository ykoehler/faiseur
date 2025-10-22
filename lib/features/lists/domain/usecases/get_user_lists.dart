import 'package:faiseur/features/lists/domain/entities/todo_list.dart';
import 'package:faiseur/features/lists/domain/repositories/lists_repository.dart';

/// Use case for retrieving all lists for a user
class GetUserLists {
  /// Creates a new GetUserLists use case
  const GetUserLists({required ListsRepository repository}) : _repository = repository;

  final ListsRepository _repository;

  /// Gets all lists (owned and collaborated) for a user
  ///
  /// Throws an exception if the operation fails
  Future<List<TodoList>> call(String userId) async {
    if (userId.isEmpty) {
      throw ArgumentError('userId cannot be empty');
    }
    return _repository.getUserLists(userId);
  }

  /// Watches all lists for a user in real-time
  ///
  /// Returns a stream of lists that updates whenever data changes
  Stream<List<TodoList>> watch(String userId) {
    if (userId.isEmpty) {
      throw ArgumentError('userId cannot be empty');
    }
    return _repository.watchUserLists(userId);
  }
}
