import 'package:faiseur/features/auth/presentation/providers/auth_providers.dart';
import 'package:faiseur/features/settings/data/providers/settings_data_providers.dart';
import 'package:faiseur/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:faiseur/features/settings/domain/entities/user_settings.dart';
import 'package:faiseur/features/settings/domain/repositories/settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_providers.g.dart';

// ============================================================================
// REPOSITORY PROVIDERS
// ============================================================================

/// Provider for the SettingsRepository singleton instance
@riverpod
SettingsRepository settingsRepository(Ref ref) =>
    SettingsRepositoryImpl(remoteDatasource: ref.watch(settingsRemoteDatasourceProvider));

// ============================================================================
// STATE PROVIDERS
// ============================================================================

/// Provides a stream of the current user's settings.
///
/// Automatically watches the current authenticated user's settings
/// and updates in real-time as they change.
@riverpod
Stream<UserSettings> userSettings(Ref ref) {
  final auth = ref.watch(currentUserProvider);
  return auth.when(
    data: (user) {
      if (user == null) {
        throw SettingsException('User not authenticated', code: 'not_authenticated');
      }
      final repository = ref.watch(settingsRepositoryProvider);
      return repository.watchUserSettings(user.id);
    },
    loading: () => throw SettingsException('User not loaded yet', code: 'user_not_loaded'),
    error: (error, stackTrace) =>
        throw SettingsException('Failed to load user', code: 'user_load_failed', originalError: error),
  );
}

/// Provides async version of current user settings for one-time fetches.
///
/// Use this when you need to fetch settings once without streaming.
@riverpod
Future<UserSettings> userSettingsAsync(Ref ref) async {
  final auth = ref.watch(currentUserProvider);
  return auth.when(
    data: (user) {
      if (user == null) {
        throw SettingsException('User not authenticated', code: 'not_authenticated');
      }
      final repository = ref.watch(settingsRepositoryProvider);
      return repository.getUserSettings(user.id);
    },
    loading: () => throw SettingsException('User not loaded yet', code: 'user_not_loaded'),
    error: (error, stackTrace) =>
        throw SettingsException('Failed to load user', code: 'user_load_failed', originalError: error),
  );
}

// ============================================================================
// NOTIFIER FOR SETTINGS STATE MANAGEMENT
// ============================================================================

/// Notifier for managing settings state and operations.
///
/// Provides methods for updating settings and handles state transitions.
@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  /// Updates the theme mode preference.
  Future<void> updateTheme(String themeMode) async {
    final auth = ref.watch(currentUserProvider);
    await auth.when(
      data: (user) async {
        if (user == null) {
          return;
        }
        final repository = ref.read(settingsRepositoryProvider);
        await repository.updateThemeMode(user.id, themeMode);
        ref
          ..invalidate(userSettingsProvider)
          ..invalidate(userSettingsAsyncProvider);
      },
      loading: () => throw SettingsException('User not loaded yet', code: 'user_not_loaded'),
      error: (error, stackTrace) =>
          throw SettingsException('Failed to load user', code: 'user_load_failed', originalError: error),
    );
  }

  /// Updates notification preferences.
  Future<void> updateNotifications({required bool enabled}) async {
    final auth = ref.watch(currentUserProvider);
    await auth.when(
      data: (user) async {
        if (user == null) {
          return;
        }
        final repository = ref.read(settingsRepositoryProvider);
        await repository.updateNotificationsEnabled(user.id, enabled: enabled);
        ref
          ..invalidate(userSettingsProvider)
          ..invalidate(userSettingsAsyncProvider);
      },
      loading: () => throw SettingsException('User not loaded yet', code: 'user_not_loaded'),
      error: (error, stackTrace) =>
          throw SettingsException('Failed to load user', code: 'user_load_failed', originalError: error),
    );
  }

  /// Updates email notification preferences.
  Future<void> updateEmailNotifications({required bool enabled}) async {
    final auth = ref.watch(currentUserProvider);
    await auth.when(
      data: (user) async {
        if (user == null) {
          return;
        }
        final repository = ref.read(settingsRepositoryProvider);
        await repository.updateEmailNotificationsEnabled(user.id, enabled: enabled);
        ref
          ..invalidate(userSettingsProvider)
          ..invalidate(userSettingsAsyncProvider);
      },
      loading: () => throw SettingsException('User not loaded yet', code: 'user_not_loaded'),
      error: (error, stackTrace) =>
          throw SettingsException('Failed to load user', code: 'user_load_failed', originalError: error),
    );
  }

  /// Updates the default view mode preference.
  Future<void> updateViewMode(String viewMode) async {
    final auth = ref.watch(currentUserProvider);
    await auth.when(
      data: (user) async {
        if (user == null) {
          return;
        }
        final repository = ref.read(settingsRepositoryProvider);
        await repository.updateDefaultViewMode(user.id, viewMode);
        ref
          ..invalidate(userSettingsProvider)
          ..invalidate(userSettingsAsyncProvider);
      },
      loading: () => throw SettingsException('User not loaded yet', code: 'user_not_loaded'),
      error: (error, stackTrace) =>
          throw SettingsException('Failed to load user', code: 'user_load_failed', originalError: error),
    );
  }

  /// Resets settings to their default values.
  Future<void> resetToDefaults() async {
    final auth = ref.watch(currentUserProvider);
    await auth.when(
      data: (user) async {
        if (user == null) {
          return;
        }
        final repository = ref.read(settingsRepositoryProvider);
        await repository.resetToDefaults(user.id);
        ref
          ..invalidate(userSettingsProvider)
          ..invalidate(userSettingsAsyncProvider);
      },
      loading: () => throw SettingsException('User not loaded yet', code: 'user_not_loaded'),
      error: (error, stackTrace) =>
          throw SettingsException('Failed to load user', code: 'user_load_failed', originalError: error),
    );
  }

  @override
  void build() {
    // This notifier doesn't maintain state, just provides methods
  }
}
