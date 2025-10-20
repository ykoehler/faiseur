/// Failure classes for handling errors in the application.
///
/// Failures are used in repositories and use cases to represent
/// error states without throwing exceptions. This allows for better
/// error handling and type-safe error propagation.

/// Base failure class for all application failures.
abstract class Failure {
  const Failure(this.message);
  
  final String message;
  
  @override
  String toString() => '$runtimeType: $message';
}

/// Network connectivity error
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

/// Request timeout error
class TimeoutFailure extends Failure {
  const TimeoutFailure(super.message);
}

/// Authentication failed
class AuthenticationFailure extends Failure {
  const AuthenticationFailure(super.message);
}

/// Authorization denied
class AuthorizationFailure extends Failure {
  const AuthorizationFailure(super.message);
}

/// Validation error
class ValidationFailure extends Failure {
  const ValidationFailure(super.message, [this.field]);
  
  final String? field;
  
  @override
  String toString() => field != null 
      ? 'ValidationFailure($field): $message' 
      : 'ValidationFailure: $message';
}

/// Firestore database error
class FirestoreFailure extends Failure {
  const FirestoreFailure(super.message, [this.code]);
  
  final String? code;
  
  @override
  String toString() => code != null
      ? 'FirestoreFailure($code): $message'
      : 'FirestoreFailure: $message';
}

/// Storage error
class StorageFailure extends Failure {
  const StorageFailure(super.message);
}

/// Resource not found error
class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);
}

/// Invalid state error
class StateFailure extends Failure {
  const StateFailure(super.message);
}

/// Operation cancelled
class CancelledFailure extends Failure {
  const CancelledFailure(super.message);
}

/// Unknown/unexpected error
class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}
