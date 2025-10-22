// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Todo {

/// Unique identifier for the todo (Firestore doc ID)
 String get id;/// ID of the list this todo belongs to
 String get listId;/// The title/name of the todo
 String get title;/// User ID of the person who created this todo
 String get createdBy;/// Timestamp when the todo was created
 DateTime get createdAt;/// Current status in the workflow
 TodoStatus get status;/// Priority level
 TodoPriority get priority;/// XP points awarded when this todo is completed
 int get xpReward;/// Whether this todo is currently archived
 bool get isArchived;/// Optional detailed description
 String? get description;/// Optional due date for the todo
 DateTime? get dueDate;/// Timestamp when the todo was last updated
 DateTime? get updatedAt;/// Timestamp when the todo was marked as done
 DateTime? get completedAt;/// List of user IDs assigned to this todo
 List<String> get assignedTo;/// Optional tags/labels for categorization
 List<String> get tags;
/// Create a copy of Todo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoCopyWith<Todo> get copyWith => _$TodoCopyWithImpl<Todo>(this as Todo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Todo&&(identical(other.id, id) || other.id == id)&&(identical(other.listId, listId) || other.listId == listId)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.xpReward, xpReward) || other.xpReward == xpReward)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&const DeepCollectionEquality().equals(other.assignedTo, assignedTo)&&const DeepCollectionEquality().equals(other.tags, tags));
}


@override
int get hashCode => Object.hash(runtimeType,id,listId,title,createdBy,createdAt,status,priority,xpReward,isArchived,description,dueDate,updatedAt,completedAt,const DeepCollectionEquality().hash(assignedTo),const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'Todo(id: $id, listId: $listId, title: $title, createdBy: $createdBy, createdAt: $createdAt, status: $status, priority: $priority, xpReward: $xpReward, isArchived: $isArchived, description: $description, dueDate: $dueDate, updatedAt: $updatedAt, completedAt: $completedAt, assignedTo: $assignedTo, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $TodoCopyWith<$Res>  {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) _then) = _$TodoCopyWithImpl;
@useResult
$Res call({
 String id, String listId, String title, String createdBy, DateTime createdAt, TodoStatus status, TodoPriority priority, int xpReward, bool isArchived, String? description, DateTime? dueDate, DateTime? updatedAt, DateTime? completedAt, List<String> assignedTo, List<String> tags
});




}
/// @nodoc
class _$TodoCopyWithImpl<$Res>
    implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._self, this._then);

  final Todo _self;
  final $Res Function(Todo) _then;

/// Create a copy of Todo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? listId = null,Object? title = null,Object? createdBy = null,Object? createdAt = null,Object? status = null,Object? priority = null,Object? xpReward = null,Object? isArchived = null,Object? description = freezed,Object? dueDate = freezed,Object? updatedAt = freezed,Object? completedAt = freezed,Object? assignedTo = null,Object? tags = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,listId: null == listId ? _self.listId : listId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TodoStatus,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TodoPriority,xpReward: null == xpReward ? _self.xpReward : xpReward // ignore: cast_nullable_to_non_nullable
as int,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,assignedTo: null == assignedTo ? _self.assignedTo : assignedTo // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Todo].
extension TodoPatterns on Todo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Todo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Todo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Todo value)  $default,){
final _that = this;
switch (_that) {
case _Todo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Todo value)?  $default,){
final _that = this;
switch (_that) {
case _Todo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String listId,  String title,  String createdBy,  DateTime createdAt,  TodoStatus status,  TodoPriority priority,  int xpReward,  bool isArchived,  String? description,  DateTime? dueDate,  DateTime? updatedAt,  DateTime? completedAt,  List<String> assignedTo,  List<String> tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Todo() when $default != null:
return $default(_that.id,_that.listId,_that.title,_that.createdBy,_that.createdAt,_that.status,_that.priority,_that.xpReward,_that.isArchived,_that.description,_that.dueDate,_that.updatedAt,_that.completedAt,_that.assignedTo,_that.tags);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String listId,  String title,  String createdBy,  DateTime createdAt,  TodoStatus status,  TodoPriority priority,  int xpReward,  bool isArchived,  String? description,  DateTime? dueDate,  DateTime? updatedAt,  DateTime? completedAt,  List<String> assignedTo,  List<String> tags)  $default,) {final _that = this;
switch (_that) {
case _Todo():
return $default(_that.id,_that.listId,_that.title,_that.createdBy,_that.createdAt,_that.status,_that.priority,_that.xpReward,_that.isArchived,_that.description,_that.dueDate,_that.updatedAt,_that.completedAt,_that.assignedTo,_that.tags);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String listId,  String title,  String createdBy,  DateTime createdAt,  TodoStatus status,  TodoPriority priority,  int xpReward,  bool isArchived,  String? description,  DateTime? dueDate,  DateTime? updatedAt,  DateTime? completedAt,  List<String> assignedTo,  List<String> tags)?  $default,) {final _that = this;
switch (_that) {
case _Todo() when $default != null:
return $default(_that.id,_that.listId,_that.title,_that.createdBy,_that.createdAt,_that.status,_that.priority,_that.xpReward,_that.isArchived,_that.description,_that.dueDate,_that.updatedAt,_that.completedAt,_that.assignedTo,_that.tags);case _:
  return null;

}
}

}

/// @nodoc


class _Todo implements Todo {
  const _Todo({required this.id, required this.listId, required this.title, required this.createdBy, required this.createdAt, this.status = TodoStatus.new_, this.priority = TodoPriority.medium, this.xpReward = 10, this.isArchived = false, this.description, this.dueDate, this.updatedAt, this.completedAt, final  List<String> assignedTo = const [], final  List<String> tags = const []}): _assignedTo = assignedTo,_tags = tags;
  

/// Unique identifier for the todo (Firestore doc ID)
@override final  String id;
/// ID of the list this todo belongs to
@override final  String listId;
/// The title/name of the todo
@override final  String title;
/// User ID of the person who created this todo
@override final  String createdBy;
/// Timestamp when the todo was created
@override final  DateTime createdAt;
/// Current status in the workflow
@override@JsonKey() final  TodoStatus status;
/// Priority level
@override@JsonKey() final  TodoPriority priority;
/// XP points awarded when this todo is completed
@override@JsonKey() final  int xpReward;
/// Whether this todo is currently archived
@override@JsonKey() final  bool isArchived;
/// Optional detailed description
@override final  String? description;
/// Optional due date for the todo
@override final  DateTime? dueDate;
/// Timestamp when the todo was last updated
@override final  DateTime? updatedAt;
/// Timestamp when the todo was marked as done
@override final  DateTime? completedAt;
/// List of user IDs assigned to this todo
 final  List<String> _assignedTo;
/// List of user IDs assigned to this todo
@override@JsonKey() List<String> get assignedTo {
  if (_assignedTo is EqualUnmodifiableListView) return _assignedTo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assignedTo);
}

/// Optional tags/labels for categorization
 final  List<String> _tags;
/// Optional tags/labels for categorization
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of Todo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoCopyWith<_Todo> get copyWith => __$TodoCopyWithImpl<_Todo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Todo&&(identical(other.id, id) || other.id == id)&&(identical(other.listId, listId) || other.listId == listId)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.xpReward, xpReward) || other.xpReward == xpReward)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&const DeepCollectionEquality().equals(other._assignedTo, _assignedTo)&&const DeepCollectionEquality().equals(other._tags, _tags));
}


@override
int get hashCode => Object.hash(runtimeType,id,listId,title,createdBy,createdAt,status,priority,xpReward,isArchived,description,dueDate,updatedAt,completedAt,const DeepCollectionEquality().hash(_assignedTo),const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'Todo(id: $id, listId: $listId, title: $title, createdBy: $createdBy, createdAt: $createdAt, status: $status, priority: $priority, xpReward: $xpReward, isArchived: $isArchived, description: $description, dueDate: $dueDate, updatedAt: $updatedAt, completedAt: $completedAt, assignedTo: $assignedTo, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$TodoCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$TodoCopyWith(_Todo value, $Res Function(_Todo) _then) = __$TodoCopyWithImpl;
@override @useResult
$Res call({
 String id, String listId, String title, String createdBy, DateTime createdAt, TodoStatus status, TodoPriority priority, int xpReward, bool isArchived, String? description, DateTime? dueDate, DateTime? updatedAt, DateTime? completedAt, List<String> assignedTo, List<String> tags
});




}
/// @nodoc
class __$TodoCopyWithImpl<$Res>
    implements _$TodoCopyWith<$Res> {
  __$TodoCopyWithImpl(this._self, this._then);

  final _Todo _self;
  final $Res Function(_Todo) _then;

/// Create a copy of Todo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? listId = null,Object? title = null,Object? createdBy = null,Object? createdAt = null,Object? status = null,Object? priority = null,Object? xpReward = null,Object? isArchived = null,Object? description = freezed,Object? dueDate = freezed,Object? updatedAt = freezed,Object? completedAt = freezed,Object? assignedTo = null,Object? tags = null,}) {
  return _then(_Todo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,listId: null == listId ? _self.listId : listId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TodoStatus,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TodoPriority,xpReward: null == xpReward ? _self.xpReward : xpReward // ignore: cast_nullable_to_non_nullable
as int,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,assignedTo: null == assignedTo ? _self._assignedTo : assignedTo // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
