import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faiseur/features/settings/data/models/user_settings_model.dart';
import 'package:faiseur/features/settings/domain/repositories/settings_repository.dart' show SettingsException;

/// Remote datasource for user settings using Firestore.
///
/// Handles all Firestore operations for settings persistence and retrieval.
abstract class SettingsRemoteDatasource {
  /// Retrieves user settings from Firestore.
  ///
  /// [userId]: The user ID
  ///
  /// Returns default settings if document doesn't exist.
  /// Throws [SettingsException] on Firestore errors.
  Future<UserSettingsModel> getUserSettings(String userId);

  /// Watches user settings as a stream from Firestore.
  ///
  /// [userId]: The user ID
  ///
  /// Emits current settings immediately, then updates as they change.
  /// Throws [SettingsException] on stream setup errors.
  Stream<UserSettingsModel> watchUserSettings(String userId);

  /// Creates or updates user settings in Firestore.
  ///
  /// [settings]: The settings to persist
  ///
  /// Throws [SettingsException] on write errors.
  Future<void> setUserSettings(UserSettingsModel settings);

  /// Deletes user settings from Firestore.
  ///
  /// [userId]: The user ID
  ///
  /// Throws [SettingsException] on deletion errors.
  Future<void> deleteUserSettings(String userId);
}

/// Implementation of [SettingsRemoteDatasource] using Firebase Cloud Firestore.
class SettingsRemoteDatasourceImpl implements SettingsRemoteDatasource {
  /// Creates a settings remote datasource.
  SettingsRemoteDatasourceImpl({required FirebaseFirestore firestore}) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  /// Collection path for user settings.
  static const String _collectionPath = 'users';

  @override
  Future<UserSettingsModel> getUserSettings(String userId) async {
    try {
      final doc = await _firestore.collection(_collectionPath).doc(userId).get();

      if (!doc.exists) {
        // Return default settings if document doesn't exist
        return _createDefaultSettings(userId);
      }

      return UserSettingsModel.fromJson(doc.data() ?? {});
    } catch (e) {
      throw SettingsRemoteDatasourceException(
        'Failed to retrieve settings for user $userId',
        code: 'fetch_failed',
        originalError: e,
      );
    }
  }

  @override
  Stream<UserSettingsModel> watchUserSettings(String userId) {
    try {
      return _firestore
          .collection(_collectionPath)
          .doc(userId)
          .snapshots()
          .map((doc) {
            if (!doc.exists) {
              return _createDefaultSettings(userId);
            }
            return UserSettingsModel.fromJson(doc.data() ?? {});
          })
          .handleError((dynamic error) {
            throw SettingsRemoteDatasourceException(
              'Failed to watch settings for user $userId',
              code: 'watch_failed',
              originalError: error,
            );
          });
    } catch (e) {
      throw SettingsRemoteDatasourceException(
        'Failed to setup settings stream for user $userId',
        code: 'stream_setup_failed',
        originalError: e,
      );
    }
  }

  @override
  Future<void> setUserSettings(UserSettingsModel settings) async {
    try {
      settings.validate();
      final data = settings.toJson();
      await _firestore.collection(_collectionPath).doc(settings.userId).set(data, SetOptions(merge: true));
    } catch (e) {
      throw SettingsRemoteDatasourceException(
        'Failed to save settings for user ${settings.userId}',
        code: 'save_failed',
        originalError: e,
      );
    }
  }

  @override
  Future<void> deleteUserSettings(String userId) async {
    try {
      await _firestore.collection(_collectionPath).doc(userId).delete();
    } catch (e) {
      throw SettingsRemoteDatasourceException(
        'Failed to delete settings for user $userId',
        code: 'delete_failed',
        originalError: e,
      );
    }
  }

  /// Creates default settings for a user.
  UserSettingsModel _createDefaultSettings(String userId) {
    final now = DateTime.now();
    return UserSettingsModel(
      userId: userId,
      themeMode: 'system',
      notificationsEnabled: true,
      emailNotificationsEnabled: true,
      defaultViewMode: 'list',
      showTutorialOnLaunch: true,
      languageCode: 'en',
      darkMode: false,
      updatedAt: now,
      createdAt: now,
    );
  }
}

/// Exception thrown by settings remote datasource.
class SettingsRemoteDatasourceException implements Exception {
  /// Creates a settings datasource exception.
  SettingsRemoteDatasourceException(this.message, {this.code, this.originalError});

  /// The error message.
  final String message;

  /// Optional error code for categorizing the error.
  final String? code;

  /// The original error that caused this exception.
  final Object? originalError;

  @override
  String toString() => 'SettingsRemoteDatasourceException: $message${code != null ? ' ($code)' : ''}';
}
