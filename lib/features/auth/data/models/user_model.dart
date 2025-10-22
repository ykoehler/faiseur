import 'package:faiseur/core/helpers/firestore_date_helpers.dart';
import 'package:faiseur/features/auth/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

/// User model for Firestore serialization.
///
/// This model extends the User entity and adds JSON serialization
/// capabilities for storing/retrieving from Firestore.
@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    required String username,
    required String displayName,
    required DateTime createdAt,
    String? avatarUrl,
    DateTime? updatedAt,
  }) = _UserModel;
}

/// Parse a Firestore document map into a [UserModel].
UserModel userModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  username: json['username'] as String,
  displayName: json['displayName'] as String,
  avatarUrl: json['avatarUrl'] as String?,
  createdAt: parseFirestoreTimestamp(json['createdAt'], fieldName: 'createdAt'),
  updatedAt: parseFirestoreTimestampNullable(json['updatedAt'], fieldName: 'updatedAt'),
);

/// Convert a [UserModel] into a Firestore-ready map.
Map<String, dynamic> userModelToJson(UserModel model) => {
  'id': model.id,
  'email': model.email,
  'username': model.username,
  'displayName': model.displayName,
  'avatarUrl': model.avatarUrl,
  'createdAt': timestampFromDateTime(model.createdAt),
  'updatedAt': timestampFromNullableDateTime(model.updatedAt),
};

/// Extension on UserModel to convert to/from User entity
extension UserModelX on UserModel {
  /// Convert UserModel to User entity
  User toEntity() => User(
    id: id,
    email: email,
    username: username,
    displayName: displayName,
    avatarUrl: avatarUrl,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}

/// Extension on User to convert to UserModel
extension UserX on User {
  /// Convert User entity to UserModel
  UserModel toModel() => UserModel(
    id: id,
    email: email,
    username: username,
    displayName: displayName,
    avatarUrl: avatarUrl,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
