import 'package:faiseur/features/lists/domain/entities/todo_list.dart';
import 'package:faiseur/features/lists/domain/repositories/lists_repository.dart';

/// Use case for updating an existing list
class UpdateList {
  /// Creates a new UpdateList use case
  const UpdateList({required ListsRepository repository})
    : _repository = repository;

  final ListsRepository _repository;

  /// Updates an existing list
  ///
  /// Validates input before updating:
  /// - List ID must not be empty
  /// - Title must not be empty if provided
  /// - Color must be a valid hex color if provided
  ///
  /// Throws an exception if validation fails or operation fails
  Future<TodoList> call(TodoList list) async {
    _validateList(list);
    return _repository.updateList(list);
  }

  void _validateList(TodoList list) {
    if (list.id.isEmpty) {
      throw ArgumentError('List ID cannot be empty');
    }
    if (list.title.isEmpty) {
      throw ArgumentError('List title cannot be empty');
    }
    if (list.title.length > 255) {
      throw ArgumentError('List title cannot exceed 255 characters');
    }
    if (!_isValidHexColor(list.color)) {
      throw ArgumentError('Invalid hex color format');
    }
    if (list.ownerId.isEmpty) {
      throw ArgumentError('ownerId cannot be empty');
    }
    if (list.description != null && list.description!.length > 1000) {
      throw ArgumentError('Description cannot exceed 1000 characters');
    }
  }

  bool _isValidHexColor(String color) =>
      RegExp(r'^#[0-9A-F]{6}$', caseSensitive: false).hasMatch(color);
}
