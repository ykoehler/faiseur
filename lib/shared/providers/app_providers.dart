import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/app_state_model.dart';
import 'firebase_providers.dart';

part 'app_providers.g.dart';

/// Global app state controller
///
/// Manages the global state of the application including initialization,
/// current user, loading state, and errors.
///
/// Example:
/// ```dart
/// final appState = ref.watch(appStateControllerProvider);
/// if (appState.isReady) {
///   return MainApp();
/// }
/// ```
@riverpod
class AppStateController extends _$AppStateController {
  @override
  AppState build() {
    // Initialize immediately when the provider is first built
    // This avoids the circular dependency issue with appInitializationProvider
    try {
      final auth = ref.read(firebaseAuthProvider);
      final currentUser = auth.currentUser;

      return AppState(isInitialized: true, currentUserId: currentUser?.uid, isLoading: false, errorMessage: null);
    } catch (e) {
      return AppState(isInitialized: true, isLoading: false, errorMessage: 'Initialization failed: $e');
    }
  }

  /// Update current user ID after login
  void setCurrentUserId(String? userId) {
    state = state.copyWith(currentUserId: userId);
  }

  /// Set loading state
  void setLoading({required bool isLoading}) {
    state = state.copyWith(isLoading: isLoading);
  }

  /// Set error message
  void setError(String message) {
    state = state.copyWith(errorMessage: message);
  }

  /// Clear error message
  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}

/// App initialization provider (async)
///
/// Async provider that completes when the app state is initialized.
/// Used by the splash page to show loading/error states.
///
/// This is a FutureProvider that simply waits for app state to be ready.
/// Since app state initializes synchronously in its build() method,
/// this completes immediately.
///
/// Example:
/// ```dart
/// final appInitAsync = ref.watch(appInitializationProvider);
/// appInitAsync.when(
///   data: (_) => MainApp(),
///   loading: () => LoadingScreen(),
///   error: (err, st) => ErrorScreen(err),
/// );
/// ```
@riverpod
Future<void> appInitialization(Ref ref) async {
  // Watch the app state - since it initializes in build(), this completes immediately
  ref.watch(appStateControllerProvider);
}

/// App initialization sync provider
///
/// Sync provider that ensures the app state is initialized.
/// This simply watches the app state controller and returns it.
/// The controller initializes itself in its build() method.
///
/// Returns true when initialization is complete.
///
/// Example:
/// ```dart
/// final isReady = ref.watch(appInitializedProvider);
/// if (isReady) {
///   return MainApp();
/// }
/// ```
@riverpod
bool appInitialized(Ref ref) {
  // Watch the app state controller to trigger its initialization
  final appState = ref.watch(appStateControllerProvider);

  // Return whether it's initialized
  return appState.isInitialized;
}

/// Current user ID from app state
///
/// Gets the current authenticated user ID from app state.
/// Returns null if no user is authenticated.
///
/// This is a synchronous getter from app state, unlike currentUserIdProvider
/// which is async from Firebase.
///
/// Example:
/// ```dart
/// final userId = ref.watch(currentUserIdFromStateProvider);
/// print('Current user: $userId');
/// ```
@riverpod
String? currentUserIdFromState(Ref ref) {
  final appState = ref.watch(appStateControllerProvider);
  return appState.currentUserId;
}

/// App is ready to show main content
///
/// Derived provider that indicates if the app has completed initialization
/// and has a logged-in user.
///
/// Example:
/// ```dart
/// final isReady = ref.watch(isAppReadyProvider);
/// if (isReady) {
///   return MainApp();
/// } else {
///   return LoadingScreen();
/// }
/// ```
@riverpod
bool isAppReady(Ref ref) {
  final appState = ref.watch(appStateControllerProvider);
  return appState.isReady;
}

/// Current app error message
///
/// Returns the current error message if any.
/// Useful for showing error dialogs or snackbars.
///
/// Example:
/// ```dart
/// final error = ref.watch(appErrorProvider);
/// if (error != null) {
///   showErrorDialog(context, error);
/// }
/// ```
@riverpod
String? appError(Ref ref) {
  final appState = ref.watch(appStateControllerProvider);
  return appState.errorMessage;
}

/// Whether app is currently loading
///
/// Useful for showing loading indicators.
///
/// Example:
/// ```dart
/// final isLoading = ref.watch(appIsLoadingProvider);
/// if (isLoading) {
///   return CircularProgressIndicator();
/// }
/// ```
@riverpod
bool appIsLoading(Ref ref) {
  final appState = ref.watch(appStateControllerProvider);
  return appState.isLoading;
}
