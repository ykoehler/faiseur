import 'package:faiseur/features/lists/domain/entities/todo_list.dart';
import 'package:faiseur/features/lists/domain/repositories/lists_repository.dart';
import 'package:faiseur/features/lists/domain/usecases/create_list.dart';
import 'package:faiseur/features/lists/domain/usecases/delete_list.dart';
import 'package:faiseur/features/lists/domain/usecases/get_user_lists.dart';
import 'package:faiseur/features/lists/domain/usecases/update_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock repository
class MockListsRepository extends Mock implements ListsRepository {}

void main() {
  late MockListsRepository mockRepository;

  setUp(() {
    mockRepository = MockListsRepository();
  });

  group('GetUserLists Use Case', () {
    test('should retrieve lists for a user', () async {
      // Arrange
      const userId = 'user123';
      final mockLists = [
        TodoList(id: 'list1', title: 'Shopping', color: '#3498db', ownerId: userId, createdAt: DateTime.now()),
        TodoList(id: 'list2', title: 'Work', color: '#e74c3c', ownerId: userId, createdAt: DateTime.now()),
      ];

      when(() => mockRepository.getUserLists(userId)).thenAnswer((_) async => mockLists);

      final useCase = GetUserLists(repository: mockRepository);

      // Act
      final result = await useCase.call(userId);

      // Assert
      expect(result, mockLists);
      expect(result.length, 2);
      verify(() => mockRepository.getUserLists(userId)).called(1);
    });

    test('should throw when userId is empty', () async {
      final useCase = GetUserLists(repository: mockRepository);

      // Act & Assert
      expect(() => useCase.call(''), throwsA(isA<ArgumentError>()));
    });

    test('should return empty list when user has no lists', () async {
      // Arrange
      const userId = 'user123';
      when(() => mockRepository.getUserLists(userId)).thenAnswer((_) async => <TodoList>[]);

      final useCase = GetUserLists(repository: mockRepository);

      // Act
      final result = await useCase.call(userId);

      // Assert
      expect(result, <TodoList>[]);
      verify(() => mockRepository.getUserLists(userId)).called(1);
    });

    test('should watch lists for real-time updates', () async {
      // Arrange
      const userId = 'user123';
      final mockList = TodoList(
        id: 'list1',
        title: 'Shopping',
        color: '#3498db',
        ownerId: userId,
        createdAt: DateTime.now(),
      );

      when(() => mockRepository.watchUserLists(userId)).thenAnswer((_) => Stream.value([mockList]));

      final useCase = GetUserLists(repository: mockRepository);

      // Act & Assert
      expect(useCase.watch(userId), emits([mockList]));
      verify(() => mockRepository.watchUserLists(userId)).called(1);
    });
  });

  group('CreateList Use Case', () {
    test('should create a list with valid parameters', () async {
      // Arrange
      const params = CreateListParams(
        title: 'Shopping',
        color: '#3498db',
        ownerId: 'user123',
        description: 'Grocery shopping',
      );

      final mockList = TodoList(
        id: 'list1',
        title: params.title,
        color: params.color,
        ownerId: params.ownerId,
        createdAt: DateTime.now(),
        description: params.description,
      );

      when(
        () => mockRepository.createList(
          title: params.title,
          color: params.color,
          ownerId: params.ownerId,
          description: params.description,
        ),
      ).thenAnswer((_) async => mockList);

      final useCase = CreateList(repository: mockRepository);

      // Act
      final result = await useCase.call(params);

      // Assert
      expect(result.title, params.title);
      expect(result.color, params.color);
      expect(result.ownerId, params.ownerId);
    });

    test('should throw when title is empty', () async {
      const params = CreateListParams(title: '', color: '#3498db', ownerId: 'user123');

      final useCase = CreateList(repository: mockRepository);

      // Act & Assert
      expect(() => useCase.call(params), throwsA(isA<ArgumentError>()));
    });

    test('should throw when title exceeds max length', () async {
      final params = CreateListParams(title: 'a' * 260, color: '#3498db', ownerId: 'user123');

      final useCase = CreateList(repository: mockRepository);

      // Act & Assert
      expect(() => useCase.call(params), throwsA(isA<ArgumentError>()));
    });

    test('should throw when color is invalid', () async {
      const params = CreateListParams(title: 'Shopping', color: 'invalid-color', ownerId: 'user123');

      final useCase = CreateList(repository: mockRepository);

      // Act & Assert
      expect(() => useCase.call(params), throwsA(isA<ArgumentError>()));
    });

    test('should throw when ownerId is empty', () async {
      const params = CreateListParams(title: 'Shopping', color: '#3498db', ownerId: '');

      final useCase = CreateList(repository: mockRepository);

      // Act & Assert
      expect(() => useCase.call(params), throwsA(isA<ArgumentError>()));
    });

    test('should throw when description exceeds max length', () async {
      final params = CreateListParams(title: 'Shopping', color: '#3498db', ownerId: 'user123', description: 'a' * 1001);

      final useCase = CreateList(repository: mockRepository);

      // Act & Assert
      expect(() => useCase.call(params), throwsA(isA<ArgumentError>()));
    });
  });

  group('UpdateList Use Case', () {
    test('should update a list with valid parameters', () async {
      // Arrange
      final list = TodoList(
        id: 'list1',
        title: 'Shopping',
        color: '#3498db',
        ownerId: 'user123',
        createdAt: DateTime.now(),
      );

      final updatedList = list.copyWith(title: 'Updated Shopping');

      when(() => mockRepository.updateList(updatedList)).thenAnswer((_) async => updatedList);

      final useCase = UpdateList(repository: mockRepository);

      // Act
      final result = await useCase.call(updatedList);

      // Assert
      expect(result.title, 'Updated Shopping');
      verify(() => mockRepository.updateList(updatedList)).called(1);
    });

    test('should throw when list ID is empty', () async {
      // Arrange
      final list = TodoList(id: '', title: 'Shopping', color: '#3498db', ownerId: 'user123', createdAt: DateTime.now());

      final useCase = UpdateList(repository: mockRepository);

      // Act & Assert
      expect(() => useCase.call(list), throwsA(isA<ArgumentError>()));
    });

    test('should throw when title is empty', () async {
      // Arrange
      final list = TodoList(id: 'list1', title: '', color: '#3498db', ownerId: 'user123', createdAt: DateTime.now());

      final useCase = UpdateList(repository: mockRepository);

      // Act & Assert
      expect(() => useCase.call(list), throwsA(isA<ArgumentError>()));
    });
  });

  group('DeleteList Use Case', () {
    test('should delete a list', () async {
      // Arrange
      const listId = 'list1';

      when(() => mockRepository.deleteList(listId)).thenAnswer((_) async => {});

      final useCase = DeleteList(repository: mockRepository);

      // Act
      await useCase.call(listId);

      // Assert
      verify(() => mockRepository.deleteList(listId)).called(1);
    });

    test('should throw when listId is empty', () async {
      final useCase = DeleteList(repository: mockRepository);

      // Act & Assert
      expect(() => useCase.call(''), throwsA(isA<ArgumentError>()));
    });

    test('should handle deletion errors gracefully', () async {
      // Arrange
      const listId = 'list1';

      when(() => mockRepository.deleteList(listId)).thenThrow(Exception('Deletion failed'));

      final useCase = DeleteList(repository: mockRepository);

      // Act & Assert
      expect(() => useCase.call(listId), throwsA(isA<Exception>()));
    });
  });
}
