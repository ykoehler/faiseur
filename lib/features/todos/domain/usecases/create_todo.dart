import 'package:faiseur/core/constants/enums.dart';
import 'package:faiseur/features/todos/domain/entities/todo.dart';
import 'package:faiseur/features/todos/domain/repositories/todos_repository.dart';

/// Use case for creating a new todo
///
/// Validates all required inputs and delegates to the repository
/// to persist the new todo to the data store.
class CreateTodo {
  CreateTodo(this.repository);
  final TodosRepository repository;

  /// Creates a new todo with the given parameters
  ///
  /// Required parameters:
  /// - [listId]: ID of the list the todo belongs to
  /// - [title]: Title/name of the todo
  /// - [createdBy]: User ID of the creator
  ///
  /// Optional parameters:
  /// - [description]: Detailed description
  /// - [dueDate]: Due date for the todo
  /// - [priority]: Priority level (default: medium)
  /// - [xpReward]: XP points for completion (default: 10)
  /// - [assignedTo]: List of user IDs to assign to
  /// - [tags]: List of tags for categorization
  ///
  /// Throws [ArgumentError] if required parameters are invalid
  /// Throws [Exception] if the todo cannot be created in Firestore
  Future<Todo> call({
    required String listId,
    required String title,
    required String createdBy,
    String? description,
    DateTime? dueDate,
    TodoPriority priority = TodoPriority.medium,
    int xpReward = 10,
    List<String>? assignedTo,
    List<String>? tags,
  }) async {
    // Validate required fields
    if (listId.isEmpty) {
      throw ArgumentError('listId cannot be empty');
    }
    if (title.isEmpty) {
      throw ArgumentError('title cannot be empty');
    }
    if (title.length > 500) {
      throw ArgumentError('title cannot exceed 500 characters');
    }
    if (createdBy.isEmpty) {
      throw ArgumentError('createdBy cannot be empty');
    }
    if (xpReward < 0) {
      throw ArgumentError('xpReward cannot be negative');
    }
    if (description != null && description.length > 5000) {
      throw ArgumentError('description cannot exceed 5000 characters');
    }

    // Validate due date is not in the past
    if (dueDate != null && dueDate.isBefore(DateTime.now())) {
      throw ArgumentError('dueDate cannot be in the past');
    }

    return repository.createTodo(
      listId: listId,
      title: title,
      createdBy: createdBy,
      description: description,
      dueDate: dueDate,
      assignedTo: assignedTo,
      tags: tags,
    );
  }
}
