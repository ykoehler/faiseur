import 'package:faiseur/core/errors/failures.dart';
import 'package:faiseur/features/auth/domain/entities/user.dart';

/// Repository interface for authentication operations.
///
/// This repository defines the contract for all authentication-related
/// operations (sign in, sign up, sign out, get current user).
/// Implementation details are hidden in the data layer.
///
/// All methods return either the result on success or throw a [Failure].
/// Callers should handle [Failure] exceptions using try-catch or explicit checks.
abstract class AuthRepository {
  /// Attempts to sign in a user with email and password.
  ///
  /// Returns the authenticated [User] on success.
  /// Throws a [Failure] on error:
  /// - [Failure.authentication] - Invalid email or password
  /// - [Failure.validation] - Email format invalid
  /// - [Failure.network] - Network connectivity issue
  /// - [Failure.unknown] - Unexpected error occurred
  Future<User> signInWithEmail({required String email, required String password});

  /// Attempts to sign up a new user with email, password, and username.
  ///
  /// Returns the newly created [User] on success.
  /// Throws a [Failure] on error:
  /// - [Failure.authentication] - Email already in use or weak password
  /// - [Failure.validation] - Input validation failed
  /// - [Failure.network] - Network connectivity issue
  /// - [Failure.unknown] - Unexpected error occurred
  Future<User> signUpWithEmail({
    required String email,
    required String password,
    required String username,
    required String displayName,
  });

  /// Attempts to sign in anonymously.
  ///
  /// Returns an anonymous [User] on success.
  /// Throws a [Failure] on error:
  /// - [Failure.network] - Network connectivity issue
  /// - [Failure.unknown] - Unexpected error occurred
  Future<User> signInAnonymously();

  /// Signs out the currently authenticated user.
  ///
  /// Throws a [Failure] on error:
  /// - [Failure.network] - Network connectivity issue
  /// - [Failure.unknown] - Unexpected error occurred
  Future<void> signOut();

  /// Retrieves the currently authenticated user.
  ///
  /// Returns the current [User], or null if no user is authenticated.
  /// Throws a [Failure] on error:
  /// - [Failure.network] - Network connectivity issue
  /// - [Failure.unknown] - Unexpected error occurred
  Future<User?> getCurrentUser();

  /// Returns a stream of authentication state changes.
  ///
  /// Emits the current user whenever the authentication state changes.
  /// Emits null when the user is signed out.
  Stream<User?> get authStateChanges;

  /// Checks if a username is already taken.
  ///
  /// Returns true if the username is available, false if already taken.
  /// Throws a [Failure] on error:
  /// - [Failure.network] - Network connectivity issue
  /// - [Failure.unknown] - Unexpected error occurred
  Future<bool> isUsernameAvailable(String username);

  /// Checks if an email is already registered.
  ///
  /// Returns true if the email is available, false if already registered.
  /// Throws a [Failure] on error:
  /// - [Failure.network] - Network connectivity issue
  /// - [Failure.unknown] - Unexpected error occurred
  Future<bool> isEmailAvailable(String email);

  /// Sends a password reset email to the specified email address.
  ///
  /// Throws a [Failure] on error:
  /// - [Failure.notFound] - Email not registered
  /// - [Failure.network] - Network connectivity issue
  /// - [Failure.unknown] - Unexpected error occurred
  Future<void> sendPasswordResetEmail(String email);

  /// Updates the user's profile information.
  ///
  /// Returns the updated [User] on success.
  /// Throws a [Failure] on error:
  /// - [Failure.authentication] - User is not authenticated
  /// - [Failure.authorization] - User not authorized to update
  /// - [Failure.validation] - Validation failed
  /// - [Failure.network] - Network connectivity issue
  /// - [Failure.unknown] - Unexpected error occurred
  Future<User> updateUserProfile({String? displayName, String? avatarUrl});
}
