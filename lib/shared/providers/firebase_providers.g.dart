// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Singleton Firebase App instance
///
/// Provides access to the Firebase App for the current environment.
/// This is a singleton that's shared across the entire app.
///
/// Example:
/// ```dart
/// final firebaseApp = ref.watch(firebaseAppProvider);
/// ```

@ProviderFor(firebaseApp)
const firebaseAppProvider = FirebaseAppProvider._();

/// Singleton Firebase App instance
///
/// Provides access to the Firebase App for the current environment.
/// This is a singleton that's shared across the entire app.
///
/// Example:
/// ```dart
/// final firebaseApp = ref.watch(firebaseAppProvider);
/// ```

final class FirebaseAppProvider
    extends $FunctionalProvider<FirebaseApp, FirebaseApp, FirebaseApp>
    with $Provider<FirebaseApp> {
  /// Singleton Firebase App instance
  ///
  /// Provides access to the Firebase App for the current environment.
  /// This is a singleton that's shared across the entire app.
  ///
  /// Example:
  /// ```dart
  /// final firebaseApp = ref.watch(firebaseAppProvider);
  /// ```
  const FirebaseAppProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'firebaseAppProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$firebaseAppHash();

  @$internal
  @override
  $ProviderElement<FirebaseApp> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FirebaseApp create(Ref ref) {
    return firebaseApp(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseApp value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseApp>(value),
    );
  }
}

String _$firebaseAppHash() => r'439aae163af009a7ca65e74976600e6e64cc17c5';

/// Singleton Firestore instance
///
/// Provides access to Cloud Firestore.
/// Automatically connects to the appropriate project based on environment.
///
/// Example:
/// ```dart
/// final firestore = ref.watch(firestoreProvider);
/// final docs = await firestore.collection('todos').get();
/// ```

@ProviderFor(firestore)
const firestoreProvider = FirestoreProvider._();

/// Singleton Firestore instance
///
/// Provides access to Cloud Firestore.
/// Automatically connects to the appropriate project based on environment.
///
/// Example:
/// ```dart
/// final firestore = ref.watch(firestoreProvider);
/// final docs = await firestore.collection('todos').get();
/// ```

final class FirestoreProvider extends $FunctionalProvider<FirebaseFirestore,
    FirebaseFirestore, FirebaseFirestore> with $Provider<FirebaseFirestore> {
  /// Singleton Firestore instance
  ///
  /// Provides access to Cloud Firestore.
  /// Automatically connects to the appropriate project based on environment.
  ///
  /// Example:
  /// ```dart
  /// final firestore = ref.watch(firestoreProvider);
  /// final docs = await firestore.collection('todos').get();
  /// ```
  const FirestoreProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'firestoreProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$firestoreHash();

  @$internal
  @override
  $ProviderElement<FirebaseFirestore> $createElement(
    $ProviderPointer pointer,
  ) =>
      $ProviderElement(pointer);

  @override
  FirebaseFirestore create(Ref ref) {
    return firestore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseFirestore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseFirestore>(value),
    );
  }
}

String _$firestoreHash() => r'864285def6284159b44f9598dcde96347e0c1dce';

/// Singleton Firebase Authentication instance
///
/// Provides access to Firebase Authentication.
/// Use to manage user login/logout and auth state.
///
/// Example:
/// ```dart
/// final auth = ref.watch(firebaseAuthProvider);
/// final user = auth.currentUser;
/// ```

@ProviderFor(firebaseAuth)
const firebaseAuthProvider = FirebaseAuthProvider._();

/// Singleton Firebase Authentication instance
///
/// Provides access to Firebase Authentication.
/// Use to manage user login/logout and auth state.
///
/// Example:
/// ```dart
/// final auth = ref.watch(firebaseAuthProvider);
/// final user = auth.currentUser;
/// ```

final class FirebaseAuthProvider
    extends $FunctionalProvider<FirebaseAuth, FirebaseAuth, FirebaseAuth>
    with $Provider<FirebaseAuth> {
  /// Singleton Firebase Authentication instance
  ///
  /// Provides access to Firebase Authentication.
  /// Use to manage user login/logout and auth state.
  ///
  /// Example:
  /// ```dart
  /// final auth = ref.watch(firebaseAuthProvider);
  /// final user = auth.currentUser;
  /// ```
  const FirebaseAuthProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'firebaseAuthProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$firebaseAuthHash();

  @$internal
  @override
  $ProviderElement<FirebaseAuth> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FirebaseAuth create(Ref ref) {
    return firebaseAuth(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseAuth value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseAuth>(value),
    );
  }
}

String _$firebaseAuthHash() => r'8c3e9d11b27110ca96130356b5ef4d5d34a5ffc2';

/// Current authenticated user
///
/// Watches Firebase Auth state and returns the current user.
/// Returns null if no user is authenticated.
/// This is a stream provider that handles authentication state changes.
///
/// Example:
/// ```dart
/// final userAsync = ref.watch(currentUserProvider);
/// userAsync.when(
///   data: (user) => user != null ? ShowApp() : ShowLogin(),
///   loading: () => LoadingScreen(),
///   error: (err, st) => ErrorScreen(err),
/// );
/// ```

@ProviderFor(currentUser)
const currentUserProvider = CurrentUserProvider._();

/// Current authenticated user
///
/// Watches Firebase Auth state and returns the current user.
/// Returns null if no user is authenticated.
/// This is a stream provider that handles authentication state changes.
///
/// Example:
/// ```dart
/// final userAsync = ref.watch(currentUserProvider);
/// userAsync.when(
///   data: (user) => user != null ? ShowApp() : ShowLogin(),
///   loading: () => LoadingScreen(),
///   error: (err, st) => ErrorScreen(err),
/// );
/// ```

final class CurrentUserProvider
    extends $FunctionalProvider<AsyncValue<User?>, User?, Stream<User?>>
    with $FutureModifier<User?>, $StreamProvider<User?> {
  /// Current authenticated user
  ///
  /// Watches Firebase Auth state and returns the current user.
  /// Returns null if no user is authenticated.
  /// This is a stream provider that handles authentication state changes.
  ///
  /// Example:
  /// ```dart
  /// final userAsync = ref.watch(currentUserProvider);
  /// userAsync.when(
  ///   data: (user) => user != null ? ShowApp() : ShowLogin(),
  ///   loading: () => LoadingScreen(),
  ///   error: (err, st) => ErrorScreen(err),
  /// );
  /// ```
  const CurrentUserProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'currentUserProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$currentUserHash();

  @$internal
  @override
  $StreamProviderElement<User?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<User?> create(Ref ref) {
    return currentUser(ref);
  }
}

String _$currentUserHash() => r'b01f57dfbfa1b5127d3511bd98a63f38187876ae';

/// Current authenticated user ID
///
/// Convenient access to just the user ID.
/// Returns null if no user is authenticated.
///
/// Example:
/// ```dart
/// final userIdAsync = ref.watch(currentUserIdProvider);
/// userIdAsync.when(
///   data: (id) => Text('User: $id'),
///   loading: () => CircularProgressIndicator(),
///   error: (err, st) => ErrorScreen(err),
/// );
/// ```

@ProviderFor(currentUserId)
const currentUserIdProvider = CurrentUserIdProvider._();

/// Current authenticated user ID
///
/// Convenient access to just the user ID.
/// Returns null if no user is authenticated.
///
/// Example:
/// ```dart
/// final userIdAsync = ref.watch(currentUserIdProvider);
/// userIdAsync.when(
///   data: (id) => Text('User: $id'),
///   loading: () => CircularProgressIndicator(),
///   error: (err, st) => ErrorScreen(err),
/// );
/// ```

final class CurrentUserIdProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, Stream<String?>>
    with $FutureModifier<String?>, $StreamProvider<String?> {
  /// Current authenticated user ID
  ///
  /// Convenient access to just the user ID.
  /// Returns null if no user is authenticated.
  ///
  /// Example:
  /// ```dart
  /// final userIdAsync = ref.watch(currentUserIdProvider);
  /// userIdAsync.when(
  ///   data: (id) => Text('User: $id'),
  ///   loading: () => CircularProgressIndicator(),
  ///   error: (err, st) => ErrorScreen(err),
  /// );
  /// ```
  const CurrentUserIdProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'currentUserIdProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$currentUserIdHash();

  @$internal
  @override
  $StreamProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<String?> create(Ref ref) {
    return currentUserId(ref);
  }
}

String _$currentUserIdHash() => r'a9b7839df39a776a86485ecf60c03140f92d4795';

/// Whether the current user is authenticated
///
/// Simple boolean to check if user is logged in.
/// True if currentUser is not null, false otherwise.
///
/// Example:
/// ```dart
/// final isAuthedAsync = ref.watch(isAuthenticatedProvider);
/// isAuthedAsync.when(
///   data: (authed) {
///     if (authed) {
///       GoRouter.of(context).go('/home');
///     } else {
///       GoRouter.of(context).go('/login');
///     }
///   },
///   loading: () => LoadingScreen(),
///   error: (err, st) => ErrorScreen(err),
/// );
/// ```

@ProviderFor(isAuthenticated)
const isAuthenticatedProvider = IsAuthenticatedProvider._();

/// Whether the current user is authenticated
///
/// Simple boolean to check if user is logged in.
/// True if currentUser is not null, false otherwise.
///
/// Example:
/// ```dart
/// final isAuthedAsync = ref.watch(isAuthenticatedProvider);
/// isAuthedAsync.when(
///   data: (authed) {
///     if (authed) {
///       GoRouter.of(context).go('/home');
///     } else {
///       GoRouter.of(context).go('/login');
///     }
///   },
///   loading: () => LoadingScreen(),
///   error: (err, st) => ErrorScreen(err),
/// );
/// ```

final class IsAuthenticatedProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  /// Whether the current user is authenticated
  ///
  /// Simple boolean to check if user is logged in.
  /// True if currentUser is not null, false otherwise.
  ///
  /// Example:
  /// ```dart
  /// final isAuthedAsync = ref.watch(isAuthenticatedProvider);
  /// isAuthedAsync.when(
  ///   data: (authed) {
  ///     if (authed) {
  ///       GoRouter.of(context).go('/home');
  ///     } else {
  ///       GoRouter.of(context).go('/login');
  ///     }
  ///   },
  ///   loading: () => LoadingScreen(),
  ///   error: (err, st) => ErrorScreen(err),
  /// );
  /// ```
  const IsAuthenticatedProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'isAuthenticatedProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$isAuthenticatedHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return isAuthenticated(ref);
  }
}

String _$isAuthenticatedHash() => r'9eb42cd2169dd249a00dd6e9d43e0cd10d402734';
