import 'package:faiseur/core/errors/failures.dart';
import 'package:faiseur/features/auth/domain/repositories/auth_repository.dart';
import 'package:faiseur/features/auth/domain/usecases/sign_out.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock implementation
class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('SignOutUseCase', () {
    late SignOutUseCase useCase;
    late MockAuthRepository mockRepository;

    setUp(() {
      mockRepository = MockAuthRepository();
      useCase = SignOutUseCase(mockRepository);
    });

    // ============================================================================
    // HAPPY PATH TESTS
    // ============================================================================

    group('Happy Path - Successful Sign Out', () {
      test('should sign out user successfully', () async {
        // Arrange
        when(
          () => mockRepository.signOut(),
        ).thenAnswer((_) async => Future.value());

        // Act
        await useCase.call();

        // Assert
        verify(() => mockRepository.signOut()).called(1);
      });

      test('should call signOut method on repository', () async {
        // Arrange
        when(
          () => mockRepository.signOut(),
        ).thenAnswer((_) async => Future.value());

        // Act
        await useCase.call();

        // Assert
        verify(() => mockRepository.signOut()).called(1);
        verifyNoMoreInteractions(mockRepository);
      });
    });

    // ============================================================================
    // ERROR PATH TESTS
    // ============================================================================

    group('Error Paths', () {
      test('should propagate network error from repository', () async {
        // Arrange
        when(() => mockRepository.signOut()).thenThrow(
          const Failure.network(
            message: 'Network error: No internet connection',
          ),
        );

        // Act & Assert
        expect(() => useCase.call(), throwsA(isA<Failure>()));
      });

      test('should propagate unknown error from repository', () async {
        // Arrange
        when(() => mockRepository.signOut()).thenThrow(
          const Failure.unknown(message: 'Unexpected error occurred'),
        );

        // Act & Assert
        expect(() => useCase.call(), throwsA(isA<Failure>()));
      });

      test('should propagate generic exceptions', () async {
        // Arrange
        when(
          () => mockRepository.signOut(),
        ).thenThrow(Exception('Repository error'));

        // Act & Assert
        expect(() => useCase.call(), throwsException);
      });
    });

    // ============================================================================
    // EDGE CASES
    // ============================================================================

    group('Edge Cases', () {
      test('should handle multiple sign-out calls', () async {
        // Arrange
        when(
          () => mockRepository.signOut(),
        ).thenAnswer((_) async => Future.value());

        // Act
        await useCase.call();
        await useCase.call();

        // Assert - called twice
        verify(() => mockRepository.signOut()).called(2);
      });

      test('should handle timeout error', () async {
        // Arrange
        when(
          () => mockRepository.signOut(),
        ).thenThrow(const Failure.timeout(message: 'Request timed out'));

        // Act & Assert
        expect(() => useCase.call(), throwsA(isA<Failure>()));
      });
    });
  });
}
