// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodoModel {

 String get id; String get listId; String get title; String get createdBy; DateTime get createdAt; TodoStatus get status; TodoPriority get priority; int get xpReward; bool get isArchived; String? get description; DateTime? get dueDate; DateTime? get updatedAt; DateTime? get completedAt; List<String> get assignedTo; List<String> get tags;
/// Create a copy of TodoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoModelCopyWith<TodoModel> get copyWith => _$TodoModelCopyWithImpl<TodoModel>(this as TodoModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.listId, listId) || other.listId == listId)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.xpReward, xpReward) || other.xpReward == xpReward)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&const DeepCollectionEquality().equals(other.assignedTo, assignedTo)&&const DeepCollectionEquality().equals(other.tags, tags));
}


@override
int get hashCode => Object.hash(runtimeType,id,listId,title,createdBy,createdAt,status,priority,xpReward,isArchived,description,dueDate,updatedAt,completedAt,const DeepCollectionEquality().hash(assignedTo),const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'TodoModel(id: $id, listId: $listId, title: $title, createdBy: $createdBy, createdAt: $createdAt, status: $status, priority: $priority, xpReward: $xpReward, isArchived: $isArchived, description: $description, dueDate: $dueDate, updatedAt: $updatedAt, completedAt: $completedAt, assignedTo: $assignedTo, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $TodoModelCopyWith<$Res>  {
  factory $TodoModelCopyWith(TodoModel value, $Res Function(TodoModel) _then) = _$TodoModelCopyWithImpl;
@useResult
$Res call({
 String id, String listId, String title, String createdBy, DateTime createdAt, TodoStatus status, TodoPriority priority, int xpReward, bool isArchived, String? description, DateTime? dueDate, DateTime? updatedAt, DateTime? completedAt, List<String> assignedTo, List<String> tags
});




}
/// @nodoc
class _$TodoModelCopyWithImpl<$Res>
    implements $TodoModelCopyWith<$Res> {
  _$TodoModelCopyWithImpl(this._self, this._then);

  final TodoModel _self;
  final $Res Function(TodoModel) _then;

/// Create a copy of TodoModel
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


/// Adds pattern-matching-related methods to [TodoModel].
extension TodoModelPatterns on TodoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodoModel value)  $default,){
final _that = this;
switch (_that) {
case _TodoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodoModel value)?  $default,){
final _that = this;
switch (_that) {
case _TodoModel() when $default != null:
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
case _TodoModel() when $default != null:
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
case _TodoModel():
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
case _TodoModel() when $default != null:
return $default(_that.id,_that.listId,_that.title,_that.createdBy,_that.createdAt,_that.status,_that.priority,_that.xpReward,_that.isArchived,_that.description,_that.dueDate,_that.updatedAt,_that.completedAt,_that.assignedTo,_that.tags);case _:
  return null;

}
}

}

/// @nodoc


class _TodoModel implements TodoModel {
  const _TodoModel({required this.id, required this.listId, required this.title, required this.createdBy, required this.createdAt, this.status = TodoStatus.new_, this.priority = TodoPriority.medium, this.xpReward = 10, this.isArchived = false, this.description, this.dueDate, this.updatedAt, this.completedAt, final  List<String> assignedTo = const [], final  List<String> tags = const []}): _assignedTo = assignedTo,_tags = tags;
  

@override final  String id;
@override final  String listId;
@override final  String title;
@override final  String createdBy;
@override final  DateTime createdAt;
@override@JsonKey() final  TodoStatus status;
@override@JsonKey() final  TodoPriority priority;
@override@JsonKey() final  int xpReward;
@override@JsonKey() final  bool isArchived;
@override final  String? description;
@override final  DateTime? dueDate;
@override final  DateTime? updatedAt;
@override final  DateTime? completedAt;
 final  List<String> _assignedTo;
@override@JsonKey() List<String> get assignedTo {
  if (_assignedTo is EqualUnmodifiableListView) return _assignedTo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assignedTo);
}

 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}


/// Create a copy of TodoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoModelCopyWith<_TodoModel> get copyWith => __$TodoModelCopyWithImpl<_TodoModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.listId, listId) || other.listId == listId)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.xpReward, xpReward) || other.xpReward == xpReward)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&const DeepCollectionEquality().equals(other._assignedTo, _assignedTo)&&const DeepCollectionEquality().equals(other._tags, _tags));
}


@override
int get hashCode => Object.hash(runtimeType,id,listId,title,createdBy,createdAt,status,priority,xpReward,isArchived,description,dueDate,updatedAt,completedAt,const DeepCollectionEquality().hash(_assignedTo),const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'TodoModel(id: $id, listId: $listId, title: $title, createdBy: $createdBy, createdAt: $createdAt, status: $status, priority: $priority, xpReward: $xpReward, isArchived: $isArchived, description: $description, dueDate: $dueDate, updatedAt: $updatedAt, completedAt: $completedAt, assignedTo: $assignedTo, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$TodoModelCopyWith<$Res> implements $TodoModelCopyWith<$Res> {
  factory _$TodoModelCopyWith(_TodoModel value, $Res Function(_TodoModel) _then) = __$TodoModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String listId, String title, String createdBy, DateTime createdAt, TodoStatus status, TodoPriority priority, int xpReward, bool isArchived, String? description, DateTime? dueDate, DateTime? updatedAt, DateTime? completedAt, List<String> assignedTo, List<String> tags
});




}
/// @nodoc
class __$TodoModelCopyWithImpl<$Res>
    implements _$TodoModelCopyWith<$Res> {
  __$TodoModelCopyWithImpl(this._self, this._then);

  final _TodoModel _self;
  final $Res Function(_TodoModel) _then;

/// Create a copy of TodoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? listId = null,Object? title = null,Object? createdBy = null,Object? createdAt = null,Object? status = null,Object? priority = null,Object? xpReward = null,Object? isArchived = null,Object? description = freezed,Object? dueDate = freezed,Object? updatedAt = freezed,Object? completedAt = freezed,Object? assignedTo = null,Object? tags = null,}) {
  return _then(_TodoModel(
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
