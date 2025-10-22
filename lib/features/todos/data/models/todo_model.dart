import 'package:faiseur/core/constants/enums.dart';
import 'package:faiseur/core/helpers/firestore_date_helpers.dart';
import 'package:faiseur/features/todos/domain/entities/todo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';

/// Todo model for Firestore serialization.
///
/// This model extends the Todo entity and adds JSON serialization
/// capabilities for storing/retrieving from Firestore.
@freezed
abstract class TodoModel with _$TodoModel {
  const factory TodoModel({
    required String id,
    required String listId,
    required String title,
    required String createdBy,
    required DateTime createdAt,
    @Default(TodoStatus.new_) TodoStatus status,
    @Default(TodoPriority.medium) TodoPriority priority,
    @Default(10) int xpReward,
    @Default(false) bool isArchived,
    String? description,
    DateTime? dueDate,
    DateTime? updatedAt,
    DateTime? completedAt,
    @Default([]) List<String> assignedTo,
    @Default([]) List<String> tags,
  }) = _TodoModel;

  /// Create TodoModel from JSON (for Firestore)
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    TodoStatus status;
    try {
      status = TodoStatus.values.firstWhere((s) => s.name == (json['status'] as String? ?? 'new_'));
    } catch (e) {
      status = TodoStatus.new_;
    }

    TodoPriority priority;
    try {
      priority = TodoPriority.values.firstWhere((p) => p.name == (json['priority'] as String? ?? 'medium'));
    } catch (e) {
      priority = TodoPriority.medium;
    }

    return TodoModel(
      id: json['id'] as String,
      listId: json['listId'] as String,
      title: json['title'] as String,
      createdBy: json['createdBy'] as String,
      createdAt: parseFirestoreTimestamp(json['createdAt'], fieldName: 'createdAt'),
      status: status,
      priority: priority,
      xpReward: json['xpReward'] as int? ?? 10,
      isArchived: json['isArchived'] as bool? ?? false,
      description: json['description'] as String?,
      dueDate: parseFirestoreTimestampNullable(json['dueDate'], fieldName: 'dueDate'),
      updatedAt: parseFirestoreTimestampNullable(json['updatedAt'], fieldName: 'updatedAt'),
      completedAt: parseFirestoreTimestampNullable(json['completedAt'], fieldName: 'completedAt'),
      assignedTo: List<String>.from(json['assignedTo'] as List? ?? []),
      tags: List<String>.from(json['tags'] as List? ?? []),
    );
  }
}

/// Extension on TodoModel to serialize to JSON for Firestore
extension TodoModelJsonX on TodoModel {
  /// Convert to JSON for Firestore
  Map<String, dynamic> toJson() => {
    'id': id,
    'listId': listId,
    'title': title,
    'createdBy': createdBy,
    'createdAt': timestampFromDateTime(createdAt),
    'status': status.name,
    'priority': priority.name,
    'xpReward': xpReward,
    'isArchived': isArchived,
    'description': description,
    'dueDate': timestampFromNullableDateTime(dueDate),
    'updatedAt': timestampFromNullableDateTime(updatedAt),
    'completedAt': timestampFromNullableDateTime(completedAt),
    'assignedTo': assignedTo,
    'tags': tags,
  };
}

/// Extension on TodoModel to convert to/from Todo entity
extension TodoModelX on TodoModel {
  /// Convert TodoModel to Todo entity (no conversion needed, already typed)
  Todo toEntity() => Todo(
    id: id,
    listId: listId,
    title: title,
    createdBy: createdBy,
    createdAt: createdAt,
    status: status,
    priority: priority,
    xpReward: xpReward,
    isArchived: isArchived,
    description: description,
    dueDate: dueDate,
    updatedAt: updatedAt,
    completedAt: completedAt,
    assignedTo: assignedTo,
    tags: tags,
  );
}

/// Extension on Todo to convert to TodoModel
extension TodoX on Todo {
  /// Convert Todo entity to TodoModel (no conversion needed, already typed)
  TodoModel toModel() => TodoModel(
    id: id,
    listId: listId,
    title: title,
    createdBy: createdBy,
    createdAt: createdAt,
    status: status,
    priority: priority,
    xpReward: xpReward,
    isArchived: isArchived,
    description: description,
    dueDate: dueDate,
    updatedAt: updatedAt,
    completedAt: completedAt,
    assignedTo: assignedTo,
    tags: tags,
  );
}
