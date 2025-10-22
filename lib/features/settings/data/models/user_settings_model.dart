import 'package:faiseur/features/settings/domain/entities/user_settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings_model.freezed.dart';

/// JSON serializable model for [UserSettings] entity.
///
/// Used for Firebase Firestore serialization/deserialization.
/// This is a separate class from UserSettings to avoid circular dependencies
/// and to handle JSON serialization separately.
@Freezed(toJson: false, fromJson: false)
abstract class UserSettingsModel with _$UserSettingsModel {
  /// Creates a user settings model.
  const factory UserSettingsModel({
    required String userId,
    required DateTime updatedAt,
    required DateTime createdAt,
    @Default('system') String themeMode,
    @Default(true) bool notificationsEnabled,
    @Default(true) bool emailNotificationsEnabled,
    @Default('list') String defaultViewMode,
    @Default(true) bool showTutorialOnLaunch,
    @Default('en') String languageCode,
    @Default(false) bool darkMode,
  }) = _UserSettingsModel;

  const UserSettingsModel._();

  /// Creates a model from JSON (Firestore).
  factory UserSettingsModel.fromJson(Map<String, dynamic> json) => UserSettingsModel(
    userId: json['userId'] as String? ?? '',
    themeMode: json['themeMode'] as String? ?? 'system',
    notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
    emailNotificationsEnabled: json['emailNotificationsEnabled'] as bool? ?? true,
    defaultViewMode: json['defaultViewMode'] as String? ?? 'list',
    showTutorialOnLaunch: json['showTutorialOnLaunch'] as bool? ?? true,
    languageCode: json['languageCode'] as String? ?? 'en',
    darkMode: json['darkMode'] as bool? ?? false,
    updatedAt: json['updatedAt'] is String
        ? DateTime.parse(json['updatedAt'] as String)
        : (json['updatedAt'] as DateTime?)?.toLocal() ?? DateTime.now(),
    createdAt: json['createdAt'] is String
        ? DateTime.parse(json['createdAt'] as String)
        : (json['createdAt'] as DateTime?)?.toLocal() ?? DateTime.now(),
  );

  /// Converts the model to JSON for Firestore storage.
  Map<String, dynamic> toJson() => {
    'userId': userId,
    'themeMode': themeMode,
    'notificationsEnabled': notificationsEnabled,
    'emailNotificationsEnabled': emailNotificationsEnabled,
    'defaultViewMode': defaultViewMode,
    'showTutorialOnLaunch': showTutorialOnLaunch,
    'languageCode': languageCode,
    'darkMode': darkMode,
    'updatedAt': updatedAt.toIso8601String(),
    'createdAt': createdAt.toIso8601String(),
  };
}

/// Extension to convert [UserSettings] to [UserSettingsModel].
extension UserSettingsExt on UserSettings {
  /// Converts to model for storage/transmission.
  UserSettingsModel toModel() => UserSettingsModel(
    userId: userId,
    themeMode: themeMode,
    notificationsEnabled: notificationsEnabled,
    emailNotificationsEnabled: emailNotificationsEnabled,
    defaultViewMode: defaultViewMode,
    showTutorialOnLaunch: showTutorialOnLaunch,
    languageCode: languageCode,
    darkMode: darkMode,
    updatedAt: updatedAt,
    createdAt: createdAt,
  );
}

/// Extension methods for [UserSettingsModel].
extension UserSettingsModelExt on UserSettingsModel {
  /// Creates a domain entity from this model.
  UserSettings toEntity() => UserSettings(
    userId: userId,
    themeMode: themeMode,
    notificationsEnabled: notificationsEnabled,
    emailNotificationsEnabled: emailNotificationsEnabled,
    defaultViewMode: defaultViewMode,
    showTutorialOnLaunch: showTutorialOnLaunch,
    languageCode: languageCode,
    darkMode: darkMode,
    updatedAt: updatedAt,
    createdAt: createdAt,
  );

  /// Validates settings values.
  ///
  /// Throws [ArgumentError] if any value is invalid.
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
    if (languageCode.isEmpty) {
      throw ArgumentError('languageCode cannot be empty');
    }
  }
}
