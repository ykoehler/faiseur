import 'package:faiseur/core/constants/enums.dart';
import 'package:faiseur/features/todos/domain/entities/todo.dart';
import 'package:faiseur/features/todos/presentation/widgets/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TodoItem Widget Tests', () {
    late Todo testTodo;

    setUp(() {
      testTodo = Todo(
        id: 'test-todo-id',
        listId: 'test-list-id',
        title: 'Test Todo Item',
        createdBy: 'test-user-id',
        createdAt: DateTime.now(),
        status: TodoStatus.new_,
        priority: TodoPriority.medium,
        xpReward: 10,
        isArchived: false,
      );
    });

    testWidgets('TodoItem renders with title', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TodoItem(todo: testTodo, onTap: () {}, onStatusChanged: (_) {}, onDelete: () {}),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Test Todo Item'), findsOneWidget);
    });

    testWidgets('TodoItem displays priority indicator', (tester) async {
      final highPriorityTodo = Todo(
        id: 'test-todo-id',
        listId: 'test-list-id',
        title: 'High Priority Todo',
        createdBy: 'test-user-id',
        createdAt: DateTime.now(),
        status: TodoStatus.new_,
        priority: TodoPriority.high,
        xpReward: 10,
        isArchived: false,
      );

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TodoItem(todo: highPriorityTodo, onTap: () {}, onStatusChanged: (_) {}, onDelete: () {}),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(TodoItem), findsOneWidget);
    });

    testWidgets('TodoItem displays completed status', (tester) async {
      final completedTodo = Todo(
        id: 'test-todo-id',
        listId: 'test-list-id',
        title: 'Completed Todo',
        createdBy: 'test-user-id',
        createdAt: DateTime.now(),
        status: TodoStatus.done,
        priority: TodoPriority.medium,
        xpReward: 10,
        isArchived: false,
      );

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TodoItem(todo: completedTodo, onTap: () {}, onStatusChanged: (_) {}, onDelete: () {}),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(TodoItem), findsOneWidget);
    });

    testWidgets('TodoItem displays due date when set', (tester) async {
      final dueDate = DateTime.now().add(const Duration(days: 7));
      final todoWithDueDate = Todo(
        id: 'test-todo-id',
        listId: 'test-list-id',
        title: 'Todo with due date',
        createdBy: 'test-user-id',
        createdAt: DateTime.now(),
        status: TodoStatus.new_,
        priority: TodoPriority.medium,
        xpReward: 10,
        isArchived: false,
        dueDate: dueDate,
      );

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TodoItem(todo: todoWithDueDate, onTap: () {}, onStatusChanged: (_) {}, onDelete: () {}),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(TodoItem), findsOneWidget);
    });

    testWidgets('TodoItem is tappable', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TodoItem(
                todo: testTodo,
                onTap: () {
                  tapped = true;
                },
                onStatusChanged: (_) {},
                onDelete: () {},
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(Card));
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });

    testWidgets('TodoItem renders without errors', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: TodoItem(todo: testTodo, onTap: () {}, onStatusChanged: (_) {}, onDelete: () {}),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
    });
  });
}
