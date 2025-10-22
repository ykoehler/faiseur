import 'package:faiseur/features/auth/domain/entities/user.dart';
import 'package:faiseur/features/auth/domain/repositories/auth_repository.dart';

/// Use case for getting the currently authenticated user.
///
/// This use case handles the business logic for fetching the current user:
/// 1. Delegates to repository
/// 2. Returns the current user or null if not authenticated
/// 3. Throws a Failure if the operation fails
class GetCurrentUserUseCase {
  /// Creates a [GetCurrentUserUseCase].
  const GetCurrentUserUseCase(this._repository);

  final AuthRepository _repository;

  /// Gets the currently authenticated user.
  ///
  /// Returns null if no user is authenticated.
  /// Throws an exception if the operation fails.
  Future<User?> call() => _repository.getCurrentUser();
}
