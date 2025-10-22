import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faiseur/core/errors/exceptions.dart';
import 'package:faiseur/core/errors/failures.dart';
import 'package:faiseur/features/auth/data/models/user_model.dart';
import 'package:faiseur/features/auth/domain/entities/user.dart';
import 'package:faiseur/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

// ignore_for_file: only_throw_errors

/// Implementation of [AuthRepository] using Firebase Authentication and Firestore.
///
/// This class handles all authentication-related Firebase operations including
/// signing in, signing up, signing out, and managing user profile data.
class AuthRepositoryImpl implements AuthRepository {
  /// Creates a new [AuthRepositoryImpl].
  ///
  /// Accepts optional Firebase instances for dependency injection in tests.
  AuthRepositoryImpl({
    firebase_auth.FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
       _firestore = firestore ?? FirebaseFirestore.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  /// Users collection reference in Firestore
  CollectionReference<Map<String, dynamic>> get _usersCollection =>
      _firestore.collection('users');

  /// Converts a Firebase [User] to our domain [User] entity.
  ///
  /// Fetches the user's profile data from Firestore if available.
  /// Falls back to creating a user from Firebase auth data if Firestore record doesn't exist.
  Future<User> _firebaseUserToUser(firebase_auth.User firebaseUser) async {
    try {
      // Try to get user profile from Firestore
      final doc = await _usersCollection.doc(firebaseUser.uid).get();

      if (doc.exists && doc.data() != null) {
        final model = userModelFromJson(doc.data()!);
        return model.toEntity();
      }
    } catch (_) {
      // Fall through to create from Firebase user data
    }

    // Fallback: create user from Firebase auth data
    return User(
      id: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      username: firebaseUser.displayName?.split(' ').first ?? '',
      displayName: firebaseUser.displayName ?? 'User',
      createdAt: firebaseUser.metadata.creationTime ?? DateTime.now(),
    );
  }

  @override
  Future<User> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final credentials = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credentials.user == null) {
        throw AuthException.invalidCredentials();
      }

      return _firebaseUserToUser(credentials.user!);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw Failure.authentication(message: _parseFirebaseAuthError(e.code));
    } catch (e) {
      throw Failure.unknown(message: e.toString());
    }
  }

  @override
  Future<User> signUpWithEmail({
    required String email,
    required String password,
    required String username,
    required String displayName,
  }) async {
    try {
      // Check if username already exists
      final usernameExists = await _checkUsernameExists(username);
      if (usernameExists) {
        throw const Failure.authentication(
          message: 'Username is already taken',
        );
      }

      // Check if email already exists (Firebase will also check this)
      // Create Firebase user
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credentials.user == null) {
        throw const UnknownException('Failed to create user');
      }

      final firebaseUser = credentials.user!;

      // Create user profile in Firestore
      final userModel = UserModel(
        id: firebaseUser.uid,
        email: email,
        username: username,
        displayName: displayName,
        createdAt: DateTime.now(),
        avatarUrl: null,
        updatedAt: DateTime.now(),
      );

      await _usersCollection
          .doc(firebaseUser.uid)
          .set(userModelToJson(userModel));

      // Update Firebase auth profile
      await firebaseUser.updateDisplayName(displayName);

      return userModel.toEntity();
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw Failure.authentication(message: _parseFirebaseAuthError(e.code));
    } on Failure {
      rethrow;
    } catch (e) {
      throw Failure.unknown(message: e.toString());
    }
  }

  @override
  Future<User> signInAnonymously() async {
    try {
      final credentials = await _firebaseAuth.signInAnonymously();

      if (credentials.user == null) {
        throw const UnknownException('Failed to sign in anonymously');
      }

      return _firebaseUserToUser(credentials.user!);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw Failure.network(
        message: 'Failed to sign in anonymously: ${e.code}',
      );
    } catch (e) {
      throw Failure.unknown(message: e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Failure.unknown(message: 'Failed to sign out: $e');
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      final firebaseUser = _firebaseAuth.currentUser;

      if (firebaseUser == null) {
        return null;
      }

      return _firebaseUserToUser(firebaseUser);
    } catch (e) {
      throw Failure.unknown(message: e.toString());
    }
  }

  @override
  Stream<User?> get authStateChanges =>
      _firebaseAuth.authStateChanges().asyncMap((firebaseUser) async {
        if (firebaseUser == null) {
          return null;
        }
        return _firebaseUserToUser(firebaseUser);
      });

  @override
  Future<bool> isUsernameAvailable(String username) async {
    try {
      return !(await _checkUsernameExists(username));
    } catch (e) {
      throw Failure.unknown(message: e.toString());
    }
  }

  @override
  Future<bool> isEmailAvailable(String email) async {
    try {
      // Firebase Auth provides a method to check if email is registered
      // ignore: deprecated_member_use
      final methods = await _firebaseAuth.fetchSignInMethodsForEmail(email);
      return methods.isEmpty;
    } catch (e) {
      throw Failure.unknown(message: e.toString());
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on firebase_auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: prefer_const_constructors
        throw Failure.notFound(message: 'No user found with this email');
      }
      // ignore: prefer_const_constructors
      throw Failure.network(message: 'Failed to send reset email: ${e.code}');
    } catch (e) {
      throw Failure.unknown(message: e.toString());
    }
  }

  @override
  Future<User> updateUserProfile({
    String? displayName,
    String? avatarUrl,
  }) async {
    try {
      final firebaseUser = _firebaseAuth.currentUser;

      if (firebaseUser == null) {
        // ignore: prefer_const_constructors
        throw Failure.authentication(message: 'User not authenticated');
      }

      // Update Firebase auth profile if displayName provided
      if (displayName != null) {
        await firebaseUser.updateDisplayName(displayName);
      }

      // Update Firestore profile
      final updates = <String, dynamic>{
        'updatedAt': DateTime.now().toIso8601String(),
      };

      if (displayName != null) {
        updates['displayName'] = displayName;
      }
      if (avatarUrl != null) {
        updates['avatarUrl'] = avatarUrl;
      }

      await _usersCollection.doc(firebaseUser.uid).update(updates);

      // Reload Firebase user
      await firebaseUser.reload();

      return _firebaseUserToUser(_firebaseAuth.currentUser!);
    } on Failure {
      rethrow;
    } catch (e) {
      throw Failure.unknown(message: e.toString());
    }
  }

  /// Checks if a username already exists in Firestore.
  Future<bool> _checkUsernameExists(String username) async {
    try {
      final query = await _usersCollection
          .where('username', isEqualTo: username.toLowerCase())
          .limit(1)
          .get();
      return query.docs.isNotEmpty;
    } catch (e) {
      throw Failure.network(
        message: 'Failed to check username availability: $e',
      );
    }
  }

  /// Parses Firebase authentication error codes to user-friendly messages.
  String _parseFirebaseAuthError(String code) => switch (code) {
    'user-not-found' => 'No user found with this email address',
    'wrong-password' => 'Incorrect password',
    'email-already-in-use' => 'Email is already registered',
    'weak-password' => 'Password must be at least 6 characters',
    'invalid-email' => 'Invalid email address',
    'operation-not-allowed' => 'This operation is not allowed',
    'user-disabled' => 'This user account has been disabled',
    'too-many-requests' => 'Too many attempts. Please try again later',
    'network-request-failed' => 'Network error. Please check your connection',
    _ => 'Authentication failed: $code',
  };
}
