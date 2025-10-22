// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserSettingsModel {

 String get userId; DateTime get updatedAt; DateTime get createdAt; String get themeMode; bool get notificationsEnabled; bool get emailNotificationsEnabled; String get defaultViewMode; bool get showTutorialOnLaunch; String get languageCode; bool get darkMode;
/// Create a copy of UserSettingsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSettingsModelCopyWith<UserSettingsModel> get copyWith => _$UserSettingsModelCopyWithImpl<UserSettingsModel>(this as UserSettingsModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSettingsModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.emailNotificationsEnabled, emailNotificationsEnabled) || other.emailNotificationsEnabled == emailNotificationsEnabled)&&(identical(other.defaultViewMode, defaultViewMode) || other.defaultViewMode == defaultViewMode)&&(identical(other.showTutorialOnLaunch, showTutorialOnLaunch) || other.showTutorialOnLaunch == showTutorialOnLaunch)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode));
}


@override
int get hashCode => Object.hash(runtimeType,userId,updatedAt,createdAt,themeMode,notificationsEnabled,emailNotificationsEnabled,defaultViewMode,showTutorialOnLaunch,languageCode,darkMode);

@override
String toString() {
  return 'UserSettingsModel(userId: $userId, updatedAt: $updatedAt, createdAt: $createdAt, themeMode: $themeMode, notificationsEnabled: $notificationsEnabled, emailNotificationsEnabled: $emailNotificationsEnabled, defaultViewMode: $defaultViewMode, showTutorialOnLaunch: $showTutorialOnLaunch, languageCode: $languageCode, darkMode: $darkMode)';
}


}

/// @nodoc
abstract mixin class $UserSettingsModelCopyWith<$Res>  {
  factory $UserSettingsModelCopyWith(UserSettingsModel value, $Res Function(UserSettingsModel) _then) = _$UserSettingsModelCopyWithImpl;
@useResult
$Res call({
 String userId, DateTime updatedAt, DateTime createdAt, String themeMode, bool notificationsEnabled, bool emailNotificationsEnabled, String defaultViewMode, bool showTutorialOnLaunch, String languageCode, bool darkMode
});




}
/// @nodoc
class _$UserSettingsModelCopyWithImpl<$Res>
    implements $UserSettingsModelCopyWith<$Res> {
  _$UserSettingsModelCopyWithImpl(this._self, this._then);

  final UserSettingsModel _self;
  final $Res Function(UserSettingsModel) _then;

/// Create a copy of UserSettingsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? updatedAt = null,Object? createdAt = null,Object? themeMode = null,Object? notificationsEnabled = null,Object? emailNotificationsEnabled = null,Object? defaultViewMode = null,Object? showTutorialOnLaunch = null,Object? languageCode = null,Object? darkMode = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as String,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,emailNotificationsEnabled: null == emailNotificationsEnabled ? _self.emailNotificationsEnabled : emailNotificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,defaultViewMode: null == defaultViewMode ? _self.defaultViewMode : defaultViewMode // ignore: cast_nullable_to_non_nullable
as String,showTutorialOnLaunch: null == showTutorialOnLaunch ? _self.showTutorialOnLaunch : showTutorialOnLaunch // ignore: cast_nullable_to_non_nullable
as bool,languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,darkMode: null == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserSettingsModel].
extension UserSettingsModelPatterns on UserSettingsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSettingsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSettingsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSettingsModel value)  $default,){
final _that = this;
switch (_that) {
case _UserSettingsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSettingsModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserSettingsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  DateTime updatedAt,  DateTime createdAt,  String themeMode,  bool notificationsEnabled,  bool emailNotificationsEnabled,  String defaultViewMode,  bool showTutorialOnLaunch,  String languageCode,  bool darkMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSettingsModel() when $default != null:
return $default(_that.userId,_that.updatedAt,_that.createdAt,_that.themeMode,_that.notificationsEnabled,_that.emailNotificationsEnabled,_that.defaultViewMode,_that.showTutorialOnLaunch,_that.languageCode,_that.darkMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  DateTime updatedAt,  DateTime createdAt,  String themeMode,  bool notificationsEnabled,  bool emailNotificationsEnabled,  String defaultViewMode,  bool showTutorialOnLaunch,  String languageCode,  bool darkMode)  $default,) {final _that = this;
switch (_that) {
case _UserSettingsModel():
return $default(_that.userId,_that.updatedAt,_that.createdAt,_that.themeMode,_that.notificationsEnabled,_that.emailNotificationsEnabled,_that.defaultViewMode,_that.showTutorialOnLaunch,_that.languageCode,_that.darkMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  DateTime updatedAt,  DateTime createdAt,  String themeMode,  bool notificationsEnabled,  bool emailNotificationsEnabled,  String defaultViewMode,  bool showTutorialOnLaunch,  String languageCode,  bool darkMode)?  $default,) {final _that = this;
switch (_that) {
case _UserSettingsModel() when $default != null:
return $default(_that.userId,_that.updatedAt,_that.createdAt,_that.themeMode,_that.notificationsEnabled,_that.emailNotificationsEnabled,_that.defaultViewMode,_that.showTutorialOnLaunch,_that.languageCode,_that.darkMode);case _:
  return null;

}
}

}

/// @nodoc


class _UserSettingsModel extends UserSettingsModel {
  const _UserSettingsModel({required this.userId, required this.updatedAt, required this.createdAt, this.themeMode = 'system', this.notificationsEnabled = true, this.emailNotificationsEnabled = true, this.defaultViewMode = 'list', this.showTutorialOnLaunch = true, this.languageCode = 'en', this.darkMode = false}): super._();
  

@override final  String userId;
@override final  DateTime updatedAt;
@override final  DateTime createdAt;
@override@JsonKey() final  String themeMode;
@override@JsonKey() final  bool notificationsEnabled;
@override@JsonKey() final  bool emailNotificationsEnabled;
@override@JsonKey() final  String defaultViewMode;
@override@JsonKey() final  bool showTutorialOnLaunch;
@override@JsonKey() final  String languageCode;
@override@JsonKey() final  bool darkMode;

/// Create a copy of UserSettingsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSettingsModelCopyWith<_UserSettingsModel> get copyWith => __$UserSettingsModelCopyWithImpl<_UserSettingsModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSettingsModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.emailNotificationsEnabled, emailNotificationsEnabled) || other.emailNotificationsEnabled == emailNotificationsEnabled)&&(identical(other.defaultViewMode, defaultViewMode) || other.defaultViewMode == defaultViewMode)&&(identical(other.showTutorialOnLaunch, showTutorialOnLaunch) || other.showTutorialOnLaunch == showTutorialOnLaunch)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode));
}


@override
int get hashCode => Object.hash(runtimeType,userId,updatedAt,createdAt,themeMode,notificationsEnabled,emailNotificationsEnabled,defaultViewMode,showTutorialOnLaunch,languageCode,darkMode);

@override
String toString() {
  return 'UserSettingsModel(userId: $userId, updatedAt: $updatedAt, createdAt: $createdAt, themeMode: $themeMode, notificationsEnabled: $notificationsEnabled, emailNotificationsEnabled: $emailNotificationsEnabled, defaultViewMode: $defaultViewMode, showTutorialOnLaunch: $showTutorialOnLaunch, languageCode: $languageCode, darkMode: $darkMode)';
}


}

/// @nodoc
abstract mixin class _$UserSettingsModelCopyWith<$Res> implements $UserSettingsModelCopyWith<$Res> {
  factory _$UserSettingsModelCopyWith(_UserSettingsModel value, $Res Function(_UserSettingsModel) _then) = __$UserSettingsModelCopyWithImpl;
@override @useResult
$Res call({
 String userId, DateTime updatedAt, DateTime createdAt, String themeMode, bool notificationsEnabled, bool emailNotificationsEnabled, String defaultViewMode, bool showTutorialOnLaunch, String languageCode, bool darkMode
});




}
/// @nodoc
class __$UserSettingsModelCopyWithImpl<$Res>
    implements _$UserSettingsModelCopyWith<$Res> {
  __$UserSettingsModelCopyWithImpl(this._self, this._then);

  final _UserSettingsModel _self;
  final $Res Function(_UserSettingsModel) _then;

/// Create a copy of UserSettingsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? updatedAt = null,Object? createdAt = null,Object? themeMode = null,Object? notificationsEnabled = null,Object? emailNotificationsEnabled = null,Object? defaultViewMode = null,Object? showTutorialOnLaunch = null,Object? languageCode = null,Object? darkMode = null,}) {
  return _then(_UserSettingsModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as String,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,emailNotificationsEnabled: null == emailNotificationsEnabled ? _self.emailNotificationsEnabled : emailNotificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,defaultViewMode: null == defaultViewMode ? _self.defaultViewMode : defaultViewMode // ignore: cast_nullable_to_non_nullable
as String,showTutorialOnLaunch: null == showTutorialOnLaunch ? _self.showTutorialOnLaunch : showTutorialOnLaunch // ignore: cast_nullable_to_non_nullable
as bool,languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String,darkMode: null == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
