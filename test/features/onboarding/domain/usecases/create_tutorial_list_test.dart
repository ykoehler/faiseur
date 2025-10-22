import 'package:faiseur/features/lists/domain/repositories/lists_repository.dart';
import 'package:faiseur/features/onboarding/domain/usecases/create_tutorial_list.dart';
import 'package:faiseur/features/todos/domain/repositories/todos_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockListsRepository extends Mock implements ListsRepository {}

class MockTodosRepository extends Mock implements TodosRepository {}

void main() {
  group('CreateTutorialList UseCase', () {
    late MockListsRepository mockListsRepository;
    late MockTodosRepository mockTodosRepository;
    late CreateTutorialList useCase;

    setUp(() {
      mockListsRepository = MockListsRepository();
      mockTodosRepository = MockTodosRepository();
      useCase = CreateTutorialList(listsRepository: mockListsRepository, todosRepository: mockTodosRepository);
    });

    test('should throw ArgumentError when ownerId is empty', () {
      expect(() => useCase(ownerId: ''), throwsA(isA<ArgumentError>()));
    });

    test('should throw ArgumentError when title is empty', () {
      expect(() => useCase(ownerId: 'user-123', title: ''), throwsA(isA<ArgumentError>()));
    });

    test('should throw ArgumentError when title exceeds 200 chars', () {
      expect(() => useCase(ownerId: 'user-123', title: 'a' * 201), throwsA(isA<ArgumentError>()));
    });

    test('should throw ArgumentError when description exceeds 1000 chars', () {
      expect(() => useCase(ownerId: 'user-123', description: 'a' * 1001), throwsA(isA<ArgumentError>()));
    });

    test('getTutorialTodos returns 5 todos', () {
      final todos = useCase.getTutorialTodos();
      expect(todos, hasLength(5));
    });

    test('getTutorialTodos todos have title and description', () {
      final todos = useCase.getTutorialTodos();
      for (final todo in todos) {
        expect(todo['title'], isNotEmpty);
        expect(todo['description'], isNotEmpty);
      }
    });
  });
}
