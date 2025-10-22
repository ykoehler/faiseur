import 'package:faiseur/core/errors/failures.dart';
import 'package:faiseur/features/auth/domain/repositories/auth_repository.dart';
import 'package:faiseur/features/auth/domain/usecases/sign_in_anonymously.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../helpers/test_helpers.dart';

// Mock implementation
class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('SignInAnonymouslyUseCase', () {
    late SignInAnonymouslyUseCase useCase;
    late MockAuthRepository mockRepository;

    setUp(() {
      mockRepository = MockAuthRepository();
      useCase = SignInAnonymouslyUseCase(mockRepository);
    });

    // ============================================================================
    // HAPPY PATH TESTS
    // ============================================================================

    group('Happy Path - Successful Anonymous Sign In', () {
      test('should sign in anonymously successfully', () async {
        // Arrange
        final testUser = UserBuilder()
            .withId('anonymous-user-id')
            .withEmail('') // Anonymous users may not have email
            .withUsername('anonymous')
            .withDisplayName('Anonymous User')
            .build();

        when(
          () => mockRepository.signInAnonymously(),
        ).thenAnswer((_) async => testUser);

        // Act
        final result = await useCase.call();

        // Assert
        expect(result, testUser);
        verify(() => mockRepository.signInAnonymously()).called(1);
      });

      test('should return user with correct properties', () async {
        // Arrange
        final testUser = UserBuilder()
            .withId('anon-user-123')
            .withUsername('anon-user')
            .build();

        when(
          () => mockRepository.signInAnonymously(),
        ).thenAnswer((_) async => testUser);

        // Act
        final result = await useCase.call();

        // Assert
        expect(result.id, 'anon-user-123');
        expect(result.username, 'anon-user');
        expect(result.id, isNotEmpty);
      });

      test('should handle multiple anonymous sign ins', () async {
        // Arrange
        final testUser = UserBuilder().withId('anon-user').build();

        when(
          () => mockRepository.signInAnonymously(),
        ).thenAnswer((_) async => testUser);

        // Act
        final result = await useCase.call();

        // Assert
        expect(result.id, isNotEmpty);
        verify(() => mockRepository.signInAnonymously()).called(1);
      });
    });

    // ============================================================================
    // ERROR PATH TESTS
    // ============================================================================

    group('Error Paths', () {
      test('should throw Failure.network on connectivity error', () async {
        // Arrange
        when(() => mockRepository.signInAnonymously()).thenThrow(
          const Failure.network(
            message: 'Network error: No internet connection',
          ),
        );

        // Act & Assert
        expect(() => useCase.call(), throwsA(isA<Failure>()));
      });

      test('should throw Failure.authentication on auth error', () async {
        // Arrange
        when(() => mockRepository.signInAnonymously()).thenThrow(
          const Failure.authentication(
            message: 'Anonymous authentication failed',
          ),
        );

        // Act & Assert
        expect(() => useCase.call(), throwsA(isA<Failure>()));
      });

      test('should throw Failure.unknown on unexpected error', () async {
        // Arrange
        when(() => mockRepository.signInAnonymously()).thenThrow(
          const Failure.unknown(message: 'Unexpected error occurred'),
        );

        // Act & Assert
        expect(() => useCase.call(), throwsA(isA<Failure>()));
      });

      test('should throw Failure.timeout on timeout', () async {
        // Arrange
        when(
          () => mockRepository.signInAnonymously(),
        ).thenThrow(const Failure.timeout(message: 'Request timed out'));

        // Act & Assert
        expect(() => useCase.call(), throwsA(isA<Failure>()));
      });

      test('should propagate generic exceptions', () async {
        // Arrange
        when(
          () => mockRepository.signInAnonymously(),
        ).thenThrow(Exception('Repository error'));

        // Act & Assert
        expect(() => useCase.call(), throwsException);
      });
    });

    // ============================================================================
    // REPOSITORY INTERACTION TESTS
    // ============================================================================

    group('Repository Interactions', () {
      test('should call repository once', () async {
        // Arrange
        final testUser = UserBuilder().build();
        when(
          () => mockRepository.signInAnonymously(),
        ).thenAnswer((_) async => testUser);

        // Act
        await useCase.call();

        // Assert
        verify(() => mockRepository.signInAnonymously()).called(1);
        verifyNoMoreInteractions(mockRepository);
      });

      test('should not catch repository exceptions', () async {
        // Arrange
        when(
          () => mockRepository.signInAnonymously(),
        ).thenThrow(Exception('Repository error'));

        // Act & Assert
        expect(() => useCase.call(), throwsException);
      });
    });

    // ============================================================================
    // EDGE CASES
    // ============================================================================

    group('Edge Cases', () {
      test('should handle rapid consecutive calls', () async {
        // Arrange
        final users = List.generate(
          5,
          (i) => UserBuilder().withId('anon-$i').build(),
        );

        var callCount = 0;
        when(
          () => mockRepository.signInAnonymously(),
        ).thenAnswer((_) async => users[callCount++]);

        // Act
        final results = await Future.wait([
          for (var i = 0; i < 5; i++) useCase.call(),
        ]);

        // Assert
        expect(results.length, 5);
        verify(() => mockRepository.signInAnonymously()).called(5);
      });

      test('should handle state error', () async {
        // Arrange
        when(
          () => mockRepository.signInAnonymously(),
        ).thenThrow(const Failure.state(message: 'Invalid state'));

        // Act & Assert
        expect(() => useCase.call(), throwsA(isA<Failure>()));
      });

      test('should handle cancelled operation', () async {
        // Arrange
        when(
          () => mockRepository.signInAnonymously(),
        ).thenThrow(const Failure.cancelled(message: 'Operation cancelled'));

        // Act & Assert
        expect(() => useCase.call(), throwsA(isA<Failure>()));
      });
    });
  });
}
