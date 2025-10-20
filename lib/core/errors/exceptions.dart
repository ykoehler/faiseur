/// Custom exception classes for the Faiseur application.
///
/// This file defines a sealed exception hierarchy that ensures
/// all exceptions are explicitly handled at compile time.

/// Base exception class for all application exceptions.
///
/// This sealed class enforces that only explicitly defined exception types
/// can be thrown, improving error handling reliability.
sealed class AppException implements Exception {
  /// Creates an AppException with a message and optional stack trace.
  const AppException(
    this.message, [
    this.stackTrace,
  ]);

  /// A human-readable error message
  final String message;

  /// Optional stack trace for debugging
  final StackTrace? stackTrace;

  @override
  String toString() => 'AppException: $message';
}

/// Exception thrown when a network error occurs.
class NetworkException extends AppException {
  /// Creates a NetworkException.
  const NetworkException(
    super.message, [
    super.stackTrace,
  ]);

  /// Creates a NetworkException from a network error code.
  factory NetworkException.fromCode(int code) {
    return NetworkException(
      'Network error: $code',
    );
  }

  @override
  String toString() => 'NetworkException: $message';
}

/// Exception thrown when an operation times out.
class TimeoutException extends AppException {
  /// Creates a TimeoutException.
  const TimeoutException(
    super.message, [
    super.stackTrace,
  ]);

  @override
  String toString() => 'TimeoutException: $message';
}

/// Exception thrown when authentication or authorization fails.
class AuthException extends AppException {
  /// Creates an AuthException.
  const AuthException(
    super.message, [
    super.stackTrace,
  ]);

  /// Creates an AuthException for invalid credentials.
  factory AuthException.invalidCredentials() {
    return const AuthException('Invalid email or password');
  }

  /// Creates an AuthException for user not found.
  factory AuthException.userNotFound() {
    return const AuthException('User not found');
  }

  /// Creates an AuthException for user already exists.
  factory AuthException.userAlreadyExists() {
    return const AuthException('User already exists');
  }

  /// Creates an AuthException for authentication required.
  factory AuthException.authRequired() {
    return const AuthException('Authentication required');
  }

  @override
  String toString() => 'AuthException: $message';
}

/// Exception thrown when input validation fails.
class ValidationException extends AppException {
  /// Creates a ValidationException.
  const ValidationException(
    super.message, [
    super.stackTrace,
  ]);

  /// The field that failed validation, if applicable
  String? get fieldName => null;

  @override
  String toString() => 'ValidationException: $message';
}

/// Exception thrown when Firestore operations fail.
class FirestoreException extends AppException {
  /// Creates a FirestoreException.
  const FirestoreException(
    super.message, [
    super.stackTrace,
  ]);

  /// Creates a FirestoreException for permission denied.
  factory FirestoreException.permissionDenied() {
    return const FirestoreException('Permission denied');
  }

  /// Creates a FirestoreException for document not found.
  factory FirestoreException.documentNotFound() {
    return const FirestoreException('Document not found');
  }

  /// Creates a FirestoreException from a Firebase error code.
  factory FirestoreException.fromCode(String code) {
    return FirestoreException('Firestore error: $code');
  }

  @override
  String toString() => 'FirestoreException: $message';
}

/// Exception thrown when storage operations fail.
class StorageException extends AppException {
  /// Creates a StorageException.
  const StorageException(
    super.message, [
    super.stackTrace,
  ]);

  /// Creates a StorageException for file not found.
  factory StorageException.fileNotFound() {
    return const StorageException('File not found');
  }

  /// Creates a StorageException for insufficient quota.
  factory StorageException.quotaExceeded() {
    return const StorageException('Storage quota exceeded');
  }

  @override
  String toString() => 'StorageException: $message';
}

/// Exception thrown when a required resource is not found.
class NotFoundException extends AppException {
  /// Creates a NotFoundException.
  const NotFoundException(
    super.message, [
    super.stackTrace,
  ]);

  @override
  String toString() => 'NotFoundException: $message';
}

/// Exception thrown when an operation is not allowed in the current state.
class StateException extends AppException {
  /// Creates a StateException.
  const StateException(
    super.message, [
    super.stackTrace,
  ]);

  @override
  String toString() => 'StateException: $message';
}

/// Exception thrown when an operation is cancelled.
class CancelledException extends AppException {
  /// Creates a CancelledException.
  const CancelledException(
    super.message, [
    super.stackTrace,
  ]);

  @override
  String toString() => 'CancelledException: $message';
}

/// Exception thrown for unknown or unexpected errors.
class UnknownException extends AppException {
  /// Creates an UnknownException.
  const UnknownException(
    super.message, [
    super.stackTrace,
  ]);

  /// Creates an UnknownException from any error.
  factory UnknownException.from(Object error, [StackTrace? stackTrace]) {
    return UnknownException(
      error.toString(),
      stackTrace,
    );
  }

  @override
  String toString() => 'UnknownException: $message';
}
