import 'package:faiseur/core/errors/failures.dart';
import 'package:faiseur/features/auth/domain/repositories/auth_repository.dart';
import 'package:faiseur/features/auth/domain/usecases/get_current_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../helpers/test_helpers.dart';

// Mock implementation
class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('GetCurrentUserUseCase', () {
    late GetCurrentUserUseCase useCase;
    late MockAuthRepository mockRepository;

    setUp(() {
      mockRepository = MockAuthRepository();
      useCase = GetCurrentUserUseCase(mockRepository);
    });

    // ============================================================================
    // HAPPY PATH TESTS
    // ============================================================================

    group('Happy Path - Get Current User', () {
      test('should return current user when authenticated', () async {
        // Arrange
        final testUser = UserBuilder().build();
        when(() => mockRepository.getCurrentUser()).thenAnswer((_) async => testUser);

        // Act
        final result = await useCase.call();

        // Assert
        expect(result, testUser);
        verify(() => mockRepository.getCurrentUser()).called(1);
      });

      test('should return null when user is not authenticated', () async {
        // Arrange
        when(() => mockRepository.getCurrentUser()).thenAnswer((_) async => null);

        // Act
        final result = await useCase.call();

        // Assert
        expect(result, null);
        verify(() => mockRepository.getCurrentUser()).called(1);
      });

      test('should return user with correct properties', () async {
        // Arrange
        final testUser = UserBuilder()
            .withId('user-789')
            .withEmail('john@example.com')
            .withUsername('johndoe')
            .withDisplayName('John Doe')
            .build();

        when(() => mockRepository.getCurrentUser()).thenAnswer((_) async => testUser);

        // Act
        final result = await useCase.call();

        // Assert
        expect(result?.id, 'user-789');
        expect(result?.email, 'john@example.com');
        expect(result?.username, 'johndoe');
        expect(result?.displayName, 'John Doe');
      });

      test('should return user with avatar URL if available', () async {
        // Arrange
        final testUser = UserBuilder().withAvatarUrl('https://example.com/avatar.jpg').build();

        when(() => mockRepository.getCurrentUser()).thenAnswer((_) async => testUser);

        // Act
        final result = await useCase.call();

        // Assert
        expect(result?.avatarUrl, 'https://example.com/avatar.jpg');
      });
    });

    // ============================================================================
    // ERROR PATH TESTS
    // ============================================================================

    group('Error Paths', () {
      test('should throw Failure.network on connectivity error', () async {
        // Arrange
        when(
          () => mockRepository.getCurrentUser(),
        ).thenThrow(const Failure.network(message: 'Network error: No internet connection'));

        // Act & Assert
        expect(() => useCase.call(), throwsA(isA<Failure>()));
      });

      test('should throw Failure.authentication when session expired', () async {
        // Arrange
        when(() => mockRepository.getCurrentUser()).thenThrow(const Failure.authentication(message: 'Session expired'));

        // Act & Assert
        expect(() => useCase.call(), throwsA(isA<Failure>()));
      });

      test('should throw Failure.unknown on unexpected error', () async {
        // Arrange
        when(
          () => mockRepository.getCurrentUser(),
        ).thenThrow(const Failure.unknown(message: 'Unexpected error occurred'));

        // Act & Assert
        expect(() => useCase.call(), throwsA(isA<Failure>()));
      });

      test('should propagate generic exceptions', () async {
        // Arrange
        when(() => mockRepository.getCurrentUser()).thenThrow(Exception('Repository error'));

        // Act & Assert
        expect(() => useCase.call(), throwsException);
      });
    });

    // ============================================================================
    // EDGE CASES
    // ============================================================================

    group('Edge Cases', () {
      test('should handle multiple calls when user is authenticated', () async {
        // Arrange
        final testUser = UserBuilder().build();
        when(() => mockRepository.getCurrentUser()).thenAnswer((_) async => testUser);

        // Act
        final result1 = await useCase.call();
        final result2 = await useCase.call();

        // Assert
        expect(result1, testUser);
        expect(result2, testUser);
        verify(() => mockRepository.getCurrentUser()).called(2);
      });

      test('should handle user with very long email', () async {
        // Arrange
        const longEmail = 'verylongemailaddress.with.many.dots@subdomain.example.co.uk';
        final testUser = UserBuilder().withEmail(longEmail).build();

        when(() => mockRepository.getCurrentUser()).thenAnswer((_) async => testUser);

        // Act
        final result = await useCase.call();

        // Assert
        expect(result?.email, longEmail);
      });

      test('should handle user with special characters in display name', () async {
        // Arrange
        const displayName = "Jean-Pierre O'Brien-Müller";
        final testUser = UserBuilder().withDisplayName(displayName).build();

        when(() => mockRepository.getCurrentUser()).thenAnswer((_) async => testUser);

        // Act
        final result = await useCase.call();

        // Assert
        expect(result?.displayName, displayName);
      });

      test('should handle timeout error', () async {
        // Arrange
        when(() => mockRepository.getCurrentUser()).thenThrow(const Failure.timeout(message: 'Request timed out'));

        // Act & Assert
        expect(() => useCase.call(), throwsA(isA<Failure>()));
      });
    });

    // ============================================================================
    // NULL HANDLING TESTS
    // ============================================================================

    group('Null Handling', () {
      test('should return null when user is not authenticated', () async {
        // Arrange
        when(() => mockRepository.getCurrentUser()).thenAnswer((_) async => null);

        // Act
        final result = await useCase.call();

        // Assert
        expect(result, isNull);
      });

      test('should return null when explicitly set by repository', () async {
        // Arrange
        when(() => mockRepository.getCurrentUser()).thenAnswer((_) async => Future.value(null));

        // Act
        final result = await useCase.call();

        // Assert
        expect(result, null);
      });
    });
  });
}
