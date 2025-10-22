import 'package:faiseur/core/constants/enums.dart';
import 'package:faiseur/features/todos/data/models/todo_model.dart';
import 'package:faiseur/features/todos/domain/entities/todo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Todo Entity', () {
    test('should create todo with required fields', () {
      final now = DateTime.now();
      const todoId = 'todo123';
      const listId = 'list123';
      const title = 'Buy groceries';
      const createdBy = 'user123';

      final todo = Todo(
        id: todoId,
        listId: listId,
        title: title,
        createdBy: createdBy,
        createdAt: now,
      );

      expect(todo.id, equals(todoId));
      expect(todo.listId, equals(listId));
      expect(todo.title, equals(title));
      expect(todo.createdBy, equals(createdBy));
      expect(todo.createdAt, equals(now));
      expect(todo.status, equals(TodoStatus.new_));
      expect(todo.priority, equals(TodoPriority.medium));
      expect(todo.xpReward, equals(10));
      expect(todo.isArchived, isFalse);
    });

    test('should create todo with all fields', () {
      final now = DateTime.now();
      final dueDate = now.add(const Duration(days: 7));
      final completed = now.add(const Duration(days: 8));

      final todo = Todo(
        id: 'todo123',
        listId: 'list123',
        title: 'Buy groceries',
        description: 'Buy milk, bread, and eggs',
        status: TodoStatus.inProgress,
        priority: TodoPriority.high,
        dueDate: dueDate,
        assignedTo: ['user456', 'user789'],
        createdBy: 'user123',
        xpReward: 50,
        isArchived: false,
        tags: ['shopping', 'urgent'],
        createdAt: now,
        updatedAt: now.add(const Duration(hours: 1)),
        completedAt: completed,
      );

      expect(todo.description, equals('Buy milk, bread, and eggs'));
      expect(todo.status, equals(TodoStatus.inProgress));
      expect(todo.priority, equals(TodoPriority.high));
      expect(todo.dueDate, equals(dueDate));
      expect(todo.assignedTo, equals(['user456', 'user789']));
      expect(todo.tags, equals(['shopping', 'urgent']));
    });

    test('should support value equality', () {
      final now = DateTime.now();

      final todo1 = Todo(
        id: 'todo123',
        listId: 'list123',
        title: 'Buy groceries',
        createdBy: 'user123',
        createdAt: now,
      );

      final todo2 = Todo(
        id: 'todo123',
        listId: 'list123',
        title: 'Buy groceries',
        createdBy: 'user123',
        createdAt: now,
      );

      expect(todo1, equals(todo2));
    });

    test('should support copyWith method', () {
      final now = DateTime.now();
      final todo1 = Todo(
        id: 'todo123',
        listId: 'list123',
        title: 'Buy groceries',
        createdBy: 'user123',
        createdAt: now,
      );

      final todo2 = todo1.copyWith(
        status: TodoStatus.done,
        priority: TodoPriority.high,
      );

      expect(todo2.id, equals(todo1.id));
      expect(todo2.status, equals(TodoStatus.done));
      expect(todo2.priority, equals(TodoPriority.high));
      expect(todo2.title, equals(todo1.title));
    });
  });

  group('TodoModel', () {
    test('should convert to Todo entity', () {
      final now = DateTime.now();
      final model = TodoModel(
        id: 'todo123',
        listId: 'list123',
        title: 'Buy groceries',
        createdBy: 'user123',
        createdAt: now,
        status: TodoStatus.inProgress,
        priority: TodoPriority.high,
      );

      final todo = model.toEntity();

      expect(todo.id, equals(model.id));
      expect(todo.title, equals(model.title));
      expect(todo.status, equals(TodoStatus.inProgress));
      expect(todo.priority, equals(TodoPriority.high));
    });

    test('should convert Todo entity to model', () {
      final now = DateTime.now();
      final todo = Todo(
        id: 'todo123',
        listId: 'list123',
        title: 'Buy groceries',
        createdBy: 'user123',
        createdAt: now,
        status: TodoStatus.done,
        priority: TodoPriority.urgent,
      );

      final model = todo.toModel();

      expect(model.id, equals(todo.id));
      expect(model.title, equals(todo.title));
      expect(model.status, equals(TodoStatus.done));
      expect(model.priority, equals(TodoPriority.urgent));
    });

    test('should handle empty assignments and tags', () {
      final now = DateTime.now();
      final model = TodoModel(
        id: 'todo123',
        listId: 'list123',
        title: 'Buy groceries',
        createdBy: 'user123',
        createdAt: now,
      );

      final todo = model.toEntity();

      expect(todo.assignedTo, isEmpty);
      expect(todo.tags, isEmpty);
    });

    test('should round-trip conversion preserves data', () {
      final now = DateTime.now();
      final dueDate = now.add(const Duration(days: 7));
      final originalTodo = Todo(
        id: 'todo123',
        listId: 'list123',
        title: 'Buy groceries',
        description: 'Milk, bread, eggs',
        status: TodoStatus.inProgress,
        priority: TodoPriority.high,
        dueDate: dueDate,
        assignedTo: ['user456'],
        createdBy: 'user123',
        xpReward: 50,
        isArchived: false,
        tags: ['shopping'],
        createdAt: now,
        updatedAt: now.add(const Duration(hours: 1)),
      );

      final model = originalTodo.toModel();
      final restoredTodo = model.toEntity();

      expect(restoredTodo, equals(originalTodo));
    });
  });
}
