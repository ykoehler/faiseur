// Common test helpers and utilities for unit and widget tests.
//
// Provides utilities for setting up tests with Riverpod and Flutter testing.

import 'package:faiseur/core/constants/enums.dart';
import 'package:faiseur/features/auth/domain/entities/user.dart';
import 'package:faiseur/features/lists/domain/entities/todo_list.dart';
import 'package:faiseur/features/todos/domain/entities/todo.dart';
import 'package:flutter_test/flutter_test.dart';

// ============================================================================
// TEST DATA BUILDERS
// ============================================================================

/// Builder for creating test User entities with sensible defaults.
// ignore_for_file: avoid_returning_this
class UserBuilder {
  String id = 'test-user-id';
  String email = 'test@example.com';
  String username = 'testuser';
  String displayName = 'Test User';
  DateTime createdAt = DateTime(2025, 10, 21);
  String? avatarUrl;
  DateTime? updatedAt;

  UserBuilder withId(String id) {
    this.id = id;
    return this;
  }

  UserBuilder withEmail(String email) {
    this.email = email;
    return this;
  }

  UserBuilder withUsername(String username) {
    this.username = username;
    return this;
  }

  UserBuilder withDisplayName(String displayName) {
    this.displayName = displayName;
    return this;
  }

  UserBuilder withCreatedAt(DateTime createdAt) {
    this.createdAt = createdAt;
    return this;
  }

  UserBuilder withAvatarUrl(String? avatarUrl) {
    this.avatarUrl = avatarUrl;
    return this;
  }

  UserBuilder withUpdatedAt(DateTime? updatedAt) {
    this.updatedAt = updatedAt;
    return this;
  }

  User build() => User(
    id: id,
    email: email,
    username: username,
    displayName: displayName,
    createdAt: createdAt,
    avatarUrl: avatarUrl,
    updatedAt: updatedAt,
  );
}

/// Builder for creating test Todo entities with sensible defaults.
class TodoBuilder {
  String id = 'test-todo-id';
  String listId = 'test-list-id';
  String title = 'Test Todo';
  String createdBy = 'test-user-id';
  DateTime createdAt = DateTime(2025, 10, 21);
  TodoStatus status = TodoStatus.new_;
  TodoPriority priority = TodoPriority.medium;
  int xpReward = 10;
  bool isArchived = false;
  String? description;
  DateTime? dueDate;
  DateTime? updatedAt;
  DateTime? completedAt;
  List<String> assignedTo = [];
  List<String> tags = [];

  TodoBuilder withId(String id) {
    this.id = id;
    return this;
  }

  TodoBuilder withListId(String listId) {
    this.listId = listId;
    return this;
  }

  TodoBuilder withTitle(String title) {
    this.title = title;
    return this;
  }

  TodoBuilder withCreatedBy(String createdBy) {
    this.createdBy = createdBy;
    return this;
  }

  TodoBuilder withDescription(String? description) {
    this.description = description;
    return this;
  }

  TodoBuilder withStatus(TodoStatus status) {
    this.status = status;
    return this;
  }

  TodoBuilder withPriority(TodoPriority priority) {
    this.priority = priority;
    return this;
  }

  TodoBuilder withDueDate(DateTime? dueDate) {
    this.dueDate = dueDate;
    return this;
  }

  TodoBuilder withAssignedTo(List<String> assignedTo) {
    this.assignedTo = assignedTo;
    return this;
  }

  TodoBuilder withXpReward(int xpReward) {
    this.xpReward = xpReward;
    return this;
  }

  TodoBuilder asArchived() {
    isArchived = true;
    return this;
  }

  Todo build() => Todo(
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

/// Builder for creating test TodoList entities with sensible defaults.
class TodoListBuilder {
  String id = 'test-list-id';
  String title = 'Test List';
  String color = '#FF5733';
  String ownerId = 'test-user-id';
  DateTime createdAt = DateTime(2025, 10, 21);
  String? description;
  Map<String, UserRole> collaborators = {};
  bool isArchived = false;
  int todoCount = 0;
  int completedCount = 0;
  DateTime? updatedAt;

  TodoListBuilder withId(String id) {
    this.id = id;
    return this;
  }

  TodoListBuilder withOwnerId(String ownerId) {
    this.ownerId = ownerId;
    return this;
  }

  TodoListBuilder withTitle(String title) {
    this.title = title;
    return this;
  }

  TodoListBuilder withColor(String color) {
    this.color = color;
    return this;
  }

  TodoListBuilder withDescription(String? description) {
    this.description = description;
    return this;
  }

  TodoListBuilder withCollaborators(Map<String, UserRole> collaborators) {
    this.collaborators = collaborators;
    return this;
  }

  TodoListBuilder withTodoCount(int todoCount) {
    this.todoCount = todoCount;
    return this;
  }

  TodoListBuilder withCompletedCount(int completedCount) {
    this.completedCount = completedCount;
    return this;
  }

  TodoListBuilder asArchived() {
    isArchived = true;
    return this;
  }

  TodoList build() => TodoList(
    id: id,
    title: title,
    color: color,
    ownerId: ownerId,
    createdAt: createdAt,
    description: description,
    collaborators: collaborators,
    isArchived: isArchived,
    todoCount: todoCount,
    completedCount: completedCount,
    updatedAt: updatedAt,
  );
}

// ============================================================================
// TEST DATA CONSTANTS
// ============================================================================

/// Common test data that can be reused across tests
class TestData {
  static const String validEmail = 'valid@example.com';
  static const String invalidEmail = 'invalid-email';
  static const String validUsername = 'validusername';
  static const String invalidUsername = 'a'; // Too short
  static const String validPassword = 'StrongPassword123!';
  static const String shortPassword = 'short';
  static const String validDisplayName = 'John Doe';

  static final DateTime now = DateTime(2025, 10, 21);
  static final DateTime yesterday = now.subtract(const Duration(days: 1));
  static final DateTime tomorrow = now.add(const Duration(days: 1));
  static final DateTime nextWeek = now.add(const Duration(days: 7));
}

// ============================================================================
// ASSERTION HELPERS
// ============================================================================

/// Custom assertion helpers for common test patterns
class TestAssertions {
  /// Asserts that a user has the expected properties
  static void assertUserProperties(
    dynamic user, {
    required String email,
    required String username,
    required String displayName,
    String? id,
    String? avatarUrl,
  }) {
    expect(user.email, email);
    expect(user.username, username);
    expect(user.displayName, displayName);
    if (id != null) {
      expect(user.id, id);
    }
    if (avatarUrl != null) {
      expect(user.avatarUrl, avatarUrl);
    }
  }

  /// Asserts that a todo has the expected properties
  static void assertTodoProperties(
    dynamic todo, {
    required String title,
    TodoStatus? status,
    TodoPriority? priority,
    String? description,
  }) {
    expect(todo.title, title);
    if (status != null) {
      expect(todo.status, status);
    }
    if (priority != null) {
      expect(todo.priority, priority);
    }
    if (description != null) {
      expect(todo.description, description);
    }
  }
}
