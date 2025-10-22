import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state_model.freezed.dart';

/// Immutable application state
///
/// Represents the global state of the application including:
/// - Initialization status (whether app has completed startup)
/// - Current authenticated user (null if not logged in)
/// - Loading state (for ongoing async operations)
/// - Error message (if something went wrong)
///
/// Example:
/// ```dart
/// final appState = ref.watch(appStateProvider);
/// if (appState.isInitialized && appState.currentUser != null) {
///   return MainApp();
/// }
/// ```
@freezed
sealed class AppState with _$AppState {
  const factory AppState({
    /// Whether the app has completed initialization
    /// (Firebase connected, user loaded, etc.)
    required bool isInitialized,

    /// Currently authenticated user ID (null if not logged in)
    @Default(null) String? currentUserId,

    /// Whether an async operation is in progress
    @Default(false) bool isLoading,

    /// Error message if something failed (null if no error)
    @Default(null) String? errorMessage,
  }) = _AppState;
}

/// Extension for AppState with convenience methods
extension AppStateX on AppState {
  /// Whether the app is ready to show content (past splash screen)
  ///
  /// App is ready when initialization is complete.
  /// Authentication check (login vs main app) is handled by the router separately.
  ///
  /// This should be true as soon as Firebase is initialized, not waiting for user login.
  bool get isReady => isInitialized && !isLoading;

  /// Whether the app is in an error state
  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;

  /// Copy with clearError convenience method
  AppState clearError() => copyWith(errorMessage: null);

  /// Copy with setError convenience method
  AppState setError(String message) => copyWith(errorMessage: message);
}
