// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
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

@ProviderFor(AppStateController)
const appStateControllerProvider = AppStateControllerProvider._();

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
final class AppStateControllerProvider
    extends $NotifierProvider<AppStateController, AppState> {
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
  const AppStateControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appStateControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appStateControllerHash();

  @$internal
  @override
  AppStateController create() => AppStateController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppState>(value),
    );
  }
}

String _$appStateControllerHash() =>
    r'0c5cb14d797a2be5ea98ae35076bbbde82551477';

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

abstract class _$AppStateController extends $Notifier<AppState> {
  AppState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AppState, AppState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppState, AppState>,
              AppState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
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

@ProviderFor(appInitialization)
const appInitializationProvider = AppInitializationProvider._();

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

final class AppInitializationProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
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
  const AppInitializationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appInitializationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appInitializationHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return appInitialization(ref);
  }
}

String _$appInitializationHash() => r'd3012f08ef7aed7188732177b7d80c9b1ca97692';

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

@ProviderFor(appInitialized)
const appInitializedProvider = AppInitializedProvider._();

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

final class AppInitializedProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
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
  const AppInitializedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appInitializedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appInitializedHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return appInitialized(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$appInitializedHash() => r'6cce33f18cb92b8141bf966f1c733ea65616b0b4';

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

@ProviderFor(currentUserIdFromState)
const currentUserIdFromStateProvider = CurrentUserIdFromStateProvider._();

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

final class CurrentUserIdFromStateProvider
    extends $FunctionalProvider<String?, String?, String?>
    with $Provider<String?> {
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
  const CurrentUserIdFromStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserIdFromStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserIdFromStateHash();

  @$internal
  @override
  $ProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String? create(Ref ref) {
    return currentUserIdFromState(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$currentUserIdFromStateHash() =>
    r'558eedbdd725d32c740adaa909ac2ac484cde742';

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

@ProviderFor(isAppReady)
const isAppReadyProvider = IsAppReadyProvider._();

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

final class IsAppReadyProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
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
  const IsAppReadyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isAppReadyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isAppReadyHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isAppReady(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isAppReadyHash() => r'19b20092f3304a11d28394b0ec031ecdc0df87f1';

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

@ProviderFor(appError)
const appErrorProvider = AppErrorProvider._();

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

final class AppErrorProvider
    extends $FunctionalProvider<String?, String?, String?>
    with $Provider<String?> {
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
  const AppErrorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appErrorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appErrorHash();

  @$internal
  @override
  $ProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String? create(Ref ref) {
    return appError(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$appErrorHash() => r'562b8643a0c0df993a5af0573f02797c03f29c0f';

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

@ProviderFor(appIsLoading)
const appIsLoadingProvider = AppIsLoadingProvider._();

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

final class AppIsLoadingProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
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
  const AppIsLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appIsLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appIsLoadingHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return appIsLoading(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$appIsLoadingHash() => r'786e0981fe12e4a171560f33f98cc7ba3ff6ec34';
