import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// User domain entity representing an authenticated user.
///
/// This is the core domain model for a user in the system.
/// It contains only business logic relevant fields, not persistence details.
@freezed
abstract class User with _$User {
  const factory User({
    /// Unique identifier for the user (Firebase UID)
    required String id,

    /// User's email address (unique)
    required String email,

    /// User's chosen username (unique)
    required String username,

    /// User's display name (can be different from username)
    required String displayName,

    /// Timestamp when user account was created
    required DateTime createdAt,

    /// Avatar URL if user has uploaded one
    String? avatarUrl,

    /// Timestamp when user profile was last updated
    DateTime? updatedAt,
  }) = _User;
}
