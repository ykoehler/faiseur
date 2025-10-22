# Next Phase: Repository & Provider Testing Guide

## Quick Start - Repository Tests

### File to Create
`test/features/auth/data/repositories/auth_repository_impl_test.dart`

### What to Test
1. Firebase error mapping (FirebaseAuthException → Failure)
2. Username uniqueness validation
3. Email uniqueness validation  
4. User profile updates
5. Network error handling
6. Timeout handling

### Template Structure
```dart
import 'package:faiseur/core/errors/failures.dart';
import 'package:faiseur/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:faiseur/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockUserCredential extends Mock implements UserCredential {}
class MockUser extends Mock implements User {}

void main() {
  group('AuthRepositoryImpl', () {
    late AuthRepositoryImpl repository;
    late MockFirebaseAuth mockFirebaseAuth;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      repository = AuthRepositoryImpl(mockFirebaseAuth);
    });

    group('signInWithEmail', () {
      // Add tests here
    });
  });
}
```

## Quick Start - Provider Tests

### File to Create
`test/features/auth/presentation/providers/auth_providers_test.dart`

### What to Test
1. Provider initialization
2. State transitions
3. Error handling
4. Provider dependencies
5. Caching behavior

### Using ProviderContainer for Testing
```dart
import 'package:riverpod/riverpod.dart';

void main() {
  group('AuthProviders', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    test('authProvider returns initial state', () {
      final state = container.read(authProvider);
      expect(state, isNotNull);
    });
  });
}
```

## Repository Testing Checklist

- [ ] Happy path for each method
- [ ] Firebase exception mapping
- [ ] Network error handling
- [ ] Timeout handling
- [ ] Validation error handling
- [ ] Firestore operations
- [ ] Real-time streams
- [ ] Cache management

## Provider Testing Checklist

- [ ] Initial state
- [ ] State transitions
- [ ] Error states
- [ ] Provider dependencies
- [ ] Async operations
- [ ] Stream handling
- [ ] Riverpod family providers
- [ ] Auto-dispose behavior

## Key Firebase Mock Classes

```dart
// Firebase Auth mocks
class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockUserCredential extends Mock implements UserCredential {}
class MockUser extends Mock implements User {}
class MockAuthException implements FirebaseAuthException {
  @override
  final String code;
  
  MockAuthException({required this.code});
}

// Common Firebase error codes
const authUserNotFound = 'user-not-found';
const authWrongPassword = 'wrong-password';
const authInvalidEmail = 'invalid-email';
const authEmailAlreadyInUse = 'email-already-in-use';
const authWeakPassword = 'weak-password';
const authNetworkError = 'network-error';
```

## Provider Test Helper

```dart
// Add to test_helpers.dart
Future<T> readProvider<T>(ProviderContainer container, AlwaysAliveProvider<T> provider) async {
  return container.read(provider);
}

Future<T> readFutureProvider<T>(
  ProviderContainer container,
  FutureProvider<T> provider,
) async {
  return container.read(provider.future);
}
```

## Running Repository Tests (Once Created)

```bash
# Run repository tests
flutter test test/features/auth/data/repositories/

# Run provider tests
flutter test test/features/auth/presentation/providers/

# Run all auth tests
flutter test test/features/auth/

# Run with coverage
flutter test test/features/auth/ --coverage
```

## Estimated Test Count

- **Repository Tests**: 20-25
- **Provider Tests**: 15-20
- **Total Next Phase**: ~40-45 tests

This should bring total to **110-115+ tests** and coverage to ~65-75%.

## Resources

- [mocktail documentation](https://pub.dev/packages/mocktail)
- [Firebase mock patterns](https://firebase.google.com/docs/emulator-suite)
- [Riverpod testing guide](https://riverpod.dev/docs/essentials/testing)
- [Flutter testing best practices](https://flutter.dev/docs/cookbook/testing/unit/introduction)
