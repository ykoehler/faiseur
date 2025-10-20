import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_router.dart';
import 'app_routes.dart';

part 'navigation_service.g.dart';

// ============================================================================
// NAVIGATION SERVICE PROVIDER
// ============================================================================

/// Provides navigation service for imperative navigation.
@riverpod
NavigationService navigationService(Ref ref) {
  final router = ref.watch(goRouterProvider);
  return NavigationService(router);
}

// ============================================================================
// NAVIGATION SERVICE CLASS
// ============================================================================

/// Service for imperative navigation.
///
/// Provides typed methods for navigating to different screens.
/// Use this when you need to navigate based on business logic,
/// not just user interactions.
///
/// Example:
/// ```dart
/// final navService = ref.read(navigationServiceProvider);
/// navService.goToListDetail('list-123');
/// ```
class NavigationService {
  /// Creates a navigation service.
  NavigationService(this._router);

  final GoRouter _router;

  // =========================================================================
  // NAVIGATION METHODS - Main app routes
  // =========================================================================

  /// Navigate to lists home page
  void goToLists() {
    _router.goNamed(kListsRouteName);
  }

  /// Navigate to list detail page
  void goToListDetail(String listId) {
    _router.goNamed(kListDetailRouteName, pathParameters: {kListIdParam: listId});
  }

  /// Navigate to todo detail page
  void goToTodoDetail(String listId, String todoId) {
    _router.goNamed(kTodoDetailRouteName, pathParameters: {kListIdParam: listId, kTodoIdParam: todoId});
  }

  /// Navigate to settings page
  void goToSettings() {
    _router.goNamed(kSettingsRouteName);
  }

  /// Navigate to about page
  void goToAbout() {
    _router.goNamed(kAboutRouteName);
  }

  // =========================================================================
  // NAVIGATION METHODS - Auth routes
  // =========================================================================

  /// Navigate to login page
  void goToLogin() {
    _router.goNamed(kLoginRouteName);
  }

  /// Navigate to signup page
  void goToSignup() {
    _router.goNamed(kSignupRouteName);
  }

  /// Navigate to forgot password page
  void goToForgotPassword() {
    _router.goNamed(kForgotPasswordRouteName);
  }

  // =========================================================================
  // UTILITY METHODS
  // =========================================================================

  /// Go back to previous page
  void goBack() {
    _router.pop();
  }

  /// Check if can go back
  bool canGoBack() => _router.canPop();

  /// Get current route location
  String get currentLocation => _router.routeInformationProvider.value.uri.toString();

  /// Check if currently at route
  bool isAtRoute(String routeName) => currentLocation.contains(routeName);

  /// Navigate to error page with optional error message
  void goToError(String? error) => _router.go(kErrorRoute, extra: error);
}
