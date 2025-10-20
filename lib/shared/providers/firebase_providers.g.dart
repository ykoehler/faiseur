// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseAppHash() => r'ae360e335e4745f313eb388b738ee9c3490a6235';

/// Singleton Firebase App instance
///
/// Provides access to the Firebase App for the current environment.
/// This is a singleton that's shared across the entire app.
///
/// Example:
/// ```dart
/// final firebaseApp = ref.watch(firebaseAppProvider);
/// ```
///
/// Copied from [firebaseApp].
@ProviderFor(firebaseApp)
final firebaseAppProvider = Provider<FirebaseApp>.internal(
  firebaseApp,
  name: r'firebaseAppProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseAppHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseAppRef = ProviderRef<FirebaseApp>;
String _$firestoreHash() => r'e271f8f7be694ee819f397232f4d140c15a5f921';

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
///
/// Copied from [firestore].
@ProviderFor(firestore)
final firestoreProvider = Provider<FirebaseFirestore>.internal(
  firestore,
  name: r'firestoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firestoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirestoreRef = ProviderRef<FirebaseFirestore>;
String _$firebaseAuthHash() => r'46c40b7c5cf8ab936c0daa96a6af106bd2ae5d51';

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
///
/// Copied from [firebaseAuth].
@ProviderFor(firebaseAuth)
final firebaseAuthProvider = Provider<FirebaseAuth>.internal(
  firebaseAuth,
  name: r'firebaseAuthProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseAuthRef = ProviderRef<FirebaseAuth>;
String _$currentUserHash() => r'490ec2bae73aae8c157ef1428923ce98f4171a33';

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
///
/// Copied from [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = AutoDisposeStreamProvider<User?>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentUserRef = AutoDisposeStreamProviderRef<User?>;
String _$currentUserIdHash() => r'406736a3415c602925d6c9ce782a698a38ca3b71';

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
///
/// Copied from [currentUserId].
@ProviderFor(currentUserId)
final currentUserIdProvider = AutoDisposeStreamProvider<String?>.internal(
  currentUserId,
  name: r'currentUserIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentUserIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentUserIdRef = AutoDisposeStreamProviderRef<String?>;
String _$isAuthenticatedHash() => r'79919caf2945e0e1b79ee1ed982c9782f4ea02ee';

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
///
/// Copied from [isAuthenticated].
@ProviderFor(isAuthenticated)
final isAuthenticatedProvider = AutoDisposeStreamProvider<bool>.internal(
  isAuthenticated,
  name: r'isAuthenticatedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isAuthenticatedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsAuthenticatedRef = AutoDisposeStreamProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
