import 'package:faiseur/features/settings/data/datasources/settings_remote_datasource.dart';
import 'package:faiseur/features/settings/data/models/user_settings_model.dart';
import 'package:faiseur/features/settings/domain/entities/user_settings.dart';
import 'package:faiseur/features/settings/domain/repositories/settings_repository.dart';

/// Implementation of [SettingsRepository] using Firestore backend.
class SettingsRepositoryImpl implements SettingsRepository {
  /// Creates a settings repository.
  SettingsRepositoryImpl({required SettingsRemoteDatasource remoteDatasource}) : _remoteDatasource = remoteDatasource;

  final SettingsRemoteDatasource _remoteDatasource;

  @override
  Future<UserSettings> getUserSettings(String userId) async {
    try {
      final model = await _remoteDatasource.getUserSettings(userId);
      return model.toEntity();
    } on SettingsRemoteDatasourceException catch (e) {
      throw SettingsException(e.message, code: e.code, originalError: e.originalError);
    } catch (e) {
      throw SettingsException('Failed to fetch settings', code: 'unknown_error', originalError: e);
    }
  }

  @override
  Stream<UserSettings> watchUserSettings(String userId) {
    try {
      return _remoteDatasource.watchUserSettings(userId).map((model) => model.toEntity()).handleError((dynamic error) {
        if (error is SettingsRemoteDatasourceException) {
          throw SettingsException(error.message, code: error.code, originalError: error.originalError);
        }
        throw SettingsException('Failed to watch user settings', code: 'unknown_error', originalError: error);
      });
    } on SettingsRemoteDatasourceException catch (e) {
      throw SettingsException(e.message, code: e.code, originalError: e.originalError);
    } catch (e) {
      throw SettingsException('Failed to setup settings stream', code: 'unknown_error', originalError: e);
    }
  }

  @override
  Future<void> updateUserSettings(UserSettings settings) async {
    try {
      settings.validate();
      final model = settings.toModel();
      await _remoteDatasource.setUserSettings(model);
    } on SettingsException {
      rethrow;
    } on SettingsRemoteDatasourceException catch (e) {
      throw SettingsException(e.message, code: e.code, originalError: e.originalError);
    } catch (e) {
      throw SettingsException('Failed to update user settings', code: 'unknown_error', originalError: e);
    }
  }

  @override
  Future<void> updateThemeMode(String userId, String themeMode) async {
    try {
      if (!['light', 'dark', 'system'].contains(themeMode)) {
        throw SettingsException(
          'themeMode must be one of: light, dark, system. Got: $themeMode',
          code: 'invalid_theme_mode',
        );
      }

      final current = await getUserSettings(userId);
      final updated = current.copyWith(themeMode: themeMode);
      await updateUserSettings(updated);
    } on SettingsException {
      rethrow;
    } catch (e) {
      throw SettingsException('Failed to update theme mode', code: 'unknown_error', originalError: e);
    }
  }

  @override
  Future<void> updateNotificationsEnabled(String userId, {required bool enabled}) async {
    try {
      final current = await getUserSettings(userId);
      final updated = current.copyWith(notificationsEnabled: enabled);
      await updateUserSettings(updated);
    } on SettingsException {
      rethrow;
    } catch (e) {
      throw SettingsException('Failed to update notifications', code: 'unknown_error', originalError: e);
    }
  }

  @override
  Future<void> updateEmailNotificationsEnabled(String userId, {required bool enabled}) async {
    try {
      final current = await getUserSettings(userId);
      final updated = current.copyWith(emailNotificationsEnabled: enabled);
      await updateUserSettings(updated);
    } on SettingsException {
      rethrow;
    } catch (e) {
      throw SettingsException('Failed to update email notifications', code: 'unknown_error', originalError: e);
    }
  }

  @override
  Future<void> updateDefaultViewMode(String userId, String viewMode) async {
    try {
      if (!['list', 'kanban', 'card'].contains(viewMode)) {
        throw SettingsException(
          'viewMode must be one of: list, kanban, card. Got: $viewMode',
          code: 'invalid_view_mode',
        );
      }

      final current = await getUserSettings(userId);
      final updated = current.copyWith(defaultViewMode: viewMode);
      await updateUserSettings(updated);
    } on SettingsException {
      rethrow;
    } catch (e) {
      throw SettingsException('Failed to update view mode', code: 'unknown_error', originalError: e);
    }
  }

  @override
  Future<void> resetToDefaults(String userId) async {
    try {
      final now = DateTime.now();
      final defaults = UserSettings(
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
      await updateUserSettings(defaults);
    } on SettingsException {
      rethrow;
    } catch (e) {
      throw SettingsException('Failed to reset settings to defaults', code: 'unknown_error', originalError: e);
    }
  }

  @override
  Future<void> deleteUserSettings(String userId) async {
    try {
      await _remoteDatasource.deleteUserSettings(userId);
    } on SettingsRemoteDatasourceException catch (e) {
      throw SettingsException(e.message, code: e.code, originalError: e.originalError);
    } catch (e) {
      throw SettingsException('Failed to delete user settings', code: 'unknown_error', originalError: e);
    }
  }
}
