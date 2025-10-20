import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/signup_page.dart';
import '../features/lists/presentation/pages/lists_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';
import '../shared/providers/app_providers.dart';
import '../shared/providers/firebase_providers.dart';
import 'app_routes.dart';
import 'pages/error_page.dart';
import 'pages/splash_page.dart';

part 'app_router.g.dart';

// ============================================================================
// ROUTER PROVIDER
// ============================================================================

@riverpod
GoRouter goRouter(Ref ref) {
  // isAppReadyProvider returns bool directly (not async)
  final isAppReady = ref.watch(isAppReadyProvider);

  // isAuthenticatedProvider returns AsyncValue<bool> (stream-based)
  final isAuthenticatedAsync = ref.watch(isAuthenticatedProvider);

  return GoRouter(
    initialLocation: kSplashRoute,
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) => _handleRedirect(context, state, isAuthenticatedAsync, isAppReady),
    routes: [_buildSplashRoute(), _buildAuthRoutes(), _buildMainRoutes(), _buildErrorRoute()],
    errorBuilder: (context, state) => ErrorPage(error: state.error?.toString()),
  );
}

// ============================================================================
// REDIRECT LOGIC
// ============================================================================

/// Handles navigation redirects based on app and authentication state.
///
/// Priority:
/// 1. If app not initialized → splash screen
/// 2. If user authenticated → main app routes
/// 3. If user not authenticated → auth routes
/// 4. Default to root (which redirects appropriately)
String? _handleRedirect(
  BuildContext context,
  GoRouterState state,
  AsyncValue<bool> isAuthenticatedAsync,
  bool isAppReady,
) {
  // If app not ready, always show splash
  if (!isAppReady) {
    return kSplashRoute;
  }

  // Once app is ready, check authentication state
  final authed = isAuthenticatedAsync.when(
    data: (auth) => auth,
    loading: () => null, // Let splash handle it
    error: (err, st) => false,
  );

  // If we're already at splash/error, allow it
  if (state.matchedLocation == kSplashRoute || state.matchedLocation == kErrorRoute) {
    return null; // No redirect
  }

  // If user is authenticated
  if (authed == true) {
    // Redirect auth routes to lists
    if (state.matchedLocation.startsWith('/auth')) {
      return kListsRoute;
    }
    return null; // Allow route
  }

  // If user is not authenticated
  if (authed == false) {
    // Allow auth routes
    if (state.matchedLocation.startsWith('/auth')) {
      return null; // Allow route
    }
    // Redirect everything else to login
    return kLoginRoute;
  }

  // Still loading, show nothing (stay on current route)
  return null;
}

// ============================================================================
// ROUTE BUILDERS
// ============================================================================

/// Builds the splash screen route.
GoRoute _buildSplashRoute() => GoRoute(path: kSplashRoute, builder: (context, state) => const SplashPage());

/// Builds all authentication-related routes.
///
/// These routes are only accessible when user is NOT authenticated.
/// Contains: login, signup, forgot password
GoRoute _buildAuthRoutes() => GoRoute(
  path: kAuthRoute,
  builder: (context, state) => const LoginPage(), // Fallback
  routes: [
    GoRoute(path: 'login', name: kLoginRouteName, builder: (context, state) => const LoginPage()),
    GoRoute(path: 'signup', name: kSignupRouteName, builder: (context, state) => const SignupPage()),
    GoRoute(path: 'forgot-password', name: kForgotPasswordRouteName, builder: (context, state) => const SplashPage()),
  ],
);

/// Builds all authenticated routes with shell for consistent layout.
///
/// Uses ShellRoute for a persistent navigation structure.
/// All nested routes share the same parent scaffold/layout.
/// Routes: lists, settings, about
ShellRoute _buildMainRoutes() => ShellRoute(
  builder: (context, state, child) => child,
  routes: [
    GoRoute(
      path: 'lists',
      name: kListsRouteName,
      builder: (context, state) => const ListsPage(),
      routes: [
        GoRoute(
          path: ':$kListIdParam',
          name: kListDetailRouteName,
          builder: (context, state) {
            final listId = state.pathParameters[kListIdParam];
            if (listId == null) {
              return const ErrorPage(error: 'List ID is required');
            }
            return ListsPage(selectedListId: listId);
          },
          routes: [
            GoRoute(
              path: 'todo/:$kTodoIdParam',
              name: kTodoDetailRouteName,
              builder: (context, state) {
                final listId = state.pathParameters[kListIdParam];
                final todoId = state.pathParameters[kTodoIdParam];
                if (listId == null || todoId == null) {
                  return const ErrorPage(error: 'List ID and Todo ID are required');
                }
                return ListsPage(selectedListId: listId, selectedTodoId: todoId);
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(path: 'settings', name: kSettingsRouteName, builder: (context, state) => const SettingsPage()),
    GoRoute(path: 'about', name: kAboutRouteName, builder: (context, state) => const SplashPage()),
  ],
);

/// Builds error handling routes.
GoRoute _buildErrorRoute() => GoRoute(path: kErrorRoute, builder: (context, state) => const ErrorPage());
