import 'package:faiseur/features/todos/domain/repositories/todos_repository.dart';
import 'package:faiseur/features/todos/domain/usecases/delete_todo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTodosRepository extends Mock implements TodosRepository {}

void main() {
  late MockTodosRepository mockRepository;
  late DeleteTodo deleteTodo;

  setUp(() {
    mockRepository = MockTodosRepository();
    deleteTodo = DeleteTodo(mockRepository);
  });

  group('DeleteTodo Use Case', () {
    const testListId = 'list-123';
    const testTodoId = 'todo-456';

    test('Should delete todo with valid parameters', () async {
      // Arrange
      when(() => mockRepository.deleteTodo(testListId, testTodoId)).thenAnswer((_) async => Future.value());

      // Act
      await deleteTodo.call(testListId, testTodoId);

      // Assert
      verify(() => mockRepository.deleteTodo(testListId, testTodoId)).called(1);
    });

    test('Should throw ArgumentError when listId is empty', () async {
      // Act & Assert
      expect(() => deleteTodo.call('', testTodoId), throwsA(isA<ArgumentError>()));
    });

    test('Should throw ArgumentError when todoId is empty', () async {
      // Act & Assert
      expect(() => deleteTodo.call(testListId, ''), throwsA(isA<ArgumentError>()));
    });

    test('Should handle repository errors', () async {
      // Arrange
      when(() => mockRepository.deleteTodo(testListId, testTodoId)).thenThrow(Exception('Firestore error'));

      // Act & Assert
      expect(() => deleteTodo.call(testListId, testTodoId), throwsA(isA<Exception>()));
    });
  });
}
