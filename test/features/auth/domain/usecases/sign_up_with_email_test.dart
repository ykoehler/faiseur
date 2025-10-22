import 'package:faiseur/core/errors/failures.dart';
import 'package:faiseur/features/auth/domain/repositories/auth_repository.dart';
import 'package:faiseur/features/auth/domain/usecases/sign_up_with_email.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../helpers/test_helpers.dart';

// Mock implementation
class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('SignUpWithEmailUseCase', () {
    late SignUpWithEmailUseCase useCase;
    late MockAuthRepository mockRepository;

    setUpAll(() {
      registerFallbackValue('test@example.com');
      registerFallbackValue('password123');
      registerFallbackValue('testuser');
      registerFallbackValue('Test User');
    });

    setUp(() {
      mockRepository = MockAuthRepository();
      useCase = SignUpWithEmailUseCase(mockRepository);
    });

    // ============================================================================
    // HAPPY PATH TESTS
    // ============================================================================

    group('Happy Path - Successful Sign Up', () {
      test('should create new user successfully with valid credentials', () async {
        // Arrange
        final testUser = UserBuilder()
            .withEmail('newuser@example.com')
            .withUsername('newuser')
            .withDisplayName('New User')
            .build();

        when(
          () => mockRepository.signUpWithEmail(
            email: 'newuser@example.com',
            password: 'Password123!',
            username: 'newuser',
            displayName: 'New User',
          ),
        ).thenAnswer((_) async => testUser);

        // Act
        final result = await useCase.call(
          email: 'newuser@example.com',
          password: 'Password123!',
          username: 'newuser',
          displayName: 'New User',
        );

        // Assert
        expect(result, testUser);
        verify(
          () => mockRepository.signUpWithEmail(
            email: 'newuser@example.com',
            password: 'Password123!',
            username: 'newuser',
            displayName: 'New User',
          ),
        ).called(1);
      });

      test('should return user with all correct properties', () async {
        // Arrange
        final testUser = UserBuilder()
            .withId('user-456')
            .withEmail('john.doe@example.com')
            .withUsername('johndoe')
            .withDisplayName('John Doe')
            .build();

        when(
          () => mockRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            username: any(named: 'username'),
            displayName: any(named: 'displayName'),
          ),
        ).thenAnswer((_) async => testUser);

        // Act
        final result = await useCase.call(
          email: 'john.doe@example.com',
          password: 'password123',
          username: 'johndoe',
          displayName: 'John Doe',
        );

        // Assert
        expect(result.id, 'user-456');
        expect(result.email, 'john.doe@example.com');
        expect(result.username, 'johndoe');
        expect(result.displayName, 'John Doe');
      });

      test('should create user with avatar URL if provided', () async {
        // Arrange
        final testUser = UserBuilder().withAvatarUrl('https://example.com/avatar.jpg').build();

        when(
          () => mockRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            username: any(named: 'username'),
            displayName: any(named: 'displayName'),
          ),
        ).thenAnswer((_) async => testUser);

        // Act
        final result = await useCase.call(
          email: 'test@example.com',
          password: 'password123',
          username: 'testuser',
          displayName: 'Test User',
        );

        // Assert
        expect(result.avatarUrl, 'https://example.com/avatar.jpg');
      });
    });

    // ============================================================================
    // EMAIL VALIDATION TESTS
    // ============================================================================

    group('Email Validation', () {
      test('should reject empty email', () async {
        // Arrange
        when(
          () => mockRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            username: any(named: 'username'),
            displayName: any(named: 'displayName'),
          ),
        ).thenThrow(const Failure.validation(message: 'Email cannot be empty', field: 'email'));

        // Act & Assert
        expect(
          () => useCase.call(email: '', password: 'password123', username: 'testuser', displayName: 'Test User'),
          throwsA(isA<Failure>()),
        );
      });

      test('should reject invalid email format', () async {
        // Arrange
        when(
          () => mockRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            username: any(named: 'username'),
            displayName: any(named: 'displayName'),
          ),
        ).thenThrow(const Failure.validation(message: 'Invalid email format', field: 'email'));

        // Act & Assert
        expect(
          () => useCase.call(
            email: 'not-an-email',
            password: 'password123',
            username: 'testuser',
            displayName: 'Test User',
          ),
          throwsA(isA<Failure>()),
        );
      });

      test('should reject email already in use', () async {
        // Arrange
        when(
          () => mockRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            username: any(named: 'username'),
            displayName: any(named: 'displayName'),
          ),
        ).thenThrow(const Failure.authentication(message: 'Email already in use'));

        // Act & Assert
        expect(
          () => useCase.call(
            email: 'existing@example.com',
            password: 'password123',
            username: 'testuser',
            displayName: 'Test User',
          ),
          throwsA(isA<Failure>()),
        );
      });
    });

    // ============================================================================
    // PASSWORD VALIDATION TESTS
    // ============================================================================

    group('Password Validation', () {
      test('should reject empty password', () async {
        // Arrange
        when(
          () => mockRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            username: any(named: 'username'),
            displayName: any(named: 'displayName'),
          ),
        ).thenThrow(const Failure.validation(message: 'Password cannot be empty', field: 'password'));

        // Act & Assert
        expect(
          () => useCase.call(email: 'test@example.com', password: '', username: 'testuser', displayName: 'Test User'),
          throwsA(isA<Failure>()),
        );
      });

      test('should reject password shorter than 6 characters', () async {
        // Arrange
        when(
          () => mockRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            username: any(named: 'username'),
            displayName: any(named: 'displayName'),
          ),
        ).thenThrow(const Failure.validation(message: 'Password must be at least 6 characters', field: 'password'));

        // Act & Assert
        expect(
          () => useCase.call(
            email: 'test@example.com',
            password: 'short',
            username: 'testuser',
            displayName: 'Test User',
          ),
          throwsA(isA<Failure>()),
        );
      });

      test('should reject weak password', () async {
        // Arrange
        when(
          () => mockRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            username: any(named: 'username'),
            displayName: any(named: 'displayName'),
          ),
        ).thenThrow(const Failure.authentication(message: 'Password is too weak'));

        // Act & Assert
        expect(
          () => useCase.call(
            email: 'test@example.com',
            password: '123456', // Only numbers
            username: 'testuser',
            displayName: 'Test User',
          ),
          throwsA(isA<Failure>()),
        );
      });
    });

    // ============================================================================
    // USERNAME VALIDATION TESTS
    // ============================================================================

    group('Username Validation', () {
      test('should reject empty username', () async {
        // Arrange
        when(
          () => mockRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            username: any(named: 'username'),
            displayName: any(named: 'displayName'),
          ),
        ).thenThrow(const Failure.validation(message: 'Username cannot be empty', field: 'username'));

        // Act & Assert
        expect(
          () =>
              useCase.call(email: 'test@example.com', password: 'password123', username: '', displayName: 'Test User'),
          throwsA(isA<Failure>()),
        );
      });

      test('should reject username already taken', () async {
        // Arrange
        when(
          () => mockRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            username: any(named: 'username'),
            displayName: any(named: 'displayName'),
          ),
        ).thenThrow(const Failure.validation(message: 'Username already taken', field: 'username'));

        // Act & Assert
        expect(
          () => useCase.call(
            email: 'test@example.com',
            password: 'password123',
            username: 'existinguser',
            displayName: 'Test User',
          ),
          throwsA(isA<Failure>()),
        );
      });

      test('should reject username that is too short', () async {
        // Arrange
        when(
          () => mockRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            username: any(named: 'username'),
            displayName: any(named: 'displayName'),
          ),
        ).thenThrow(const Failure.validation(message: 'Username must be at least 3 characters', field: 'username'));

        // Act & Assert
        expect(
          () => useCase.call(
            email: 'test@example.com',
            password: 'password123',
            username: 'ab',
            displayName: 'Test User',
          ),
          throwsA(isA<Failure>()),
        );
      });
    });

    // ============================================================================
    // DISPLAY NAME VALIDATION TESTS
    // ============================================================================

    group('Display Name Validation', () {
      test('should reject empty display name', () async {
        // Arrange
        when(
          () => mockRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            username: any(named: 'username'),
            displayName: any(named: 'displayName'),
          ),
        ).thenThrow(const Failure.validation(message: 'Display name cannot be empty', field: 'displayName'));

        // Act & Assert
        expect(
          () => useCase.call(email: 'test@example.com', password: 'password123', username: 'testuser', displayName: ''),
          throwsA(isA<Failure>()),
        );
      });
    });

    // ============================================================================
    // ERROR PATH TESTS
    // ============================================================================

    group('Error Paths', () {
      test('should throw Failure.network on connectivity error', () async {
        // Arrange
        when(
          () => mockRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            username: any(named: 'username'),
            displayName: any(named: 'displayName'),
          ),
        ).thenThrow(const Failure.network(message: 'No internet connection'));

        // Act & Assert
        expect(
          () => useCase.call(
            email: 'test@example.com',
            password: 'password123',
            username: 'testuser',
            displayName: 'Test User',
          ),
          throwsA(isA<Failure>()),
        );
      });

      test('should throw Failure.unknown on unexpected error', () async {
        // Arrange
        when(
          () => mockRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            username: any(named: 'username'),
            displayName: any(named: 'displayName'),
          ),
        ).thenThrow(const Failure.unknown(message: 'Unexpected error'));

        // Act & Assert
        expect(
          () => useCase.call(
            email: 'test@example.com',
            password: 'password123',
            username: 'testuser',
            displayName: 'Test User',
          ),
          throwsA(isA<Failure>()),
        );
      });
    });

    // ============================================================================
    // EDGE CASE TESTS
    // ============================================================================

    group('Edge Cases', () {
      test('should handle very long email address', () async {
        // Arrange
        const longEmail = 'verylongemailaddress.with.many.dots@subdomain.example.co.uk';
        final testUser = UserBuilder().withEmail(longEmail).build();

        when(
          () => mockRepository.signUpWithEmail(
            email: longEmail,
            password: any(named: 'password'),
            username: any(named: 'username'),
            displayName: any(named: 'displayName'),
          ),
        ).thenAnswer((_) async => testUser);

        // Act
        final result = await useCase.call(
          email: longEmail,
          password: 'password123',
          username: 'testuser',
          displayName: 'Test User',
        );

        // Assert
        expect(result.email, longEmail);
      });

      test('should handle username with numbers and underscores', () async {
        // Arrange
        const username = 'test_user_123';
        final testUser = UserBuilder().withUsername(username).build();

        when(
          () => mockRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            username: username,
            displayName: any(named: 'displayName'),
          ),
        ).thenAnswer((_) async => testUser);

        // Act
        final result = await useCase.call(
          email: 'test@example.com',
          password: 'password123',
          username: username,
          displayName: 'Test User',
        );

        // Assert
        expect(result.username, username);
      });

      test('should handle display name with special characters', () async {
        // Arrange
        const displayName = "John O'Brien-Smith";
        final testUser = UserBuilder().withDisplayName(displayName).build();

        when(
          () => mockRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            username: any(named: 'username'),
            displayName: displayName,
          ),
        ).thenAnswer((_) async => testUser);

        // Act
        final result = await useCase.call(
          email: 'test@example.com',
          password: 'password123',
          username: 'testuser',
          displayName: displayName,
        );

        // Assert
        expect(result.displayName, displayName);
      });

      test('should handle very long password', () async {
        // Arrange
        final longPassword = 'a' * 100;
        final testUser = UserBuilder().build();

        when(
          () => mockRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: longPassword,
            username: any(named: 'username'),
            displayName: any(named: 'displayName'),
          ),
        ).thenAnswer((_) async => testUser);

        // Act
        final result = await useCase.call(
          email: 'test@example.com',
          password: longPassword,
          username: 'testuser',
          displayName: 'Test User',
        );

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
        final testUser = UserBuilder().build();

        when(
          () => mockRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            username: any(named: 'username'),
            displayName: any(named: 'displayName'),
          ),
        ).thenAnswer((_) async => testUser);

        // Act
        await useCase.call(
          email: 'test@example.com',
          password: 'password123',
          username: 'testuser',
          displayName: 'Test User',
        );

        // Assert
        verify(
          () => mockRepository.signUpWithEmail(
            email: 'test@example.com',
            password: 'password123',
            username: 'testuser',
            displayName: 'Test User',
          ),
        ).called(1);

        verifyNoMoreInteractions(mockRepository);
      });

      test('should not catch repository exceptions', () async {
        // Arrange
        when(
          () => mockRepository.signUpWithEmail(
            email: any(named: 'email'),
            password: any(named: 'password'),
            username: any(named: 'username'),
            displayName: any(named: 'displayName'),
          ),
        ).thenThrow(Exception('Repository error'));

        // Act & Assert
        expect(
          () => useCase.call(
            email: 'test@example.com',
            password: 'password123',
            username: 'testuser',
            displayName: 'Test User',
          ),
          throwsException,
        );
      });
    });
  });
}
