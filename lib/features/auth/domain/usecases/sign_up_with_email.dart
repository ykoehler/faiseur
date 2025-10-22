import 'package:faiseur/features/auth/domain/entities/user.dart';
import 'package:faiseur/features/auth/domain/repositories/auth_repository.dart';

/// Use case for signing up a new user with email and password.
///
/// This use case handles the business logic for user registration:
/// 1. Validates input (email format, password strength, username uniqueness)
/// 2. Delegates to repository
/// 3. Returns the created user or throws a Failure
class SignUpWithEmailUseCase {
  /// Creates a [SignUpWithEmailUseCase].
  const SignUpWithEmailUseCase(this._repository);

  final AuthRepository _repository;

  /// Signs up a new user with the provided information.
  ///
  /// Throws an exception if sign-up fails (email already in use, weak password, etc).
  Future<User> call({
    required String email,
    required String password,
    required String username,
    required String displayName,
  }) => _repository.signUpWithEmail(
    email: email,
    password: password,
    username: username,
    displayName: displayName,
  );
}
