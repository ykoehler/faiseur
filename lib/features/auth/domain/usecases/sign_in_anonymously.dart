import 'package:faiseur/features/auth/domain/entities/user.dart';
import 'package:faiseur/features/auth/domain/repositories/auth_repository.dart';

/// Use case for signing in anonymously.
///
/// This use case handles the business logic for anonymous sign-in:
/// 1. Delegates to repository
/// 2. Returns an anonymous user
/// 3. Throws a Failure if sign-in fails
class SignInAnonymouslyUseCase {
  /// Creates a [SignInAnonymouslyUseCase].
  const SignInAnonymouslyUseCase(this._repository);

  final AuthRepository _repository;

  /// Signs in anonymously.
  ///
  /// Throws an exception if sign-in fails.
  Future<User> call() => _repository.signInAnonymously();
}
