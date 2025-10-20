import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_providers.g.dart';

/// Singleton Firebase App instance
///
/// Provides access to the Firebase App for the current environment.
/// This is a singleton that's shared across the entire app.
///
/// Example:
/// ```dart
/// final firebaseApp = ref.watch(firebaseAppProvider);
/// ```
@Riverpod(keepAlive: true)
FirebaseApp firebaseApp(Ref ref) => Firebase.app();

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
@Riverpod(keepAlive: true)
FirebaseFirestore firestore(Ref ref) => FirebaseFirestore.instance;

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
@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(Ref ref) => FirebaseAuth.instance;

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
@riverpod
Stream<User?> currentUser(Ref ref) {
  final auth = ref.watch(firebaseAuthProvider);
  return auth.authStateChanges();
}

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
@riverpod
Stream<String?> currentUserId(Ref ref) {
  final auth = ref.watch(firebaseAuthProvider);
  return auth.authStateChanges().map((user) => user?.uid);
}

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
@riverpod
Stream<bool> isAuthenticated(Ref ref) {
  final auth = ref.watch(firebaseAuthProvider);
  return auth.authStateChanges().map((user) => user != null);
}
