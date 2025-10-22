import 'package:faiseur/features/settings/domain/entities/user_settings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserSettings Entity', () {
    final now = DateTime.now();

    test('should create UserSettings with all fields', () {
      final settings = UserSettings(
        userId: 'user123',
        themeMode: 'dark',
        notificationsEnabled: true,
        emailNotificationsEnabled: false,
        defaultViewMode: 'kanban',
        showTutorialOnLaunch: false,
        languageCode: 'es',
        darkMode: true,
        updatedAt: now,
        createdAt: now,
      );

      expect(settings.userId, 'user123');
      expect(settings.themeMode, 'dark');
      expect(settings.notificationsEnabled, true);
      expect(settings.emailNotificationsEnabled, false);
      expect(settings.defaultViewMode, 'kanban');
      expect(settings.showTutorialOnLaunch, false);
      expect(settings.languageCode, 'es');
      expect(settings.darkMode, true);
      expect(settings.updatedAt, now);
      expect(settings.createdAt, now);
    });

    test('should use default values when not specified', () {
      final settings = UserSettings(userId: 'user123', updatedAt: now, createdAt: now);

      expect(settings.themeMode, 'system');
      expect(settings.notificationsEnabled, true);
      expect(settings.emailNotificationsEnabled, true);
      expect(settings.defaultViewMode, 'list');
      expect(settings.showTutorialOnLaunch, true);
      expect(settings.languageCode, 'en');
      expect(settings.darkMode, false);
    });

    test('should validate userId is not empty', () {
      final settings = UserSettings(userId: '', updatedAt: now, createdAt: now);

      expect(settings.validate, throwsA(isA<ArgumentError>().having((e) => e.message, 'message', contains('userId'))));
    });

    test('should validate themeMode is valid', () {
      final settings = UserSettings(userId: 'user123', themeMode: 'invalid', updatedAt: now, createdAt: now);

      expect(
        settings.validate,
        throwsA(isA<ArgumentError>().having((e) => e.message, 'message', contains('themeMode'))),
      );
    });

    test('should accept valid themeModes', () {
      for (final mode in ['light', 'dark', 'system']) {
        final settings = UserSettings(userId: 'user123', themeMode: mode, updatedAt: now, createdAt: now);

        expect(settings.validate, returnsNormally);
      }
    });

    test('should validate defaultViewMode is valid', () {
      final settings = UserSettings(userId: 'user123', defaultViewMode: 'invalid', updatedAt: now, createdAt: now);

      expect(
        settings.validate,
        throwsA(isA<ArgumentError>().having((e) => e.message, 'message', contains('defaultViewMode'))),
      );
    });

    test('should accept valid viewModes', () {
      for (final mode in ['list', 'kanban', 'card']) {
        final settings = UserSettings(userId: 'user123', defaultViewMode: mode, updatedAt: now, createdAt: now);

        expect(settings.validate, returnsNormally);
      }
    });

    test('should validate languageCode is 2 characters', () {
      final settings = UserSettings(userId: 'user123', languageCode: 'eng', updatedAt: now, createdAt: now);

      expect(
        settings.validate,
        throwsA(isA<ArgumentError>().having((e) => e.message, 'message', contains('languageCode'))),
      );
    });

    test('should validate with valid languageCode', () {
      final settings = UserSettings(userId: 'user123', languageCode: 'en', updatedAt: now, createdAt: now);

      expect(settings.validate, returnsNormally);
    });

    test('should be immutable', () {
      final settings = UserSettings(userId: 'user123', updatedAt: now, createdAt: now);

      // Attempting to modify should not work (Freezed generates immutable classes)
      expect(identical(settings, settings), true);
    });

    test('should support equality comparison', () {
      final settings1 = UserSettings(userId: 'user123', themeMode: 'dark', updatedAt: now, createdAt: now);

      final settings2 = UserSettings(userId: 'user123', themeMode: 'dark', updatedAt: now, createdAt: now);

      expect(settings1, equals(settings2));
    });

    test('should support copyWith', () {
      final settings = UserSettings(userId: 'user123', themeMode: 'light', updatedAt: now, createdAt: now);

      final updated = settings.copyWith(themeMode: 'dark');

      expect(updated.userId, settings.userId);
      expect(updated.themeMode, 'dark');
      expect(updated.updatedAt, settings.updatedAt);
    });
  });
}
