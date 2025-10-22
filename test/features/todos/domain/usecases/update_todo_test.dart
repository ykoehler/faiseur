import 'package:faiseur/core/constants/enums.dart';
import 'package:faiseur/features/todos/domain/entities/todo.dart';
import 'package:faiseur/features/todos/domain/repositories/todos_repository.dart';
import 'package:faiseur/features/todos/domain/usecases/update_todo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTodosRepository extends Mock implements TodosRepository {}

void main() {
  late MockTodosRepository mockRepository;
  late UpdateTodo updateTodo;

  setUpAll(() {
    registerFallbackValue(
      Todo(
        id: 'test',
        listId: 'test',
        title: 'test',
        createdBy: 'test',
        createdAt: DateTime.now(),
      ),
    );
  });

  setUp(() {
    mockRepository = MockTodosRepository();
    updateTodo = UpdateTodo(mockRepository);
  });

  group('UpdateTodo Use Case', () {
    final testTodo = Todo(
      id: 'todo-123',
      listId: 'list-456',
      title: 'Buy groceries',
      createdBy: 'user-789',
      createdAt: DateTime.now(),
    );

    test('Should update todo with valid parameters', () async {
      // Arrange
      final updatedTodo = testTodo.copyWith(
        title: 'Buy groceries and cook',
        status: TodoStatus.done,
      );

      when(
        () => mockRepository.updateTodo(any()),
      ).thenAnswer((_) async => updatedTodo);

      // Act
      final result = await updateTodo.call(updatedTodo);

      // Assert
      expect(result.title, equals('Buy groceries and cook'));
      expect(result.status, equals(TodoStatus.done));

      verify(() => mockRepository.updateTodo(updatedTodo)).called(1);
    });

    test('Should throw ArgumentError when todo id is empty', () async {
      // Arrange
      final invalidTodo = testTodo.copyWith(id: '');

      // Act & Assert
      expect(() => updateTodo.call(invalidTodo), throwsA(isA<ArgumentError>()));
    });

    test('Should throw ArgumentError when todo listId is empty', () async {
      // Arrange
      final invalidTodo = testTodo.copyWith(listId: '');

      // Act & Assert
      expect(() => updateTodo.call(invalidTodo), throwsA(isA<ArgumentError>()));
    });

    test('Should throw ArgumentError when todo title is empty', () async {
      // Arrange
      final invalidTodo = testTodo.copyWith(title: '');

      // Act & Assert
      expect(() => updateTodo.call(invalidTodo), throwsA(isA<ArgumentError>()));
    });

    test(
      'Should throw ArgumentError when title exceeds 500 characters',
      () async {
        // Arrange
        final longTitle = 'a' * 501;
        final invalidTodo = testTodo.copyWith(title: longTitle);

        // Act & Assert
        expect(
          () => updateTodo.call(invalidTodo),
          throwsA(isA<ArgumentError>()),
        );
      },
    );

    test(
      'Should throw ArgumentError when description exceeds 5000 characters',
      () async {
        // Arrange
        final longDescription = 'a' * 5001;
        final invalidTodo = testTodo.copyWith(description: longDescription);

        // Act & Assert
        expect(
          () => updateTodo.call(invalidTodo),
          throwsA(isA<ArgumentError>()),
        );
      },
    );

    test('Should update todo with all fields', () async {
      // Arrange
      final futureDate = DateTime.now().add(const Duration(days: 7));
      final updatedTodo = testTodo.copyWith(
        title: 'Updated title',
        description: 'Updated description',
        status: TodoStatus.inProgress,
        priority: TodoPriority.high,
        dueDate: futureDate,
        assignedTo: ['user-999'],
        tags: ['urgent'],
      );

      when(
        () => mockRepository.updateTodo(any()),
      ).thenAnswer((_) async => updatedTodo);

      // Act
      final result = await updateTodo.call(updatedTodo);

      // Assert
      expect(result.title, equals('Updated title'));
      expect(result.description, equals('Updated description'));
      expect(result.status, equals(TodoStatus.inProgress));
      expect(result.priority, equals(TodoPriority.high));
      expect(result.dueDate, equals(futureDate));
      expect(result.assignedTo, equals(['user-999']));
      expect(result.tags, equals(['urgent']));
    });
  });
}
