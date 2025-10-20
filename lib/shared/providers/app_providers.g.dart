// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appInitializationHash() => r'6644c1cbd6f8cdb20be789822a76cdb37cf045cc';

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
///
/// Copied from [appInitialization].
@ProviderFor(appInitialization)
final appInitializationProvider = AutoDisposeFutureProvider<void>.internal(
  appInitialization,
  name: r'appInitializationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appInitializationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppInitializationRef = AutoDisposeFutureProviderRef<void>;
String _$currentUserIdFromStateHash() =>
    r'93628bccbe9062380b11c33022974a6fda4f5540';

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
///
/// Copied from [currentUserIdFromState].
@ProviderFor(currentUserIdFromState)
final currentUserIdFromStateProvider = AutoDisposeProvider<String?>.internal(
  currentUserIdFromState,
  name: r'currentUserIdFromStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentUserIdFromStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentUserIdFromStateRef = AutoDisposeProviderRef<String?>;
String _$isAppReadyHash() => r'faff73b22c2288e2551e0df5370fb6787406a066';

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
///
/// Copied from [isAppReady].
@ProviderFor(isAppReady)
final isAppReadyProvider = AutoDisposeProvider<bool>.internal(
  isAppReady,
  name: r'isAppReadyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isAppReadyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsAppReadyRef = AutoDisposeProviderRef<bool>;
String _$appErrorHash() => r'b233e2e2cbc70677342574521b9a21ee62123a2b';

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
///
/// Copied from [appError].
@ProviderFor(appError)
final appErrorProvider = AutoDisposeProvider<String?>.internal(
  appError,
  name: r'appErrorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appErrorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppErrorRef = AutoDisposeProviderRef<String?>;
String _$appIsLoadingHash() => r'62f99c0daed3a31e02474631f4d8fe80a5e40278';

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
///
/// Copied from [appIsLoading].
@ProviderFor(appIsLoading)
final appIsLoadingProvider = AutoDisposeProvider<bool>.internal(
  appIsLoading,
  name: r'appIsLoadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appIsLoadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppIsLoadingRef = AutoDisposeProviderRef<bool>;
String _$appStateControllerHash() =>
    r'1faf3eb094ec1c02f69c450e03390bf83e6aa1a1';

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
///
/// Copied from [AppStateController].
@ProviderFor(AppStateController)
final appStateControllerProvider =
    AutoDisposeNotifierProvider<AppStateController, AppState>.internal(
      AppStateController.new,
      name: r'appStateControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$appStateControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AppStateController = AutoDisposeNotifier<AppState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
