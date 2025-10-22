import 'package:faiseur/features/todos/domain/entities/todo.dart';
import 'package:faiseur/features/todos/domain/repositories/todos_repository.dart';
import 'package:faiseur/features/todos/domain/usecases/create_todo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTodosRepository extends Mock implements TodosRepository {}

void main() {
  late MockTodosRepository mockRepository;
  late CreateTodo createTodo;

  setUpAll(() {
    registerFallbackValue(DateTime.now());
  });

  setUp(() {
    mockRepository = MockTodosRepository();
    createTodo = CreateTodo(mockRepository);
  });

  group('CreateTodo Use Case', () {
    const testListId = 'list-123';
    const testUserId = 'user-456';
    const testTitle = 'Buy groceries';

    test('Should create todo with valid parameters', () async {
      // Arrange
      final expectedTodo = Todo(
        id: 'todo-123',
        listId: testListId,
        title: testTitle,
        createdBy: testUserId,
        createdAt: DateTime.now(),
      );

      when(
        () => mockRepository.createTodo(
          listId: any(named: 'listId'),
          title: any(named: 'title'),
          createdBy: any(named: 'createdBy'),
          description: any(named: 'description'),
          dueDate: any(named: 'dueDate'),
          assignedTo: any(named: 'assignedTo'),
          tags: any(named: 'tags'),
        ),
      ).thenAnswer((_) async => expectedTodo);

      // Act
      final result = await createTodo.call(listId: testListId, title: testTitle, createdBy: testUserId);

      // Assert
      expect(result.id, equals('todo-123'));
      expect(result.title, equals(testTitle));
      expect(result.listId, equals(testListId));
      expect(result.createdBy, equals(testUserId));

      verify(
        () => mockRepository.createTodo(
          listId: testListId,
          title: testTitle,
          createdBy: testUserId,
          description: null,
          dueDate: null,
          assignedTo: null,
          tags: null,
        ),
      ).called(1);
    });

    test('Should throw ArgumentError when listId is empty', () async {
      // Act & Assert
      expect(() => createTodo.call(listId: '', title: testTitle, createdBy: testUserId), throwsA(isA<ArgumentError>()));
    });

    test('Should throw ArgumentError when title is empty', () async {
      // Act & Assert
      expect(
        () => createTodo.call(listId: testListId, title: '', createdBy: testUserId),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('Should throw ArgumentError when createdBy is empty', () async {
      // Act & Assert
      expect(() => createTodo.call(listId: testListId, title: testTitle, createdBy: ''), throwsA(isA<ArgumentError>()));
    });

    test('Should throw ArgumentError when title exceeds 500 characters', () async {
      // Arrange
      final longTitle = 'a' * 501;

      // Act & Assert
      expect(
        () => createTodo.call(listId: testListId, title: longTitle, createdBy: testUserId),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('Should throw ArgumentError when xpReward is negative', () async {
      // Act & Assert
      expect(
        () => createTodo.call(listId: testListId, title: testTitle, createdBy: testUserId, xpReward: -1),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('Should throw ArgumentError when dueDate is in the past', () async {
      // Arrange
      final pastDate = DateTime.now().subtract(const Duration(days: 1));

      // Act & Assert
      expect(
        () => createTodo.call(listId: testListId, title: testTitle, createdBy: testUserId, dueDate: pastDate),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('Should create todo with optional parameters', () async {
      // Arrange
      final futureDate = DateTime.now().add(const Duration(days: 7));
      final expectedTodo = Todo(
        id: 'todo-123',
        listId: testListId,
        title: testTitle,
        createdBy: testUserId,
        createdAt: DateTime.now(),
        description: 'Buy milk and bread',
        dueDate: futureDate,
        assignedTo: ['user-789'],
        tags: ['shopping'],
      );

      when(
        () => mockRepository.createTodo(
          listId: any(named: 'listId'),
          title: any(named: 'title'),
          createdBy: any(named: 'createdBy'),
          description: any(named: 'description'),
          dueDate: any(named: 'dueDate'),
          assignedTo: any(named: 'assignedTo'),
          tags: any(named: 'tags'),
        ),
      ).thenAnswer((_) async => expectedTodo);

      // Act
      final result = await createTodo.call(
        listId: testListId,
        title: testTitle,
        createdBy: testUserId,
        description: 'Buy milk and bread',
        dueDate: futureDate,
        assignedTo: ['user-789'],
        tags: ['shopping'],
      );

      // Assert
      expect(result.description, equals('Buy milk and bread'));
      expect(result.dueDate, equals(futureDate));
      expect(result.assignedTo, equals(['user-789']));
      expect(result.tags, equals(['shopping']));
    });
  });
}
