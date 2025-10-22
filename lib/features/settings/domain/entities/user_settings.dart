import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings.freezed.dart';

/// User settings entity containing theme, notification, and preference settings.
///
/// This entity represents the persisted user preferences across the application.
/// All fields are optional to support partial updates.
@freezed
abstract class UserSettings with _$UserSettings {
  /// Creates a user settings instance.
  const factory UserSettings({
    /// Unique identifier of the user who owns these settings.
    required String userId,

    /// When these settings were last updated.
    required DateTime updatedAt,

    /// When these settings were created.
    required DateTime createdAt,

    /// Theme mode preference: 'light', 'dark', or 'system'.
    @Default('system') String themeMode,

    /// Whether notifications are enabled globally.
    @Default(true) bool notificationsEnabled,

    /// Whether email notifications are enabled.
    @Default(true) bool emailNotificationsEnabled,

    /// Default view preference for lists: 'list', 'kanban', or 'card'.
    @Default('list') String defaultViewMode,

    /// Whether to show tutorial on first launch.
    @Default(true) bool showTutorialOnLaunch,

    /// User's language preference (ISO 639-1 code, e.g., 'en', 'es').
    @Default('en') String languageCode,

    /// Whether to enable dark mode (legacy, use themeMode instead).
    @Default(false) bool darkMode,
  }) = _UserSettings;

  const UserSettings._();

  /// Validates that all required fields are present and valid.
  ///
  /// Throws [ArgumentError] if validation fails.
  void validate() {
    if (userId.isEmpty) {
      throw ArgumentError('userId cannot be empty');
    }
    if (!['light', 'dark', 'system'].contains(themeMode)) {
      throw ArgumentError('themeMode must be one of: light, dark, system. Got: $themeMode');
    }
    if (!['list', 'kanban', 'card'].contains(defaultViewMode)) {
      throw ArgumentError('defaultViewMode must be one of: list, kanban, card. Got: $defaultViewMode');
    }
    if (languageCode.length != 2) {
      throw ArgumentError('languageCode must be a 2-letter ISO code. Got: $languageCode');
    }
  }
}
