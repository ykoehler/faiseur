// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserSettings {

/// Unique identifier of the user who owns these settings.
 String get userId;/// Theme mode preference: 'light', 'dark', or 'system'.
 String get themeMode;/// Whether notifications are enabled globally.
 bool get notificationsEnabled;/// Whether email notifications are enabled.
 bool get emailNotificationsEnabled;/// Default view preference for lists: 'list', 'kanban', or 'card'.
 String get defaultViewMode;/// Whether to show tutorial on first launch.
 bool get showTutorialOnLaunch;/// User's language preference (ISO 639-1 code, e.g., 'en', 'es').
 String get languageCode;/// Whether to enable dark mode (legacy, use themeMode instead).
 bool get darkMode;/// When these settings were last updated.
 DateTime get updatedAt;/// When these settings were created.
 DateTime get createdAt;
/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<UserSettings> get copyWith => _$UserSettingsCopyWithImpl<UserSettings>(this as UserSettings, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSettings&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.emailNotificationsEnabled, emailNotificationsEnabled) || other.emailNotificationsEnabled == emailNotificationsEnabled)&&(identical(other.defaultViewMode, defaultViewMode) || other.defaultViewMode == defaultViewMode)&&(identical(other.showTutorialOnLaunch, showTutorialOnLaunch) || other.showTutorialOnLaunch == showTutorialOnLaunch)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,userId,themeMode,notificationsEnabled,emailNotificationsEnabled,defaultViewMode,showTutorialOnLaunch,languageCode,darkMode,updatedAt,createdAt);

@override
String toString() {
  return 'UserSettings(userId: $userId, themeMode: $themeMode, notificationsEnabled: $notificationsEnabled, emailNotificationsEnabled: $emailNotificationsEnabled, defaultViewMode: $defaultViewMode, showTutorialOnLaunch: $showTutorialOnLaunch, languageCode: $languageCode, darkMode: $darkMode, updatedAt: $updatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserSettingsCopyWith<$Res>  {
  factory $UserSettingsCopyWith(UserSettings value, $Res Function(UserSettings) _then) = _$UserSettingsCopyWithImpl;
@useResult
$Res call({
 String userId, String themeMode, bool notificationsEnabled, bool emailNotificationsEnabled, String defaultViewMode, bool showTutorialOnLaunch, String languageCode, bool darkMode, DateTime updatedAt, DateTime createdAt
});




}
/// @nodoc
class _$UserSettingsCopyWithImpl<$Res>
    implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._self, this._then);

  final UserSettings _self;
  final $Res Function(UserSettings) _then;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? themeMode = null,Object? notificationsEnabled = null,Object? emailNotificationsEnabled = null,Object? defaultViewMode = null,Object? showTutorialOnLaunch = null,Object? languageCode = null,Object? darkMode = null,Object? updatedAt = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as String,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,emailNotificationsEnabled: null == emailNotificationsEnabled ? _self.emailNotificationsEnabled : emailNotificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,defaultViewMode: null == defaultViewMode ? _self.defaultViewMode : defaultViewMode // ignore: cast_nullable_to_non_nullable
as String,showTutorialOnLaunch: null == showTutorialOnLaunch ? _self.showTutorialOnLaunch : showTutorialOnLaunch // ignore: cast_nullable_to_non_nullable
as bool,languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,darkMode: null == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as bool,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserSettings].
extension UserSettingsPatterns on UserSettings {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSettings value)  $default,){
final _that = this;
switch (_that) {
case _UserSettings():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSettings value)?  $default,){
final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String themeMode,  bool notificationsEnabled,  bool emailNotificationsEnabled,  String defaultViewMode,  bool showTutorialOnLaunch,  String languageCode,  bool darkMode,  DateTime updatedAt,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.userId,_that.themeMode,_that.notificationsEnabled,_that.emailNotificationsEnabled,_that.defaultViewMode,_that.showTutorialOnLaunch,_that.languageCode,_that.darkMode,_that.updatedAt,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String themeMode,  bool notificationsEnabled,  bool emailNotificationsEnabled,  String defaultViewMode,  bool showTutorialOnLaunch,  String languageCode,  bool darkMode,  DateTime updatedAt,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _UserSettings():
return $default(_that.userId,_that.themeMode,_that.notificationsEnabled,_that.emailNotificationsEnabled,_that.defaultViewMode,_that.showTutorialOnLaunch,_that.languageCode,_that.darkMode,_that.updatedAt,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String themeMode,  bool notificationsEnabled,  bool emailNotificationsEnabled,  String defaultViewMode,  bool showTutorialOnLaunch,  String languageCode,  bool darkMode,  DateTime updatedAt,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _UserSettings() when $default != null:
return $default(_that.userId,_that.themeMode,_that.notificationsEnabled,_that.emailNotificationsEnabled,_that.defaultViewMode,_that.showTutorialOnLaunch,_that.languageCode,_that.darkMode,_that.updatedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _UserSettings extends UserSettings {
  const _UserSettings({required this.userId, this.themeMode = 'system', this.notificationsEnabled = true, this.emailNotificationsEnabled = true, this.defaultViewMode = 'list', this.showTutorialOnLaunch = true, this.languageCode = 'en', this.darkMode = false, required this.updatedAt, required this.createdAt}): super._();
  

/// Unique identifier of the user who owns these settings.
@override final  String userId;
/// Theme mode preference: 'light', 'dark', or 'system'.
@override@JsonKey() final  String themeMode;
/// Whether notifications are enabled globally.
@override@JsonKey() final  bool notificationsEnabled;
/// Whether email notifications are enabled.
@override@JsonKey() final  bool emailNotificationsEnabled;
/// Default view preference for lists: 'list', 'kanban', or 'card'.
@override@JsonKey() final  String defaultViewMode;
/// Whether to show tutorial on first launch.
@override@JsonKey() final  bool showTutorialOnLaunch;
/// User's language preference (ISO 639-1 code, e.g., 'en', 'es').
@override@JsonKey() final  String languageCode;
/// Whether to enable dark mode (legacy, use themeMode instead).
@override@JsonKey() final  bool darkMode;
/// When these settings were last updated.
@override final  DateTime updatedAt;
/// When these settings were created.
@override final  DateTime createdAt;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSettingsCopyWith<_UserSettings> get copyWith => __$UserSettingsCopyWithImpl<_UserSettings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSettings&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.emailNotificationsEnabled, emailNotificationsEnabled) || other.emailNotificationsEnabled == emailNotificationsEnabled)&&(identical(other.defaultViewMode, defaultViewMode) || other.defaultViewMode == defaultViewMode)&&(identical(other.showTutorialOnLaunch, showTutorialOnLaunch) || other.showTutorialOnLaunch == showTutorialOnLaunch)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,userId,themeMode,notificationsEnabled,emailNotificationsEnabled,defaultViewMode,showTutorialOnLaunch,languageCode,darkMode,updatedAt,createdAt);

@override
String toString() {
  return 'UserSettings(userId: $userId, themeMode: $themeMode, notificationsEnabled: $notificationsEnabled, emailNotificationsEnabled: $emailNotificationsEnabled, defaultViewMode: $defaultViewMode, showTutorialOnLaunch: $showTutorialOnLaunch, languageCode: $languageCode, darkMode: $darkMode, updatedAt: $updatedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserSettingsCopyWith<$Res> implements $UserSettingsCopyWith<$Res> {
  factory _$UserSettingsCopyWith(_UserSettings value, $Res Function(_UserSettings) _then) = __$UserSettingsCopyWithImpl;
@override @useResult
$Res call({
 String userId, String themeMode, bool notificationsEnabled, bool emailNotificationsEnabled, String defaultViewMode, bool showTutorialOnLaunch, String languageCode, bool darkMode, DateTime updatedAt, DateTime createdAt
});




}
/// @nodoc
class __$UserSettingsCopyWithImpl<$Res>
    implements _$UserSettingsCopyWith<$Res> {
  __$UserSettingsCopyWithImpl(this._self, this._then);

  final _UserSettings _self;
  final $Res Function(_UserSettings) _then;

/// Create a copy of UserSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? themeMode = null,Object? notificationsEnabled = null,Object? emailNotificationsEnabled = null,Object? defaultViewMode = null,Object? showTutorialOnLaunch = null,Object? languageCode = null,Object? darkMode = null,Object? updatedAt = null,Object? createdAt = null,}) {
  return _then(_UserSettings(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as String,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,emailNotificationsEnabled: null == emailNotificationsEnabled ? _self.emailNotificationsEnabled : emailNotificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,defaultViewMode: null == defaultViewMode ? _self.defaultViewMode : defaultViewMode // ignore: cast_nullable_to_non_nullable
as String,showTutorialOnLaunch: null == showTutorialOnLaunch ? _self.showTutorialOnLaunch : showTutorialOnLaunch // ignore: cast_nullable_to_non_nullable
as bool,languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,darkMode: null == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as bool,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
