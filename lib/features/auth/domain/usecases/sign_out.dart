import 'package:faiseur/features/auth/domain/repositories/auth_repository.dart';

/// Use case for signing out the currently authenticated user.
///
/// This use case handles the business logic for user sign-out:
/// 1. Delegates to repository
/// 2. Clears any cached user data
/// 3. Throws a Failure if sign-out fails
class SignOutUseCase {
  /// Creates a [SignOutUseCase].
  const SignOutUseCase(this._repository);

  final AuthRepository _repository;

  /// Signs out the currently authenticated user.
  ///
  /// Throws an exception if sign-out fails.
  Future<void> call() => _repository.signOut();
}
