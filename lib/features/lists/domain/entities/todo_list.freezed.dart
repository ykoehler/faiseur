// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodoList {

/// Unique identifier for the list (Firestore doc ID)
 String get id;/// The title/name of the list
 String get title;/// Hex color code for UI representation (e.g., '#FF5733')
 String get color;/// User ID of the list owner
 String get ownerId;/// Timestamp when the list was created
 DateTime get createdAt;/// Optional description of what this list is for
 String? get description;/// Map of collaborators: userId -> UserRole
/// Example: {'user123': UserRole.editor, 'user456': UserRole.viewer}
 Map<String, UserRole> get collaborators;/// Whether this list is currently archived
 bool get isArchived;/// Number of todos in this list
 int get todoCount;/// Number of completed todos in this list
 int get completedCount;/// Timestamp when the list was last updated
 DateTime? get updatedAt;
/// Create a copy of TodoList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoListCopyWith<TodoList> get copyWith => _$TodoListCopyWithImpl<TodoList>(this as TodoList, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoList&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.color, color) || other.color == color)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.collaborators, collaborators)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.todoCount, todoCount) || other.todoCount == todoCount)&&(identical(other.completedCount, completedCount) || other.completedCount == completedCount)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,color,ownerId,createdAt,description,const DeepCollectionEquality().hash(collaborators),isArchived,todoCount,completedCount,updatedAt);

@override
String toString() {
  return 'TodoList(id: $id, title: $title, color: $color, ownerId: $ownerId, createdAt: $createdAt, description: $description, collaborators: $collaborators, isArchived: $isArchived, todoCount: $todoCount, completedCount: $completedCount, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TodoListCopyWith<$Res>  {
  factory $TodoListCopyWith(TodoList value, $Res Function(TodoList) _then) = _$TodoListCopyWithImpl;
@useResult
$Res call({
 String id, String title, String color, String ownerId, DateTime createdAt, String? description, Map<String, UserRole> collaborators, bool isArchived, int todoCount, int completedCount, DateTime? updatedAt
});




}
/// @nodoc
class _$TodoListCopyWithImpl<$Res>
    implements $TodoListCopyWith<$Res> {
  _$TodoListCopyWithImpl(this._self, this._then);

  final TodoList _self;
  final $Res Function(TodoList) _then;

/// Create a copy of TodoList
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
as Map<String, UserRole>,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,todoCount: null == todoCount ? _self.todoCount : todoCount // ignore: cast_nullable_to_non_nullable
as int,completedCount: null == completedCount ? _self.completedCount : completedCount // ignore: cast_nullable_to_non_nullable
as int,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TodoList].
extension TodoListPatterns on TodoList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodoList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodoList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodoList value)  $default,){
final _that = this;
switch (_that) {
case _TodoList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodoList value)?  $default,){
final _that = this;
switch (_that) {
case _TodoList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String color,  String ownerId,  DateTime createdAt,  String? description,  Map<String, UserRole> collaborators,  bool isArchived,  int todoCount,  int completedCount,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodoList() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String color,  String ownerId,  DateTime createdAt,  String? description,  Map<String, UserRole> collaborators,  bool isArchived,  int todoCount,  int completedCount,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TodoList():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String color,  String ownerId,  DateTime createdAt,  String? description,  Map<String, UserRole> collaborators,  bool isArchived,  int todoCount,  int completedCount,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TodoList() when $default != null:
return $default(_that.id,_that.title,_that.color,_that.ownerId,_that.createdAt,_that.description,_that.collaborators,_that.isArchived,_that.todoCount,_that.completedCount,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _TodoList implements TodoList {
  const _TodoList({required this.id, required this.title, required this.color, required this.ownerId, required this.createdAt, this.description, final  Map<String, UserRole> collaborators = const {}, this.isArchived = false, this.todoCount = 0, this.completedCount = 0, this.updatedAt}): _collaborators = collaborators;
  

/// Unique identifier for the list (Firestore doc ID)
@override final  String id;
/// The title/name of the list
@override final  String title;
/// Hex color code for UI representation (e.g., '#FF5733')
@override final  String color;
/// User ID of the list owner
@override final  String ownerId;
/// Timestamp when the list was created
@override final  DateTime createdAt;
/// Optional description of what this list is for
@override final  String? description;
/// Map of collaborators: userId -> UserRole
/// Example: {'user123': UserRole.editor, 'user456': UserRole.viewer}
 final  Map<String, UserRole> _collaborators;
/// Map of collaborators: userId -> UserRole
/// Example: {'user123': UserRole.editor, 'user456': UserRole.viewer}
@override@JsonKey() Map<String, UserRole> get collaborators {
  if (_collaborators is EqualUnmodifiableMapView) return _collaborators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_collaborators);
}

/// Whether this list is currently archived
@override@JsonKey() final  bool isArchived;
/// Number of todos in this list
@override@JsonKey() final  int todoCount;
/// Number of completed todos in this list
@override@JsonKey() final  int completedCount;
/// Timestamp when the list was last updated
@override final  DateTime? updatedAt;

/// Create a copy of TodoList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoListCopyWith<_TodoList> get copyWith => __$TodoListCopyWithImpl<_TodoList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoList&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.color, color) || other.color == color)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._collaborators, _collaborators)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.todoCount, todoCount) || other.todoCount == todoCount)&&(identical(other.completedCount, completedCount) || other.completedCount == completedCount)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,color,ownerId,createdAt,description,const DeepCollectionEquality().hash(_collaborators),isArchived,todoCount,completedCount,updatedAt);

@override
String toString() {
  return 'TodoList(id: $id, title: $title, color: $color, ownerId: $ownerId, createdAt: $createdAt, description: $description, collaborators: $collaborators, isArchived: $isArchived, todoCount: $todoCount, completedCount: $completedCount, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TodoListCopyWith<$Res> implements $TodoListCopyWith<$Res> {
  factory _$TodoListCopyWith(_TodoList value, $Res Function(_TodoList) _then) = __$TodoListCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String color, String ownerId, DateTime createdAt, String? description, Map<String, UserRole> collaborators, bool isArchived, int todoCount, int completedCount, DateTime? updatedAt
});




}
/// @nodoc
class __$TodoListCopyWithImpl<$Res>
    implements _$TodoListCopyWith<$Res> {
  __$TodoListCopyWithImpl(this._self, this._then);

  final _TodoList _self;
  final $Res Function(_TodoList) _then;

/// Create a copy of TodoList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? color = null,Object? ownerId = null,Object? createdAt = null,Object? description = freezed,Object? collaborators = null,Object? isArchived = null,Object? todoCount = null,Object? completedCount = null,Object? updatedAt = freezed,}) {
  return _then(_TodoList(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,collaborators: null == collaborators ? _self._collaborators : collaborators // ignore: cast_nullable_to_non_nullable
as Map<String, UserRole>,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,todoCount: null == todoCount ? _self.todoCount : todoCount // ignore: cast_nullable_to_non_nullable
as int,completedCount: null == completedCount ? _self.completedCount : completedCount // ignore: cast_nullable_to_non_nullable
as int,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
