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

/// Provider that creates a ChangeNotifier for GoRouter's refreshListenable
/// This notifier will trigger GoRouter to re-evaluate redirects when auth state changes
@Riverpod(keepAlive: true)
Raw<AsyncValueNotifier<bool?>> authStateNotifier(Ref ref) {
  final asyncValue = ref.watch(isAuthenticatedProvider);
  final notifier = AsyncValueNotifier<bool?>(asyncValue);

  if (kDebugMode) {
    print('[AUTH_NOTIFIER] Initial value: ${asyncValue.value}');
  }

  ref.listen<AsyncValue<bool?>>(isAuthenticatedProvider, (previous, next) {
    if (kDebugMode) {
      print('[AUTH_NOTIFIER] Auth state changed: ${previous?.value} -> ${next.value}');
    }
    notifier.update(next);
  });

  return notifier;
}

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  // Get the notifier that will tell GoRouter when to refresh
  final authNotifier = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: kSplashRoute,
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) {
      // Read the latest values on every redirect
      final isAuthenticatedAsync = ref.read(isAuthenticatedProvider);
      final isAppReady = ref.read(isAppReadyProvider);
      return _handleRedirect(context, state, isAuthenticatedAsync, isAppReady);
    },
    // Tell GoRouter to refresh when auth state changes
    refreshListenable: authNotifier,
    routes: [_buildSplashRoute(), _buildAuthRoutes(), _buildMainRoutes(), _buildErrorRoute()],
    errorBuilder: (context, state) => ErrorPage(error: state.error?.toString()),
  );
}

/// Helper class that wraps AsyncValue and notifies listeners when it changes
/// This is needed because GoRouter's refreshListenable only works with ChangeNotifier
class AsyncValueNotifier<T> extends ChangeNotifier {
  AsyncValueNotifier(this._asyncValue);

  AsyncValue<T> _asyncValue;
  AsyncValue<T> get asyncValue => _asyncValue;

  void update(AsyncValue<T> newValue) {
    if (newValue != _asyncValue) {
      _asyncValue = newValue;
      notifyListeners();
    }
  }
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
  if (kDebugMode) {
    print(
      '[REDIRECT] location=${state.matchedLocation}, appReady=$isAppReady, authAsync=${isAuthenticatedAsync.value}',
    );
  }

  // If app not ready, always show splash
  if (!isAppReady) {
    // Don't redirect if already on splash
    if (state.matchedLocation == kSplashRoute) {
      return null;
    }
    return kSplashRoute;
  }

  // Once app is ready, check authentication state
  final authed = isAuthenticatedAsync.when(
    data: (auth) => auth,
    loading: () => null, // Still loading auth state
    error: (err, st) => false,
  );

  // If still loading auth state, stay on current route
  if (authed == null) {
    if (kDebugMode) {
      print('[REDIRECT] Auth still loading, staying on ${state.matchedLocation}');
    }
    return null;
  }

  // App is ready and we know auth state
  // If on splash, redirect based on auth status
  if (state.matchedLocation == kSplashRoute) {
    final target = authed ? kListsRoute : kLoginRoute;
    if (kDebugMode) {
      print('[REDIRECT] From splash -> $target (authed=$authed)');
    }
    return target;
  }

  // Allow error route
  if (state.matchedLocation == kErrorRoute) {
    return null;
  }

  // If user is authenticated
  if (authed) {
    // Redirect auth routes to lists
    if (state.matchedLocation.startsWith('/auth')) {
      if (kDebugMode) {
        print('[REDIRECT] User authenticated, redirecting /auth -> /lists');
      }
      return kListsRoute;
    }
    return null; // Allow other routes
  }

  // If user is not authenticated
  // Allow auth routes
  if (state.matchedLocation.startsWith('/auth')) {
    return null;
  }
  // Redirect everything else to login
  if (kDebugMode) {
    print('[REDIRECT] User not authenticated, redirecting to login');
  }
  return kLoginRoute;
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
