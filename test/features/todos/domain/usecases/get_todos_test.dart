import 'package:faiseur/features/todos/domain/entities/todo.dart';
import 'package:faiseur/features/todos/domain/repositories/todos_repository.dart';
import 'package:faiseur/features/todos/domain/usecases/get_todos.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTodosRepository extends Mock implements TodosRepository {}

void main() {
  late MockTodosRepository mockRepository;
  late GetTodos getTodos;

  setUp(() {
    mockRepository = MockTodosRepository();
    getTodos = GetTodos(mockRepository);
  });

  group('GetTodos Use Case', () {
    const testListId = 'list-123';

    test('Should retrieve todos for a valid list', () async {
      // Arrange
      final todosList = [
        Todo(
          id: 'todo-1',
          listId: testListId,
          title: 'First todo',
          createdBy: 'user-123',
          createdAt: DateTime.now(),
        ),
        Todo(
          id: 'todo-2',
          listId: testListId,
          title: 'Second todo',
          createdBy: 'user-123',
          createdAt: DateTime.now(),
        ),
      ];

      when(
        () => mockRepository.getTodos(testListId),
      ).thenAnswer((_) async => todosList);

      // Act
      final result = await getTodos.call(testListId);

      // Assert
      expect(result.length, equals(2));
      expect(result[0].title, equals('First todo'));
      expect(result[1].title, equals('Second todo'));

      verify(() => mockRepository.getTodos(testListId)).called(1);
    });

    test('Should return empty list when no todos exist', () async {
      // Arrange
      when(
        () => mockRepository.getTodos(testListId),
      ).thenAnswer((_) async => []);

      // Act
      final result = await getTodos.call(testListId);

      // Assert
      expect(result, isEmpty);
      verify(() => mockRepository.getTodos(testListId)).called(1);
    });

    test('Should throw ArgumentError when listId is empty', () async {
      // Act & Assert
      expect(() => getTodos.call(''), throwsA(isA<ArgumentError>()));
    });

    test('Should watch todos stream for real-time updates', () async {
      // Arrange
      final todo1 = Todo(
        id: 'todo-1',
        listId: testListId,
        title: 'First todo',
        createdBy: 'user-123',
        createdAt: DateTime.now(),
      );

      final todoStream = Stream.value([todo1]);
      when(
        () => mockRepository.watchTodos(testListId),
      ).thenAnswer((_) => todoStream);

      // Act
      final stream = getTodos.watch(testListId);

      // Assert
      expect(
        stream,
        emitsInOrder([
          [todo1],
        ]),
      );

      verify(() => mockRepository.watchTodos(testListId)).called(1);
    });

    test(
      'Should throw ArgumentError when watching with empty listId',
      () async {
        // Act & Assert
        expect(() => getTodos.watch(''), throwsA(isA<ArgumentError>()));
      },
    );

    test('Should handle repository errors', () async {
      // Arrange
      when(
        () => mockRepository.getTodos(testListId),
      ).thenThrow(Exception('Firestore error'));

      // Act & Assert
      expect(() => getTodos.call(testListId), throwsA(isA<Exception>()));
    });
  });
}
