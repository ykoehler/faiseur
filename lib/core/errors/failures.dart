/// Failure classes for handling errors in the application.
///
/// Failures are used in repositories and use cases to represent
/// error states without throwing exceptions. This allows for better
/// error handling and type-safe error propagation.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Base failure class for all application failures.
///
/// Uses Freezed for immutability and pattern matching support.
@freezed
sealed class Failure with _$Failure {
  /// Network connectivity error
  const factory Failure.network({
    required String message,
  }) = NetworkFailure;

  /// Request timeout error
  const factory Failure.timeout({
    required String message,
  }) = TimeoutFailure;

  /// Authentication failed
  const factory Failure.authentication({
    required String message,
  }) = AuthenticationFailure;

  /// Authorization denied
  const factory Failure.authorization({
    required String message,
  }) = AuthorizationFailure;

  /// Validation error
  const factory Failure.validation({
    required String message,
    String? field,
  }) = ValidationFailure;

  /// Firestore database error
  const factory Failure.firestore({
    required String message,
    String? code,
  }) = FirestoreFailure;

  /// Storage error
  const factory Failure.storage({
    required String message,
  }) = StorageFailure;

  /// Resource not found error
  const factory Failure.notFound({
    required String message,
  }) = NotFoundFailure;

  /// Invalid state error
  const factory Failure.state({
    required String message,
  }) = StateFailure;

  /// Operation cancelled
  const factory Failure.cancelled({
    required String message,
  }) = CancelledFailure;

  /// Unknown error
  const factory Failure.unknown({
    required String message,
  }) = UnknownFailure;

  /// Returns a user-friendly error message
  String get userMessage {
    return when(
      network: (message) => 'Unable to connect. Please check your internet.',
      timeout: (message) => 'Request timed out. Please try again.',
      authentication: (message) => 'Authentication failed. Please sign in again.',
      authorization: (message) => 'You do not have permission for this action.',
      validation: (message, field) =>
          field != null ? '$field: $message' : message,
      firestore: (message, code) => 'Database error occurred.',
      storage: (message) => 'Storage error occurred.',
      notFound: (message) => 'The requested item was not found.',
      state: (message) => message,
      cancelled: (message) => 'Operation was cancelled.',
      unknown: (message) => 'An unexpected error occurred.',
    );
  }

  /// Returns the error code if available
  String? get errorCode {
    return when(
      network: (_) => 'NETWORK_ERROR',
      timeout: (_) => 'TIMEOUT_ERROR',
      authentication: (_) => 'AUTH_ERROR',
      authorization: (_) => 'AUTHZ_ERROR',
      validation: (_, __) => 'VALIDATION_ERROR',
      firestore: (_, code) => code ?? 'FIRESTORE_ERROR',
      storage: (_) => 'STORAGE_ERROR',
      notFound: (_) => 'NOT_FOUND',
      state: (_) => 'STATE_ERROR',
      cancelled: (_) => 'CANCELLED',
      unknown: (_) => 'UNKNOWN_ERROR',
    );
  }
}
