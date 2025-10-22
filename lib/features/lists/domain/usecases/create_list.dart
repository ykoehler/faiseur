import 'package:faiseur/features/lists/domain/entities/todo_list.dart';
import 'package:faiseur/features/lists/domain/repositories/lists_repository.dart';

/// Represents the parameters for creating a list
class CreateListParams {
  /// Creates a new CreateListParams
  const CreateListParams({
    required this.title,
    required this.color,
    required this.ownerId,
    this.description,
  });

  /// The title/name of the list
  final String title;

  /// The hex color code for the list
  final String color;

  /// The user ID of the list owner
  final String ownerId;

  /// Optional description of the list
  final String? description;
}

/// Use case for creating a new list
class CreateList {
  /// Creates a new CreateList use case
  const CreateList({required ListsRepository repository})
    : _repository = repository;

  final ListsRepository _repository;

  /// Creates a new list with the given parameters
  ///
  /// Validates input before creating:
  /// - title must not be empty
  /// - color must be a valid hex color
  /// - ownerId must not be empty
  ///
  /// Throws an exception if validation fails or operation fails
  Future<TodoList> call(CreateListParams params) async {
    _validateParams(params);

    return _repository.createList(
      title: params.title,
      color: params.color,
      ownerId: params.ownerId,
      description: params.description,
    );
  }

  void _validateParams(CreateListParams params) {
    if (params.title.isEmpty) {
      throw ArgumentError('List title cannot be empty');
    }
    if (params.title.length > 255) {
      throw ArgumentError('List title cannot exceed 255 characters');
    }
    if (!_isValidHexColor(params.color)) {
      throw ArgumentError('Invalid hex color format');
    }
    if (params.ownerId.isEmpty) {
      throw ArgumentError('ownerId cannot be empty');
    }
    if (params.description != null && params.description!.length > 1000) {
      throw ArgumentError('Description cannot exceed 1000 characters');
    }
  }

  bool _isValidHexColor(String color) =>
      RegExp(r'^#[0-9A-F]{6}$', caseSensitive: false).hasMatch(color);
}
