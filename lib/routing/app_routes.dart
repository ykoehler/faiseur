// App route definitions and constants for type-safe navigation.
//
// This file contains all route paths, route names, and helper methods
// for building routes with parameters. This ensures:
// - Type safety: No string typos in navigation
// - Maintainability: Change routes in one place
// - Consistency: Same route format everywhere

// ============================================================================
// ROUTE PATHS - Use these to check current location or build URLs
// ============================================================================

/// Root route - redirects based on auth state (splash → auth/home)
const String kRootRoute = '/';

/// Splash screen route - shown during app initialization
const String kSplashRoute = '/splash';

/// Onboarding routes base path - shown for first-time users
const String kOnboardingRoute = '/onboarding';

/// Onboarding welcome page route
const String kOnboardingWelcomeRoute = '/onboarding/welcome';

/// Authentication routes base path
const String kAuthRoute = '/auth';

/// Sign in page route
const String kLoginRoute = '/auth/login';

/// Sign up page route
const String kSignupRoute = '/auth/signup';

/// Forgot password page route
const String kForgotPasswordRoute = '/auth/forgot-password';

/// Lists home page route - main authenticated entry point
const String kListsRoute = '/lists';

/// List detail page route - shows single list with todos
/// Usage: Pass listId as route parameter
const String kListDetailRoute = '/lists/:listId';

/// Todo detail route - for editing specific todo in a list
/// Usage: Pass listId and todoId as route parameters
const String kTodoDetailRoute = '/lists/:listId/todo/:todoId';

/// Settings page route
const String kSettingsRoute = '/settings';

/// About page route
const String kAboutRoute = '/about';

/// Error page route
const String kErrorRoute = '/error';

/// Not found (404) page route
const String kNotFoundRoute = '/404';

// ============================================================================
// ROUTE NAMES - Use these for GoRouter.goNamed() and route references
// ============================================================================

/// Route name for lists home page
const String kListsRouteName = 'lists';

/// Route name for onboarding welcome page
const String kOnboardingRouteName = 'onboarding';

/// Route name for list detail page
const String kListDetailRouteName = 'list-detail';

/// Route name for todo detail page
const String kTodoDetailRouteName = 'todo-detail';

/// Route name for login page
const String kLoginRouteName = 'login';

/// Route name for signup page
const String kSignupRouteName = 'signup';

/// Route name for forgot password page
const String kForgotPasswordRouteName = 'forgot-password';

/// Route name for settings page
const String kSettingsRouteName = 'settings';

/// Route name for about page
const String kAboutRouteName = 'about';

// ============================================================================
// ROUTE PARAMETERS - Keys for extracting parameters from routes
// ============================================================================

/// Parameter key for list ID
const String kListIdParam = 'listId';

/// Parameter key for todo ID
const String kTodoIdParam = 'todoId';

// ============================================================================
// ROUTE BUILDER HELPERS - Use these to build routes with parameters
// ============================================================================

/// Build list detail route with ID parameter
///
/// Example: `listDetailRoute('abc123')` → `/lists/abc123`
String listDetailRoute(String listId) => '/lists/$listId';

/// Build todo detail route with list ID and todo ID parameters
///
/// Example: `todoDetailRoute('list1', 'todo1')` → `/lists/list1/todo/todo1`
String todoDetailRoute(String listId, String todoId) =>
    '/lists/$listId/todo/$todoId';

// ============================================================================
// ROUTE VALIDATION HELPERS - Useful for debugging
// ============================================================================

/// List of all defined route paths for validation
final Set<String> allDefinedRoutes = {
  kRootRoute,
  kSplashRoute,
  kOnboardingRoute,
  kOnboardingWelcomeRoute,
  kAuthRoute,
  kLoginRoute,
  kSignupRoute,
  kForgotPasswordRoute,
  kListsRoute,
  kListDetailRoute,
  kTodoDetailRoute,
  kSettingsRoute,
  kAboutRoute,
  kErrorRoute,
  kNotFoundRoute,
};

/// List of all defined route names for validation
final Set<String> allDefinedRouteNames = {
  kListsRouteName,
  kOnboardingRouteName,
  kListDetailRouteName,
  kTodoDetailRouteName,
  kLoginRouteName,
  kSignupRouteName,
  kForgotPasswordRouteName,
  kSettingsRouteName,
  kAboutRouteName,
};
