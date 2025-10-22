import 'package:faiseur/features/auth/data/models/user_model.dart';
import 'package:faiseur/features/auth/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User Entity', () {
    test('should create user with required fields', () {
      final now = DateTime.now();
      const userId = 'user123';
      const email = 'test@example.com';
      const username = 'testuser';
      const displayName = 'Test User';

      final user = User(id: userId, email: email, username: username, displayName: displayName, createdAt: now);

      expect(user.id, equals(userId));
      expect(user.email, equals(email));
      expect(user.username, equals(username));
      expect(user.displayName, equals(displayName));
      expect(user.createdAt, equals(now));
      expect(user.avatarUrl, isNull);
      expect(user.updatedAt, isNull);
    });

    test('should create user with optional fields', () {
      final now = DateTime.now();
      final updated = DateTime.now().add(const Duration(days: 1));
      const avatarUrl = 'https://example.com/avatar.jpg';

      final user = User(
        id: 'user123',
        email: 'test@example.com',
        username: 'testuser',
        displayName: 'Test User',
        avatarUrl: avatarUrl,
        createdAt: now,
        updatedAt: updated,
      );

      expect(user.avatarUrl, equals(avatarUrl));
      expect(user.updatedAt, equals(updated));
    });

    test('should support value equality', () {
      final now = DateTime.now();

      final user1 = User(
        id: 'user123',
        email: 'test@example.com',
        username: 'testuser',
        displayName: 'Test User',
        createdAt: now,
      );

      final user2 = User(
        id: 'user123',
        email: 'test@example.com',
        username: 'testuser',
        displayName: 'Test User',
        createdAt: now,
      );

      expect(user1, equals(user2));
    });

    test('should support copyWith method', () {
      final now = DateTime.now();
      final user1 = User(
        id: 'user123',
        email: 'test@example.com',
        username: 'testuser',
        displayName: 'Test User',
        createdAt: now,
      );

      final user2 = user1.copyWith(displayName: 'New Name');

      expect(user2.id, equals(user1.id));
      expect(user2.displayName, equals('New Name'));
      expect(user2.email, equals(user1.email));
    });
  });

  group('UserModel', () {
    test('should convert to User entity', () {
      final now = DateTime.now();
      final model = UserModel(
        id: 'user123',
        email: 'test@example.com',
        username: 'testuser',
        displayName: 'Test User',
        createdAt: now,
      );

      final user = model.toEntity();

      expect(user.id, equals(model.id));
      expect(user.email, equals(model.email));
      expect(user.username, equals(model.username));
      expect(user.displayName, equals(model.displayName));
      expect(user.createdAt, equals(model.createdAt));
    });

    test('should convert User entity to model', () {
      final now = DateTime.now();
      final user = User(
        id: 'user123',
        email: 'test@example.com',
        username: 'testuser',
        displayName: 'Test User',
        createdAt: now,
      );

      final model = user.toModel();

      expect(model.id, equals(user.id));
      expect(model.email, equals(user.email));
      expect(model.username, equals(user.username));
      expect(model.displayName, equals(user.displayName));
      expect(model.createdAt, equals(user.createdAt));
    });

    test('should round-trip conversion preserves data', () {
      final now = DateTime.now();
      final originalUser = User(
        id: 'user123',
        email: 'test@example.com',
        username: 'testuser',
        displayName: 'Test User',
        avatarUrl: 'https://example.com/avatar.jpg',
        createdAt: now,
        updatedAt: now.add(const Duration(hours: 1)),
      );

      final model = originalUser.toModel();
      final restoredUser = model.toEntity();

      expect(restoredUser, equals(originalUser));
    });
  });
}
