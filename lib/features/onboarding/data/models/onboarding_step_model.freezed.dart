// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_step_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingStepModel {

 String get id; int get stepNumber; String get title; String get description; String get iconName; String? get imageAsset; String get actionButtonText; bool get isLastStep; String? get secondaryButtonText; List<String> get tips; bool get canSkip; int? get recommendedDuration;
/// Create a copy of OnboardingStepModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingStepModelCopyWith<OnboardingStepModel> get copyWith => _$OnboardingStepModelCopyWithImpl<OnboardingStepModel>(this as OnboardingStepModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingStepModel&&(identical(other.id, id) || other.id == id)&&(identical(other.stepNumber, stepNumber) || other.stepNumber == stepNumber)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&(identical(other.imageAsset, imageAsset) || other.imageAsset == imageAsset)&&(identical(other.actionButtonText, actionButtonText) || other.actionButtonText == actionButtonText)&&(identical(other.isLastStep, isLastStep) || other.isLastStep == isLastStep)&&(identical(other.secondaryButtonText, secondaryButtonText) || other.secondaryButtonText == secondaryButtonText)&&const DeepCollectionEquality().equals(other.tips, tips)&&(identical(other.canSkip, canSkip) || other.canSkip == canSkip)&&(identical(other.recommendedDuration, recommendedDuration) || other.recommendedDuration == recommendedDuration));
}


@override
int get hashCode => Object.hash(runtimeType,id,stepNumber,title,description,iconName,imageAsset,actionButtonText,isLastStep,secondaryButtonText,const DeepCollectionEquality().hash(tips),canSkip,recommendedDuration);

@override
String toString() {
  return 'OnboardingStepModel(id: $id, stepNumber: $stepNumber, title: $title, description: $description, iconName: $iconName, imageAsset: $imageAsset, actionButtonText: $actionButtonText, isLastStep: $isLastStep, secondaryButtonText: $secondaryButtonText, tips: $tips, canSkip: $canSkip, recommendedDuration: $recommendedDuration)';
}


}

/// @nodoc
abstract mixin class $OnboardingStepModelCopyWith<$Res>  {
  factory $OnboardingStepModelCopyWith(OnboardingStepModel value, $Res Function(OnboardingStepModel) _then) = _$OnboardingStepModelCopyWithImpl;
@useResult
$Res call({
 String id, int stepNumber, String title, String description, String iconName, String? imageAsset, String actionButtonText, bool isLastStep, String? secondaryButtonText, List<String> tips, bool canSkip, int? recommendedDuration
});




}
/// @nodoc
class _$OnboardingStepModelCopyWithImpl<$Res>
    implements $OnboardingStepModelCopyWith<$Res> {
  _$OnboardingStepModelCopyWithImpl(this._self, this._then);

  final OnboardingStepModel _self;
  final $Res Function(OnboardingStepModel) _then;

/// Create a copy of OnboardingStepModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? stepNumber = null,Object? title = null,Object? description = null,Object? iconName = null,Object? imageAsset = freezed,Object? actionButtonText = null,Object? isLastStep = null,Object? secondaryButtonText = freezed,Object? tips = null,Object? canSkip = null,Object? recommendedDuration = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,stepNumber: null == stepNumber ? _self.stepNumber : stepNumber // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,iconName: null == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String,imageAsset: freezed == imageAsset ? _self.imageAsset : imageAsset // ignore: cast_nullable_to_non_nullable
as String?,actionButtonText: null == actionButtonText ? _self.actionButtonText : actionButtonText // ignore: cast_nullable_to_non_nullable
as String,isLastStep: null == isLastStep ? _self.isLastStep : isLastStep // ignore: cast_nullable_to_non_nullable
as bool,secondaryButtonText: freezed == secondaryButtonText ? _self.secondaryButtonText : secondaryButtonText // ignore: cast_nullable_to_non_nullable
as String?,tips: null == tips ? _self.tips : tips // ignore: cast_nullable_to_non_nullable
as List<String>,canSkip: null == canSkip ? _self.canSkip : canSkip // ignore: cast_nullable_to_non_nullable
as bool,recommendedDuration: freezed == recommendedDuration ? _self.recommendedDuration : recommendedDuration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingStepModel].
extension OnboardingStepModelPatterns on OnboardingStepModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingStepModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingStepModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingStepModel value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingStepModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingStepModel value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingStepModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int stepNumber,  String title,  String description,  String iconName,  String? imageAsset,  String actionButtonText,  bool isLastStep,  String? secondaryButtonText,  List<String> tips,  bool canSkip,  int? recommendedDuration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingStepModel() when $default != null:
return $default(_that.id,_that.stepNumber,_that.title,_that.description,_that.iconName,_that.imageAsset,_that.actionButtonText,_that.isLastStep,_that.secondaryButtonText,_that.tips,_that.canSkip,_that.recommendedDuration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int stepNumber,  String title,  String description,  String iconName,  String? imageAsset,  String actionButtonText,  bool isLastStep,  String? secondaryButtonText,  List<String> tips,  bool canSkip,  int? recommendedDuration)  $default,) {final _that = this;
switch (_that) {
case _OnboardingStepModel():
return $default(_that.id,_that.stepNumber,_that.title,_that.description,_that.iconName,_that.imageAsset,_that.actionButtonText,_that.isLastStep,_that.secondaryButtonText,_that.tips,_that.canSkip,_that.recommendedDuration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int stepNumber,  String title,  String description,  String iconName,  String? imageAsset,  String actionButtonText,  bool isLastStep,  String? secondaryButtonText,  List<String> tips,  bool canSkip,  int? recommendedDuration)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingStepModel() when $default != null:
return $default(_that.id,_that.stepNumber,_that.title,_that.description,_that.iconName,_that.imageAsset,_that.actionButtonText,_that.isLastStep,_that.secondaryButtonText,_that.tips,_that.canSkip,_that.recommendedDuration);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingStepModel extends OnboardingStepModel {
  const _OnboardingStepModel({required this.id, required this.stepNumber, required this.title, required this.description, required this.iconName, this.imageAsset, this.actionButtonText = 'Next', this.isLastStep = false, this.secondaryButtonText, final  List<String> tips = const [], this.canSkip = true, this.recommendedDuration}): _tips = tips,super._();
  

@override final  String id;
@override final  int stepNumber;
@override final  String title;
@override final  String description;
@override final  String iconName;
@override final  String? imageAsset;
@override@JsonKey() final  String actionButtonText;
@override@JsonKey() final  bool isLastStep;
@override final  String? secondaryButtonText;
 final  List<String> _tips;
@override@JsonKey() List<String> get tips {
  if (_tips is EqualUnmodifiableListView) return _tips;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tips);
}

@override@JsonKey() final  bool canSkip;
@override final  int? recommendedDuration;

/// Create a copy of OnboardingStepModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingStepModelCopyWith<_OnboardingStepModel> get copyWith => __$OnboardingStepModelCopyWithImpl<_OnboardingStepModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingStepModel&&(identical(other.id, id) || other.id == id)&&(identical(other.stepNumber, stepNumber) || other.stepNumber == stepNumber)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconName, iconName) || other.iconName == iconName)&&(identical(other.imageAsset, imageAsset) || other.imageAsset == imageAsset)&&(identical(other.actionButtonText, actionButtonText) || other.actionButtonText == actionButtonText)&&(identical(other.isLastStep, isLastStep) || other.isLastStep == isLastStep)&&(identical(other.secondaryButtonText, secondaryButtonText) || other.secondaryButtonText == secondaryButtonText)&&const DeepCollectionEquality().equals(other._tips, _tips)&&(identical(other.canSkip, canSkip) || other.canSkip == canSkip)&&(identical(other.recommendedDuration, recommendedDuration) || other.recommendedDuration == recommendedDuration));
}


@override
int get hashCode => Object.hash(runtimeType,id,stepNumber,title,description,iconName,imageAsset,actionButtonText,isLastStep,secondaryButtonText,const DeepCollectionEquality().hash(_tips),canSkip,recommendedDuration);

@override
String toString() {
  return 'OnboardingStepModel(id: $id, stepNumber: $stepNumber, title: $title, description: $description, iconName: $iconName, imageAsset: $imageAsset, actionButtonText: $actionButtonText, isLastStep: $isLastStep, secondaryButtonText: $secondaryButtonText, tips: $tips, canSkip: $canSkip, recommendedDuration: $recommendedDuration)';
}


}

/// @nodoc
abstract mixin class _$OnboardingStepModelCopyWith<$Res> implements $OnboardingStepModelCopyWith<$Res> {
  factory _$OnboardingStepModelCopyWith(_OnboardingStepModel value, $Res Function(_OnboardingStepModel) _then) = __$OnboardingStepModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int stepNumber, String title, String description, String iconName, String? imageAsset, String actionButtonText, bool isLastStep, String? secondaryButtonText, List<String> tips, bool canSkip, int? recommendedDuration
});




}
/// @nodoc
class __$OnboardingStepModelCopyWithImpl<$Res>
    implements _$OnboardingStepModelCopyWith<$Res> {
  __$OnboardingStepModelCopyWithImpl(this._self, this._then);

  final _OnboardingStepModel _self;
  final $Res Function(_OnboardingStepModel) _then;

/// Create a copy of OnboardingStepModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? stepNumber = null,Object? title = null,Object? description = null,Object? iconName = null,Object? imageAsset = freezed,Object? actionButtonText = null,Object? isLastStep = null,Object? secondaryButtonText = freezed,Object? tips = null,Object? canSkip = null,Object? recommendedDuration = freezed,}) {
  return _then(_OnboardingStepModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,stepNumber: null == stepNumber ? _self.stepNumber : stepNumber // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,iconName: null == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String,imageAsset: freezed == imageAsset ? _self.imageAsset : imageAsset // ignore: cast_nullable_to_non_nullable
as String?,actionButtonText: null == actionButtonText ? _self.actionButtonText : actionButtonText // ignore: cast_nullable_to_non_nullable
as String,isLastStep: null == isLastStep ? _self.isLastStep : isLastStep // ignore: cast_nullable_to_non_nullable
as bool,secondaryButtonText: freezed == secondaryButtonText ? _self.secondaryButtonText : secondaryButtonText // ignore: cast_nullable_to_non_nullable
as String?,tips: null == tips ? _self._tips : tips // ignore: cast_nullable_to_non_nullable
as List<String>,canSkip: null == canSkip ? _self.canSkip : canSkip // ignore: cast_nullable_to_non_nullable
as bool,recommendedDuration: freezed == recommendedDuration ? _self.recommendedDuration : recommendedDuration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
