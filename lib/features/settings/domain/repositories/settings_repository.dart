import 'package:faiseur/features/settings/domain/entities/user_settings.dart';

/// Repository interface for managing user settings.
///
/// Handles all operations related to user preferences and settings,
/// including persistence and retrieval from remote and local storage.
abstract class SettingsRepository {
  /// Retrieves the current user's settings.
  ///
  /// Attempts to get settings from cache first, then remote storage.
  /// If no settings exist, returns default settings.
  ///
  /// Throws [SettingsException] if retrieval fails.
  Future<UserSettings> getUserSettings(String userId);

  /// Watches user settings as a stream for real-time updates.
  ///
  /// Emits the current settings immediately, then emits updates
  /// whenever settings change.
  ///
  /// Throws [SettingsException] if stream setup fails.
  Stream<UserSettings> watchUserSettings(String userId);

  /// Updates the user's settings.
  ///
  /// Persists settings to both local cache and remote storage.
  /// Validates settings before persisting.
  ///
  /// [settings]: The new settings to persist
  ///
  /// Throws [SettingsException] if update fails.
  /// Throws [ArgumentError] if settings are invalid.
  Future<void> updateUserSettings(UserSettings settings);

  /// Updates a single theme mode preference.
  ///
  /// Convenience method for updating only the theme mode.
  ///
  /// [userId]: The user ID
  /// [themeMode]: The new theme mode ('light', 'dark', or 'system')
  ///
  /// Throws [SettingsException] if update fails.
  /// Throws [ArgumentError] if themeMode is invalid.
  Future<void> updateThemeMode(String userId, String themeMode);

  /// Updates a single notification preference.
  ///
  /// Convenience method for updating notification settings.
  ///
  /// [userId]: The user ID
  /// [enabled]: Whether notifications are enabled
  ///
  /// Throws [SettingsException] if update fails.
  Future<void> updateNotificationsEnabled(String userId, {required bool enabled});

  /// Updates a single email notification preference.
  ///
  /// Convenience method for updating email notification settings.
  ///
  /// [userId]: The user ID
  /// [enabled]: Whether email notifications are enabled
  ///
  /// Throws [SettingsException] if update fails.
  Future<void> updateEmailNotificationsEnabled(String userId, {required bool enabled});

  /// Updates the default view mode preference.
  ///
  /// Convenience method for updating the default view.
  ///
  /// [userId]: The user ID
  /// [viewMode]: The new view mode ('list', 'kanban', or 'card')
  ///
  /// Throws [SettingsException] if update fails.
  /// Throws [ArgumentError] if viewMode is invalid.
  Future<void> updateDefaultViewMode(String userId, String viewMode);

  /// Resets settings to defaults for a user.
  ///
  /// Useful for cleanup or when user requests reset.
  ///
  /// [userId]: The user ID
  ///
  /// Throws [SettingsException] if reset fails.
  Future<void> resetToDefaults(String userId);

  /// Deletes all settings for a user.
  ///
  /// Called when a user account is deleted.
  ///
  /// [userId]: The user ID
  ///
  /// Throws [SettingsException] if deletion fails.
  Future<void> deleteUserSettings(String userId);
}

/// Exception thrown when settings operations fail.
class SettingsException implements Exception {
  /// Creates a settings exception.
  SettingsException(this.message, {this.code, this.originalError});

  /// The error message.
  final String message;

  /// Optional error code for categorizing the error.
  final String? code;

  /// The original error that caused this exception.
  final Object? originalError;

  @override
  String toString() => 'SettingsException: $message${code != null ? ' ($code)' : ''}';
}
