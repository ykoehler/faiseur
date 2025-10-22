import 'package:faiseur/features/lists/domain/repositories/lists_repository.dart';

/// Use case for deleting a list
class DeleteList {
  /// Creates a new DeleteList use case
  const DeleteList({required ListsRepository repository})
    : _repository = repository;

  final ListsRepository _repository;

  /// Deletes a list by its ID
  ///
  /// Validates input:
  /// - listId must not be empty
  ///
  /// Throws an exception if validation fails or operation fails
  Future<void> call(String listId) async {
    if (listId.isEmpty) {
      throw ArgumentError('listId cannot be empty');
    }
    return _repository.deleteList(listId);
  }
}
