import 'package:faiseur/core/constants/enums.dart';
import 'package:faiseur/core/helpers/firestore_date_helpers.dart';
import 'package:faiseur/features/lists/domain/entities/todo_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_list_model.freezed.dart';

/// TodoList model for Firestore serialization.
///
/// This model extends the TodoList entity and adds JSON serialization
/// capabilities for storing/retrieving from Firestore.
@freezed
abstract class TodoListModel with _$TodoListModel {
  const factory TodoListModel({
    required String id,
    required String title,
    required String color,
    required String ownerId,
    required DateTime createdAt,
    String? description,
    @Default({}) Map<String, String> collaborators,
    @Default(false) bool isArchived,
    @Default(0) int todoCount,
    @Default(0) int completedCount,
    DateTime? updatedAt,
  }) = _TodoListModel;
}

/// Convert a JSON map into a [TodoListModel].
TodoListModel todoListModelFromJson(Map<String, dynamic> json) => TodoListModel(
  id: json['id'] as String,
  title: json['title'] as String,
  color: json['color'] as String,
  ownerId: json['ownerId'] as String,
  createdAt: parseFirestoreTimestamp(json['createdAt'], fieldName: 'createdAt'),
  description: json['description'] as String?,
  collaborators: Map<String, String>.from(json['collaborators'] as Map? ?? {}),
  isArchived: json['isArchived'] as bool? ?? false,
  todoCount: json['todoCount'] as int? ?? 0,
  completedCount: json['completedCount'] as int? ?? 0,
  updatedAt: parseFirestoreTimestampNullable(
    json['updatedAt'],
    fieldName: 'updatedAt',
  ),
);

/// Convert a [TodoListModel] into a JSON map for Firestore.
Map<String, dynamic> todoListModelToJson(TodoListModel model) => {
  'id': model.id,
  'title': model.title,
  'color': model.color,
  'ownerId': model.ownerId,
  'createdAt': timestampFromDateTime(model.createdAt),
  'description': model.description,
  'collaborators': model.collaborators,
  'isArchived': model.isArchived,
  'todoCount': model.todoCount,
  'completedCount': model.completedCount,
  'updatedAt': timestampFromNullableDateTime(model.updatedAt),
};

/// Extension on TodoListModel to convert to/from TodoList entity
extension TodoListModelX on TodoListModel {
  /// Convert TodoListModel to TodoList entity
  /// Note: collaborators are stored as userId->roleString in Firestore,
  /// so we need to convert them to UserRole enums
  TodoList toEntity() {
    final collaboratorsMap = <String, UserRole>{};
    for (final entry in collaborators.entries) {
      try {
        collaboratorsMap[entry.key] = UserRole.values.firstWhere(
          (role) => role.name == entry.value,
        );
      } catch (e) {
        // If role string doesn't match, default to viewer
        collaboratorsMap[entry.key] = UserRole.viewer;
      }
    }

    return TodoList(
      id: id,
      title: title,
      description: description,
      color: color,
      ownerId: ownerId,
      collaborators: collaboratorsMap,
      isArchived: isArchived,
      todoCount: todoCount,
      completedCount: completedCount,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

/// Extension on TodoList to convert to TodoListModel
extension TodoListX on TodoList {
  /// Convert TodoList entity to TodoListModel
  /// Note: collaborators are converted from UserRole enums to strings
  TodoListModel toModel() {
    final collaboratorsMap = <String, String>{};
    for (final entry in collaborators.entries) {
      collaboratorsMap[entry.key] = entry.value.name;
    }

    return TodoListModel(
      id: id,
      title: title,
      description: description,
      color: color,
      ownerId: ownerId,
      collaborators: collaboratorsMap,
      isArchived: isArchived,
      todoCount: todoCount,
      completedCount: completedCount,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
