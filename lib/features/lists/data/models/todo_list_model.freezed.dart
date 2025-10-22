// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodoListModel {

 String get id; String get title; String get color; String get ownerId; DateTime get createdAt; String? get description; Map<String, String> get collaborators; bool get isArchived; int get todoCount; int get completedCount; DateTime? get updatedAt;
/// Create a copy of TodoListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoListModelCopyWith<TodoListModel> get copyWith => _$TodoListModelCopyWithImpl<TodoListModel>(this as TodoListModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoListModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.color, color) || other.color == color)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.collaborators, collaborators)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.todoCount, todoCount) || other.todoCount == todoCount)&&(identical(other.completedCount, completedCount) || other.completedCount == completedCount)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,color,ownerId,createdAt,description,const DeepCollectionEquality().hash(collaborators),isArchived,todoCount,completedCount,updatedAt);

@override
String toString() {
  return 'TodoListModel(id: $id, title: $title, color: $color, ownerId: $ownerId, createdAt: $createdAt, description: $description, collaborators: $collaborators, isArchived: $isArchived, todoCount: $todoCount, completedCount: $completedCount, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TodoListModelCopyWith<$Res>  {
  factory $TodoListModelCopyWith(TodoListModel value, $Res Function(TodoListModel) _then) = _$TodoListModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String color, String ownerId, DateTime createdAt, String? description, Map<String, String> collaborators, bool isArchived, int todoCount, int completedCount, DateTime? updatedAt
});




}
/// @nodoc
class _$TodoListModelCopyWithImpl<$Res>
    implements $TodoListModelCopyWith<$Res> {
  _$TodoListModelCopyWithImpl(this._self, this._then);

  final TodoListModel _self;
  final $Res Function(TodoListModel) _then;

/// Create a copy of TodoListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? color = null,Object? ownerId = null,Object? createdAt = null,Object? description = freezed,Object? collaborators = null,Object? isArchived = null,Object? todoCount = null,Object? completedCount = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,collaborators: null == collaborators ? _self.collaborators : collaborators // ignore: cast_nullable_to_non_nullable
as Map<String, String>,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,todoCount: null == todoCount ? _self.todoCount : todoCount // ignore: cast_nullable_to_non_nullable
as int,completedCount: null == completedCount ? _self.completedCount : completedCount // ignore: cast_nullable_to_non_nullable
as int,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TodoListModel].
extension TodoListModelPatterns on TodoListModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodoListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodoListModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodoListModel value)  $default,){
final _that = this;
switch (_that) {
case _TodoListModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodoListModel value)?  $default,){
final _that = this;
switch (_that) {
case _TodoListModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String color,  String ownerId,  DateTime createdAt,  String? description,  Map<String, String> collaborators,  bool isArchived,  int todoCount,  int completedCount,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodoListModel() when $default != null:
return $default(_that.id,_that.title,_that.color,_that.ownerId,_that.createdAt,_that.description,_that.collaborators,_that.isArchived,_that.todoCount,_that.completedCount,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String color,  String ownerId,  DateTime createdAt,  String? description,  Map<String, String> collaborators,  bool isArchived,  int todoCount,  int completedCount,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TodoListModel():
return $default(_that.id,_that.title,_that.color,_that.ownerId,_that.createdAt,_that.description,_that.collaborators,_that.isArchived,_that.todoCount,_that.completedCount,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String color,  String ownerId,  DateTime createdAt,  String? description,  Map<String, String> collaborators,  bool isArchived,  int todoCount,  int completedCount,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TodoListModel() when $default != null:
return $default(_that.id,_that.title,_that.color,_that.ownerId,_that.createdAt,_that.description,_that.collaborators,_that.isArchived,_that.todoCount,_that.completedCount,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _TodoListModel implements TodoListModel {
  const _TodoListModel({required this.id, required this.title, required this.color, required this.ownerId, required this.createdAt, this.description, final  Map<String, String> collaborators = const {}, this.isArchived = false, this.todoCount = 0, this.completedCount = 0, this.updatedAt}): _collaborators = collaborators;
  

@override final  String id;
@override final  String title;
@override final  String color;
@override final  String ownerId;
@override final  DateTime createdAt;
@override final  String? description;
 final  Map<String, String> _collaborators;
@override@JsonKey() Map<String, String> get collaborators {
  if (_collaborators is EqualUnmodifiableMapView) return _collaborators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_collaborators);
}

@override@JsonKey() final  bool isArchived;
@override@JsonKey() final  int todoCount;
@override@JsonKey() final  int completedCount;
@override final  DateTime? updatedAt;

/// Create a copy of TodoListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoListModelCopyWith<_TodoListModel> get copyWith => __$TodoListModelCopyWithImpl<_TodoListModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoListModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.color, color) || other.color == color)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._collaborators, _collaborators)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.todoCount, todoCount) || other.todoCount == todoCount)&&(identical(other.completedCount, completedCount) || other.completedCount == completedCount)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,color,ownerId,createdAt,description,const DeepCollectionEquality().hash(_collaborators),isArchived,todoCount,completedCount,updatedAt);

@override
String toString() {
  return 'TodoListModel(id: $id, title: $title, color: $color, ownerId: $ownerId, createdAt: $createdAt, description: $description, collaborators: $collaborators, isArchived: $isArchived, todoCount: $todoCount, completedCount: $completedCount, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TodoListModelCopyWith<$Res> implements $TodoListModelCopyWith<$Res> {
  factory _$TodoListModelCopyWith(_TodoListModel value, $Res Function(_TodoListModel) _then) = __$TodoListModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String color, String ownerId, DateTime createdAt, String? description, Map<String, String> collaborators, bool isArchived, int todoCount, int completedCount, DateTime? updatedAt
});




}
/// @nodoc
class __$TodoListModelCopyWithImpl<$Res>
    implements _$TodoListModelCopyWith<$Res> {
  __$TodoListModelCopyWithImpl(this._self, this._then);

  final _TodoListModel _self;
  final $Res Function(_TodoListModel) _then;

/// Create a copy of TodoListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? color = null,Object? ownerId = null,Object? createdAt = null,Object? description = freezed,Object? collaborators = null,Object? isArchived = null,Object? todoCount = null,Object? completedCount = null,Object? updatedAt = freezed,}) {
  return _then(_TodoListModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,collaborators: null == collaborators ? _self._collaborators : collaborators // ignore: cast_nullable_to_non_nullable
as Map<String, String>,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,todoCount: null == todoCount ? _self.todoCount : todoCount // ignore: cast_nullable_to_non_nullable
as int,completedCount: null == completedCount ? _self.completedCount : completedCount // ignore: cast_nullable_to_non_nullable
as int,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
