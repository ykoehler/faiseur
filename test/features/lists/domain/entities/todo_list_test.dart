import 'package:faiseur/core/constants/enums.dart';
import 'package:faiseur/features/lists/data/models/todo_list_model.dart';
import 'package:faiseur/features/lists/domain/entities/todo_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TodoList Entity', () {
    test('should create list with required fields', () {
      final now = DateTime.now();
      const listId = 'list123';
      const title = 'My Tasks';
      const color = '#FF5733';
      const ownerId = 'user123';

      final list = TodoList(
        id: listId,
        title: title,
        color: color,
        ownerId: ownerId,
        createdAt: now,
      );

      expect(list.id, equals(listId));
      expect(list.title, equals(title));
      expect(list.color, equals(color));
      expect(list.ownerId, equals(ownerId));
      expect(list.createdAt, equals(now));
      expect(list.collaborators, isEmpty);
      expect(list.isArchived, isFalse);
      expect(list.todoCount, equals(0));
      expect(list.completedCount, equals(0));
    });

    test('should create list with collaborators', () {
      final now = DateTime.now();
      final collaborators = {
        'user456': UserRole.editor,
        'user789': UserRole.viewer,
      };

      final list = TodoList(
        id: 'list123',
        title: 'Shared Tasks',
        color: '#FF5733',
        ownerId: 'user123',
        createdAt: now,
        collaborators: collaborators,
      );

      expect(list.collaborators, equals(collaborators));
      expect(list.collaborators['user456'], equals(UserRole.editor));
      expect(list.collaborators['user789'], equals(UserRole.viewer));
    });

    test('should support value equality', () {
      final now = DateTime.now();

      final list1 = TodoList(
        id: 'list123',
        title: 'My Tasks',
        color: '#FF5733',
        ownerId: 'user123',
        createdAt: now,
      );

      final list2 = TodoList(
        id: 'list123',
        title: 'My Tasks',
        color: '#FF5733',
        ownerId: 'user123',
        createdAt: now,
      );

      expect(list1, equals(list2));
    });

    test('should support copyWith method', () {
      final now = DateTime.now();
      final list1 = TodoList(
        id: 'list123',
        title: 'My Tasks',
        color: '#FF5733',
        ownerId: 'user123',
        createdAt: now,
      );

      final list2 = list1.copyWith(title: 'Updated Tasks', todoCount: 5);

      expect(list2.id, equals(list1.id));
      expect(list2.title, equals('Updated Tasks'));
      expect(list2.todoCount, equals(5));
      expect(list2.color, equals(list1.color));
    });
  });

  group('TodoListModel', () {
    test('should convert to TodoList entity', () {
      final now = DateTime.now();
      final model = TodoListModel(
        id: 'list123',
        title: 'My Tasks',
        color: '#FF5733',
        ownerId: 'user123',
        createdAt: now,
        collaborators: {'user456': 'editor'},
      );

      final list = model.toEntity();

      expect(list.id, equals(model.id));
      expect(list.title, equals(model.title));
      expect(list.color, equals(model.color));
      expect(list.collaborators['user456'], equals(UserRole.editor));
    });

    test('should convert TodoList entity to model', () {
      final now = DateTime.now();
      final list = TodoList(
        id: 'list123',
        title: 'My Tasks',
        color: '#FF5733',
        ownerId: 'user123',
        createdAt: now,
        collaborators: {'user456': UserRole.editor},
      );

      final model = list.toModel();

      expect(model.id, equals(list.id));
      expect(model.title, equals(list.title));
      expect(model.collaborators['user456'], equals('editor'));
    });

    test('should handle invalid role gracefully', () {
      final model = TodoListModel(
        id: 'list123',
        title: 'My Tasks',
        color: '#FF5733',
        ownerId: 'user123',
        createdAt: DateTime.now(),
        collaborators: {'user456': 'invalid_role'},
      );

      final list = model.toEntity();

      // Should default to viewer for invalid roles
      expect(list.collaborators['user456'], equals(UserRole.viewer));
    });

    test('should round-trip conversion preserves data', () {
      final now = DateTime.now();
      final updated = now.add(const Duration(hours: 1));
      final originalList = TodoList(
        id: 'list123',
        title: 'My Tasks',
        description: 'My task list',
        color: '#FF5733',
        ownerId: 'user123',
        createdAt: now,
        updatedAt: updated,
        collaborators: {'user456': UserRole.editor, 'user789': UserRole.viewer},
        isArchived: true,
        todoCount: 10,
        completedCount: 3,
      );

      final model = originalList.toModel();
      final restoredList = model.toEntity();

      expect(restoredList, equals(originalList));
    });
  });
}
