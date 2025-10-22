import 'package:faiseur/core/constants/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_list.freezed.dart';

/// TodoList domain entity representing a collection of todos.
///
/// A TodoList is a collaborative container for todos with:
/// - Single owner (the creator)
/// - Multiple collaborators (with different roles)
/// - Shared settings (color, visibility)
/// - Real-time sync across devices
@freezed
abstract class TodoList with _$TodoList {
  const factory TodoList({
    /// Unique identifier for the list (Firestore doc ID)
    required String id,

    /// The title/name of the list
    required String title,

    /// Hex color code for UI representation (e.g., '#FF5733')
    required String color,

    /// User ID of the list owner
    required String ownerId,

    /// Timestamp when the list was created
    required DateTime createdAt,

    /// Optional description of what this list is for
    String? description,

    /// Map of collaborators: userId -> UserRole
    /// Example: {'user123': UserRole.editor, 'user456': UserRole.viewer}
    @Default({}) Map<String, UserRole> collaborators,

    /// Whether this list is currently archived
    @Default(false) bool isArchived,

    /// Number of todos in this list
    @Default(0) int todoCount,

    /// Number of completed todos in this list
    @Default(0) int completedCount,

    /// Timestamp when the list was last updated
    DateTime? updatedAt,
  }) = _TodoList;
}
