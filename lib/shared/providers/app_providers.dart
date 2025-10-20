import 'package:firebase_auth/firebase_auth.dart';
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
  AppState build() => const AppState(
    isInitialized: false,
    currentUserId: null,
    isLoading: false,
    errorMessage: null,
  );

  /// Initialize the app (called on startup)
  Future<void> initialize() async {
    state = state.copyWith(isLoading: true);
    try {
      // Firebase is already initialized in main.dart
      // Just mark as initialized
      final auth = ref.read(firebaseAuthProvider);
      final currentUser = auth.currentUser;

      state = state.copyWith(
        isInitialized: true,
        currentUserId: currentUser?.uid,
        isLoading: false,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Initialization failed: $e',
      );
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

/// App initialization provider
///
/// Async provider that handles app startup initialization.
/// Should be watched in main() to ensure app is initialized before showing UI.
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
  final controller = ref.read(appStateControllerProvider.notifier);
  await controller.initialize();

  // Listen to auth changes and update app state
  ref.listen<AsyncValue<User?>>(currentUserProvider, (_, next) {
    next.whenData((user) => controller.setCurrentUserId(user?.uid));
  }, fireImmediately: true);
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
