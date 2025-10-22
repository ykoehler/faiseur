import 'package:faiseur/features/auth/domain/entities/user.dart';
import 'package:faiseur/features/auth/domain/repositories/auth_repository.dart';

/// Use case for signing in with email and password.
///
/// This use case handles the business logic for user sign-in:
/// 1. Validates input
/// 2. Delegates to repository
/// 3. Returns the authenticated user or throws a Failure
class SignInWithEmailUseCase {
  /// Creates a [SignInWithEmailUseCase].
  const SignInWithEmailUseCase(this._repository);

  final AuthRepository _repository;

  /// Signs in a user with the provided email and password.
  ///
  /// Throws an exception if sign-in fails.
  Future<User> call({required String email, required String password}) =>
      _repository.signInWithEmail(email: email, password: password);
}
