import 'package:faiseur/core/constants/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

/// Todo domain entity representing a single task/work item.
///
/// A Todo contains:
/// - Metadata (id, timestamps)
/// - Content (title, description)
/// - Status & priority
/// - Assignment & tracking
/// - Gamification info (XP points)
@freezed
abstract class Todo with _$Todo {
  const factory Todo({
    /// Unique identifier for the todo (Firestore doc ID)
    required String id,

    /// ID of the list this todo belongs to
    required String listId,

    /// The title/name of the todo
    required String title,

    /// User ID of the person who created this todo
    required String createdBy,

    /// Timestamp when the todo was created
    required DateTime createdAt,

    /// Current status in the workflow
    @Default(TodoStatus.new_) TodoStatus status,

    /// Priority level
    @Default(TodoPriority.medium) TodoPriority priority,

    /// XP points awarded when this todo is completed
    @Default(10) int xpReward,

    /// Whether this todo is currently archived
    @Default(false) bool isArchived,

    /// Optional detailed description
    String? description,

    /// Optional due date for the todo
    DateTime? dueDate,

    /// Timestamp when the todo was last updated
    DateTime? updatedAt,

    /// Timestamp when the todo was marked as done
    DateTime? completedAt,

    /// List of user IDs assigned to this todo
    @Default([]) List<String> assignedTo,

    /// Optional tags/labels for categorization
    @Default([]) List<String> tags,
  }) = _Todo;
}
