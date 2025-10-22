import 'package:faiseur/core/errors/failures.dart';
import 'package:faiseur/features/auth/domain/entities/user.dart';
import 'package:faiseur/features/auth/domain/repositories/auth_repository.dart';
import 'package:faiseur/features/auth/domain/usecases/sign_in_with_email.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock implementation
class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('SignInWithEmailUseCase', () {
    late SignInWithEmailUseCase useCase;
    late MockAuthRepository mockRepository;

    setUpAll(() {
      registerFallbackValue('test@example.com');
      registerFallbackValue('password123');
    });

    setUp(() {
      mockRepository = MockAuthRepository();
      useCase = SignInWithEmailUseCase(mockRepository);
    });

    // ============================================================================
    // HAPPY PATH TESTS
    // ============================================================================

    group('Happy Path - Successful Sign In', () {
      test('should sign in user successfully with valid credentials', () async {
        // Arrange
        final testUser = User(
          id: 'user-123',
          email: 'test@example.com',
          username: 'testuser',
          displayName: 'Test User',
          createdAt: DateTime.now(),
        );

        when(
          () => mockRepository.signInWithEmail(email: 'test@example.com', password: 'password123'),
        ).thenAnswer((_) async => testUser);

        // Act
        final result = await useCase.call(email: 'test@example.com', password: 'password123');

        // Assert
        expect(result, testUser);
        verify(() => mockRepository.signInWithEmail(email: 'test@example.com', password: 'password123')).called(1);
      });

      test('should return user with correct properties', () async {
        // Arrange
        final testUser = User(
          id: 'user-123',
          email: 'john@example.com',
          username: 'johnsmith',
          displayName: 'John Smith',
          createdAt: DateTime(2025, 10, 21),
        );

        when(
          () => mockRepository.signInWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => testUser);

        // Act
        final result = await useCase.call(email: 'john@example.com', password: 'password123');

        // Assert
        expect(result.email, 'john@example.com');
        expect(result.username, 'johnsmith');
        expect(result.displayName, 'John Smith');
        expect(result.id, isNotEmpty);
      });
    });

    // ============================================================================
    // ERROR PATH TESTS
    // ============================================================================

    group('Error Paths', () {
      test('should throw Failure.authentication for wrong password', () async {
        // Arrange
        when(
          () => mockRepository.signInWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(const Failure.authentication(message: 'Incorrect password'));

        // Act & Assert
        expect(() => useCase.call(email: 'test@example.com', password: 'wrongpassword'), throwsA(isA<Failure>()));
      });

      test('should throw Failure.notFound for non-existent user', () async {
        // Arrange
        when(
          () => mockRepository.signInWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(const Failure.notFound(message: 'No user found with this email'));

        // Act & Assert
        expect(() => useCase.call(email: 'nonexistent@example.com', password: 'password123'), throwsA(isA<Failure>()));
      });

      test('should throw Failure.network on network error', () async {
        // Arrange
        when(
          () => mockRepository.signInWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(const Failure.network(message: 'Network error: No internet connection'));

        // Act & Assert
        expect(() => useCase.call(email: 'test@example.com', password: 'password123'), throwsA(isA<Failure>()));
      });

      test('should throw Failure.unknown on unexpected error', () async {
        // Arrange
        when(
          () => mockRepository.signInWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(const Failure.unknown(message: 'Unexpected error occurred'));

        // Act & Assert
        expect(() => useCase.call(email: 'test@example.com', password: 'password123'), throwsA(isA<Failure>()));
      });
    });

    // ============================================================================
    // VALIDATION TESTS
    // ============================================================================

    group('Input Validation', () {
      test('should reject empty email', () async {
        // Arrange
        when(
          () => mockRepository.signInWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(const Failure.validation(message: 'Email cannot be empty'));

        // Act & Assert
        expect(() => useCase.call(email: '', password: 'password123'), throwsA(isA<Failure>()));
      });

      test('should reject invalid email format', () async {
        // Arrange
        when(
          () => mockRepository.signInWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(const Failure.validation(message: 'Invalid email format'));

        // Act & Assert
        expect(() => useCase.call(email: 'invalid-email', password: 'password123'), throwsA(isA<Failure>()));
      });

      test('should reject empty password', () async {
        // Arrange
        when(
          () => mockRepository.signInWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(const Failure.validation(message: 'Password cannot be empty'));

        // Act & Assert
        expect(() => useCase.call(email: 'test@example.com', password: ''), throwsA(isA<Failure>()));
      });

      test('should reject password shorter than 6 characters', () async {
        // Arrange
        when(
          () => mockRepository.signInWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(const Failure.validation(message: 'Password must be at least 6 characters'));

        // Act & Assert
        expect(() => useCase.call(email: 'test@example.com', password: 'short'), throwsA(isA<Failure>()));
      });
    });

    // ============================================================================
    // EDGE CASE TESTS
    // ============================================================================

    group('Edge Cases', () {
      test('should handle email with mixed case', () async {
        // Arrange
        final testUser = User(
          id: 'user-123',
          email: 'Test@Example.COM',
          username: 'testuser',
          displayName: 'Test User',
          createdAt: DateTime.now(),
        );

        when(
          () => mockRepository.signInWithEmail(email: 'Test@Example.COM', password: 'password123'),
        ).thenAnswer((_) async => testUser);

        // Act
        final result = await useCase.call(email: 'Test@Example.COM', password: 'password123');

        // Assert
        expect(result.email, 'Test@Example.COM');
      });

      test('should handle email with whitespace (trimmed by repository)', () async {
        // Arrange
        final testUser = User(
          id: 'user-123',
          email: 'test@example.com',
          username: 'testuser',
          displayName: 'Test User',
          createdAt: DateTime.now(),
        );

        when(
          () => mockRepository.signInWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => testUser);

        // Act - with whitespace
        final result = await useCase.call(email: '  test@example.com  ', password: 'password123');

        // Assert - should successfully call repository
        expect(result, testUser);
      });

      test('should handle very long email address', () async {
        // Arrange
        const longEmail = 'verylongemailaddress@subdomain.example.co.uk';
        final testUser = User(
          id: 'user-123',
          email: longEmail,
          username: 'testuser',
          displayName: 'Test User',
          createdAt: DateTime.now(),
        );

        when(
          () => mockRepository.signInWithEmail(email: longEmail, password: 'password123'),
        ).thenAnswer((_) async => testUser);

        // Act
        final result = await useCase.call(email: longEmail, password: 'password123');

        // Assert
        expect(result.email, longEmail);
      });

      test('should handle very long password', () async {
        // Arrange
        final longPassword = 'a' * 100; // 100 character password
        final testUser = User(
          id: 'user-123',
          email: 'test@example.com',
          username: 'testuser',
          displayName: 'Test User',
          createdAt: DateTime.now(),
        );

        when(
          () => mockRepository.signInWithEmail(email: 'test@example.com', password: longPassword),
        ).thenAnswer((_) async => testUser);

        // Act
        final result = await useCase.call(email: 'test@example.com', password: longPassword);

        // Assert
        expect(result, testUser);
      });
    });

    // ============================================================================
    // REPOSITORY INTERACTION TESTS
    // ============================================================================

    group('Repository Interactions', () {
      test('should call repository once with correct parameters', () async {
        // Arrange
        final testUser = User(
          id: 'user-123',
          email: 'test@example.com',
          username: 'testuser',
          displayName: 'Test User',
          createdAt: DateTime.now(),
        );

        when(
          () => mockRepository.signInWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => testUser);

        // Act
        await useCase.call(email: 'test@example.com', password: 'password123');

        // Assert - verify exact call parameters
        verify(() => mockRepository.signInWithEmail(email: 'test@example.com', password: 'password123')).called(1);

        // Ensure no other calls made
        verifyNoMoreInteractions(mockRepository);
      });

      test('should not catch repository exceptions', () async {
        // Arrange - repository throws an unknown exception
        when(
          () => mockRepository.signInWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(Exception('Repository error'));

        // Act & Assert - exception should propagate
        expect(() => useCase.call(email: 'test@example.com', password: 'password123'), throwsException);
      });
    });
  });
}
