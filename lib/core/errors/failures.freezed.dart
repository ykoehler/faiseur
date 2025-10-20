// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Failure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) timeout,
    required TResult Function(String message) authentication,
    required TResult Function(String message) authorization,
    required TResult Function(String message, String? field) validation,
    required TResult Function(String message, String? code) firestore,
    required TResult Function(String message) storage,
    required TResult Function(String message) notFound,
    required TResult Function(String message) state,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? authentication,
    TResult? Function(String message)? authorization,
    TResult? Function(String message, String? field)? validation,
    TResult? Function(String message, String? code)? firestore,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? state,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? timeout,
    TResult Function(String message)? authentication,
    TResult Function(String message)? authorization,
    TResult Function(String message, String? field)? validation,
    TResult Function(String message, String? code)? firestore,
    TResult Function(String message)? storage,
    TResult Function(String message)? notFound,
    TResult Function(String message)? state,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(TimeoutFailure value) timeout,
    required TResult Function(AuthenticationFailure value) authentication,
    required TResult Function(AuthorizationFailure value) authorization,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(FirestoreFailure value) firestore,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(StateFailure value) state,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(UnknownFailure value) unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(TimeoutFailure value)? timeout,
    TResult? Function(AuthenticationFailure value)? authentication,
    TResult? Function(AuthorizationFailure value)? authorization,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(FirestoreFailure value)? firestore,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(StateFailure value)? state,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(UnknownFailure value)? unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(TimeoutFailure value)? timeout,
    TResult Function(AuthenticationFailure value)? authentication,
    TResult Function(AuthorizationFailure value)? authorization,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(FirestoreFailure value)? firestore,
    TResult Function(StorageFailure value)? storage,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(StateFailure value)? state,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NetworkFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NetworkFailureImplCopyWith(
    _$NetworkFailureImpl value,
    $Res Function(_$NetworkFailureImpl) then,
  ) = __$$NetworkFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NetworkFailureImpl>
    implements _$$NetworkFailureImplCopyWith<$Res> {
  __$$NetworkFailureImplCopyWithImpl(
    _$NetworkFailureImpl _value,
    $Res Function(_$NetworkFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$NetworkFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NetworkFailureImpl extends NetworkFailure {
  const _$NetworkFailureImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.network(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      __$$NetworkFailureImplCopyWithImpl<_$NetworkFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) timeout,
    required TResult Function(String message) authentication,
    required TResult Function(String message) authorization,
    required TResult Function(String message, String? field) validation,
    required TResult Function(String message, String? code) firestore,
    required TResult Function(String message) storage,
    required TResult Function(String message) notFound,
    required TResult Function(String message) state,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) unknown,
  }) {
    return network(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? authentication,
    TResult? Function(String message)? authorization,
    TResult? Function(String message, String? field)? validation,
    TResult? Function(String message, String? code)? firestore,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? state,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? unknown,
  }) {
    return network?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? timeout,
    TResult Function(String message)? authentication,
    TResult Function(String message)? authorization,
    TResult Function(String message, String? field)? validation,
    TResult Function(String message, String? code)? firestore,
    TResult Function(String message)? storage,
    TResult Function(String message)? notFound,
    TResult Function(String message)? state,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(TimeoutFailure value) timeout,
    required TResult Function(AuthenticationFailure value) authentication,
    required TResult Function(AuthorizationFailure value) authorization,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(FirestoreFailure value) firestore,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(StateFailure value) state,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(TimeoutFailure value)? timeout,
    TResult? Function(AuthenticationFailure value)? authentication,
    TResult? Function(AuthorizationFailure value)? authorization,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(FirestoreFailure value)? firestore,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(StateFailure value)? state,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(TimeoutFailure value)? timeout,
    TResult Function(AuthenticationFailure value)? authentication,
    TResult Function(AuthorizationFailure value)? authorization,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(FirestoreFailure value)? firestore,
    TResult Function(StorageFailure value)? storage,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(StateFailure value)? state,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkFailure extends Failure {
  const factory NetworkFailure({required final String message}) =
      _$NetworkFailureImpl;
  const NetworkFailure._() : super._();

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimeoutFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$TimeoutFailureImplCopyWith(
    _$TimeoutFailureImpl value,
    $Res Function(_$TimeoutFailureImpl) then,
  ) = __$$TimeoutFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TimeoutFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$TimeoutFailureImpl>
    implements _$$TimeoutFailureImplCopyWith<$Res> {
  __$$TimeoutFailureImplCopyWithImpl(
    _$TimeoutFailureImpl _value,
    $Res Function(_$TimeoutFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$TimeoutFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TimeoutFailureImpl extends TimeoutFailure {
  const _$TimeoutFailureImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.timeout(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeoutFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeoutFailureImplCopyWith<_$TimeoutFailureImpl> get copyWith =>
      __$$TimeoutFailureImplCopyWithImpl<_$TimeoutFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) timeout,
    required TResult Function(String message) authentication,
    required TResult Function(String message) authorization,
    required TResult Function(String message, String? field) validation,
    required TResult Function(String message, String? code) firestore,
    required TResult Function(String message) storage,
    required TResult Function(String message) notFound,
    required TResult Function(String message) state,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) unknown,
  }) {
    return timeout(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? authentication,
    TResult? Function(String message)? authorization,
    TResult? Function(String message, String? field)? validation,
    TResult? Function(String message, String? code)? firestore,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? state,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? unknown,
  }) {
    return timeout?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? timeout,
    TResult Function(String message)? authentication,
    TResult Function(String message)? authorization,
    TResult Function(String message, String? field)? validation,
    TResult Function(String message, String? code)? firestore,
    TResult Function(String message)? storage,
    TResult Function(String message)? notFound,
    TResult Function(String message)? state,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(TimeoutFailure value) timeout,
    required TResult Function(AuthenticationFailure value) authentication,
    required TResult Function(AuthorizationFailure value) authorization,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(FirestoreFailure value) firestore,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(StateFailure value) state,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(TimeoutFailure value)? timeout,
    TResult? Function(AuthenticationFailure value)? authentication,
    TResult? Function(AuthorizationFailure value)? authorization,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(FirestoreFailure value)? firestore,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(StateFailure value)? state,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(TimeoutFailure value)? timeout,
    TResult Function(AuthenticationFailure value)? authentication,
    TResult Function(AuthorizationFailure value)? authorization,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(FirestoreFailure value)? firestore,
    TResult Function(StorageFailure value)? storage,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(StateFailure value)? state,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class TimeoutFailure extends Failure {
  const factory TimeoutFailure({required final String message}) =
      _$TimeoutFailureImpl;
  const TimeoutFailure._() : super._();

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeoutFailureImplCopyWith<_$TimeoutFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticationFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$AuthenticationFailureImplCopyWith(
    _$AuthenticationFailureImpl value,
    $Res Function(_$AuthenticationFailureImpl) then,
  ) = __$$AuthenticationFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthenticationFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$AuthenticationFailureImpl>
    implements _$$AuthenticationFailureImplCopyWith<$Res> {
  __$$AuthenticationFailureImplCopyWithImpl(
    _$AuthenticationFailureImpl _value,
    $Res Function(_$AuthenticationFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$AuthenticationFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AuthenticationFailureImpl extends AuthenticationFailure {
  const _$AuthenticationFailureImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.authentication(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationFailureImplCopyWith<_$AuthenticationFailureImpl>
  get copyWith =>
      __$$AuthenticationFailureImplCopyWithImpl<_$AuthenticationFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) timeout,
    required TResult Function(String message) authentication,
    required TResult Function(String message) authorization,
    required TResult Function(String message, String? field) validation,
    required TResult Function(String message, String? code) firestore,
    required TResult Function(String message) storage,
    required TResult Function(String message) notFound,
    required TResult Function(String message) state,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) unknown,
  }) {
    return authentication(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? authentication,
    TResult? Function(String message)? authorization,
    TResult? Function(String message, String? field)? validation,
    TResult? Function(String message, String? code)? firestore,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? state,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? unknown,
  }) {
    return authentication?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? timeout,
    TResult Function(String message)? authentication,
    TResult Function(String message)? authorization,
    TResult Function(String message, String? field)? validation,
    TResult Function(String message, String? code)? firestore,
    TResult Function(String message)? storage,
    TResult Function(String message)? notFound,
    TResult Function(String message)? state,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (authentication != null) {
      return authentication(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(TimeoutFailure value) timeout,
    required TResult Function(AuthenticationFailure value) authentication,
    required TResult Function(AuthorizationFailure value) authorization,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(FirestoreFailure value) firestore,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(StateFailure value) state,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return authentication(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(TimeoutFailure value)? timeout,
    TResult? Function(AuthenticationFailure value)? authentication,
    TResult? Function(AuthorizationFailure value)? authorization,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(FirestoreFailure value)? firestore,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(StateFailure value)? state,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return authentication?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(TimeoutFailure value)? timeout,
    TResult Function(AuthenticationFailure value)? authentication,
    TResult Function(AuthorizationFailure value)? authorization,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(FirestoreFailure value)? firestore,
    TResult Function(StorageFailure value)? storage,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(StateFailure value)? state,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (authentication != null) {
      return authentication(this);
    }
    return orElse();
  }
}

abstract class AuthenticationFailure extends Failure {
  const factory AuthenticationFailure({required final String message}) =
      _$AuthenticationFailureImpl;
  const AuthenticationFailure._() : super._();

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticationFailureImplCopyWith<_$AuthenticationFailureImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthorizationFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$AuthorizationFailureImplCopyWith(
    _$AuthorizationFailureImpl value,
    $Res Function(_$AuthorizationFailureImpl) then,
  ) = __$$AuthorizationFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthorizationFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$AuthorizationFailureImpl>
    implements _$$AuthorizationFailureImplCopyWith<$Res> {
  __$$AuthorizationFailureImplCopyWithImpl(
    _$AuthorizationFailureImpl _value,
    $Res Function(_$AuthorizationFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$AuthorizationFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AuthorizationFailureImpl extends AuthorizationFailure {
  const _$AuthorizationFailureImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.authorization(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorizationFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorizationFailureImplCopyWith<_$AuthorizationFailureImpl>
  get copyWith =>
      __$$AuthorizationFailureImplCopyWithImpl<_$AuthorizationFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) timeout,
    required TResult Function(String message) authentication,
    required TResult Function(String message) authorization,
    required TResult Function(String message, String? field) validation,
    required TResult Function(String message, String? code) firestore,
    required TResult Function(String message) storage,
    required TResult Function(String message) notFound,
    required TResult Function(String message) state,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) unknown,
  }) {
    return authorization(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? authentication,
    TResult? Function(String message)? authorization,
    TResult? Function(String message, String? field)? validation,
    TResult? Function(String message, String? code)? firestore,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? state,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? unknown,
  }) {
    return authorization?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? timeout,
    TResult Function(String message)? authentication,
    TResult Function(String message)? authorization,
    TResult Function(String message, String? field)? validation,
    TResult Function(String message, String? code)? firestore,
    TResult Function(String message)? storage,
    TResult Function(String message)? notFound,
    TResult Function(String message)? state,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (authorization != null) {
      return authorization(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(TimeoutFailure value) timeout,
    required TResult Function(AuthenticationFailure value) authentication,
    required TResult Function(AuthorizationFailure value) authorization,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(FirestoreFailure value) firestore,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(StateFailure value) state,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return authorization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(TimeoutFailure value)? timeout,
    TResult? Function(AuthenticationFailure value)? authentication,
    TResult? Function(AuthorizationFailure value)? authorization,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(FirestoreFailure value)? firestore,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(StateFailure value)? state,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return authorization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(TimeoutFailure value)? timeout,
    TResult Function(AuthenticationFailure value)? authentication,
    TResult Function(AuthorizationFailure value)? authorization,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(FirestoreFailure value)? firestore,
    TResult Function(StorageFailure value)? storage,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(StateFailure value)? state,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (authorization != null) {
      return authorization(this);
    }
    return orElse();
  }
}

abstract class AuthorizationFailure extends Failure {
  const factory AuthorizationFailure({required final String message}) =
      _$AuthorizationFailureImpl;
  const AuthorizationFailure._() : super._();

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthorizationFailureImplCopyWith<_$AuthorizationFailureImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ValidationFailureImplCopyWith(
    _$ValidationFailureImpl value,
    $Res Function(_$ValidationFailureImpl) then,
  ) = __$$ValidationFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? field});
}

/// @nodoc
class __$$ValidationFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ValidationFailureImpl>
    implements _$$ValidationFailureImplCopyWith<$Res> {
  __$$ValidationFailureImplCopyWithImpl(
    _$ValidationFailureImpl _value,
    $Res Function(_$ValidationFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? field = freezed}) {
    return _then(
      _$ValidationFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        field: freezed == field
            ? _value.field
            : field // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ValidationFailureImpl extends ValidationFailure {
  const _$ValidationFailureImpl({required this.message, this.field})
    : super._();

  @override
  final String message;
  @override
  final String? field;

  @override
  String toString() {
    return 'Failure.validation(message: $message, field: $field)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.field, field) || other.field == field));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, field);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      __$$ValidationFailureImplCopyWithImpl<_$ValidationFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) timeout,
    required TResult Function(String message) authentication,
    required TResult Function(String message) authorization,
    required TResult Function(String message, String? field) validation,
    required TResult Function(String message, String? code) firestore,
    required TResult Function(String message) storage,
    required TResult Function(String message) notFound,
    required TResult Function(String message) state,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) unknown,
  }) {
    return validation(message, field);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? authentication,
    TResult? Function(String message)? authorization,
    TResult? Function(String message, String? field)? validation,
    TResult? Function(String message, String? code)? firestore,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? state,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? unknown,
  }) {
    return validation?.call(message, field);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? timeout,
    TResult Function(String message)? authentication,
    TResult Function(String message)? authorization,
    TResult Function(String message, String? field)? validation,
    TResult Function(String message, String? code)? firestore,
    TResult Function(String message)? storage,
    TResult Function(String message)? notFound,
    TResult Function(String message)? state,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(message, field);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(TimeoutFailure value) timeout,
    required TResult Function(AuthenticationFailure value) authentication,
    required TResult Function(AuthorizationFailure value) authorization,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(FirestoreFailure value) firestore,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(StateFailure value) state,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(TimeoutFailure value)? timeout,
    TResult? Function(AuthenticationFailure value)? authentication,
    TResult? Function(AuthorizationFailure value)? authorization,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(FirestoreFailure value)? firestore,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(StateFailure value)? state,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(TimeoutFailure value)? timeout,
    TResult Function(AuthenticationFailure value)? authentication,
    TResult Function(AuthorizationFailure value)? authorization,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(FirestoreFailure value)? firestore,
    TResult Function(StorageFailure value)? storage,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(StateFailure value)? state,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class ValidationFailure extends Failure {
  const factory ValidationFailure({
    required final String message,
    final String? field,
  }) = _$ValidationFailureImpl;
  const ValidationFailure._() : super._();

  @override
  String get message;
  String? get field;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirestoreFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$FirestoreFailureImplCopyWith(
    _$FirestoreFailureImpl value,
    $Res Function(_$FirestoreFailureImpl) then,
  ) = __$$FirestoreFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? code});
}

/// @nodoc
class __$$FirestoreFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$FirestoreFailureImpl>
    implements _$$FirestoreFailureImplCopyWith<$Res> {
  __$$FirestoreFailureImplCopyWithImpl(
    _$FirestoreFailureImpl _value,
    $Res Function(_$FirestoreFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? code = freezed}) {
    return _then(
      _$FirestoreFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$FirestoreFailureImpl extends FirestoreFailure {
  const _$FirestoreFailureImpl({required this.message, this.code}) : super._();

  @override
  final String message;
  @override
  final String? code;

  @override
  String toString() {
    return 'Failure.firestore(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirestoreFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirestoreFailureImplCopyWith<_$FirestoreFailureImpl> get copyWith =>
      __$$FirestoreFailureImplCopyWithImpl<_$FirestoreFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) timeout,
    required TResult Function(String message) authentication,
    required TResult Function(String message) authorization,
    required TResult Function(String message, String? field) validation,
    required TResult Function(String message, String? code) firestore,
    required TResult Function(String message) storage,
    required TResult Function(String message) notFound,
    required TResult Function(String message) state,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) unknown,
  }) {
    return firestore(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? authentication,
    TResult? Function(String message)? authorization,
    TResult? Function(String message, String? field)? validation,
    TResult? Function(String message, String? code)? firestore,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? state,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? unknown,
  }) {
    return firestore?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? timeout,
    TResult Function(String message)? authentication,
    TResult Function(String message)? authorization,
    TResult Function(String message, String? field)? validation,
    TResult Function(String message, String? code)? firestore,
    TResult Function(String message)? storage,
    TResult Function(String message)? notFound,
    TResult Function(String message)? state,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (firestore != null) {
      return firestore(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(TimeoutFailure value) timeout,
    required TResult Function(AuthenticationFailure value) authentication,
    required TResult Function(AuthorizationFailure value) authorization,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(FirestoreFailure value) firestore,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(StateFailure value) state,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return firestore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(TimeoutFailure value)? timeout,
    TResult? Function(AuthenticationFailure value)? authentication,
    TResult? Function(AuthorizationFailure value)? authorization,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(FirestoreFailure value)? firestore,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(StateFailure value)? state,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return firestore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(TimeoutFailure value)? timeout,
    TResult Function(AuthenticationFailure value)? authentication,
    TResult Function(AuthorizationFailure value)? authorization,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(FirestoreFailure value)? firestore,
    TResult Function(StorageFailure value)? storage,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(StateFailure value)? state,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (firestore != null) {
      return firestore(this);
    }
    return orElse();
  }
}

abstract class FirestoreFailure extends Failure {
  const factory FirestoreFailure({
    required final String message,
    final String? code,
  }) = _$FirestoreFailureImpl;
  const FirestoreFailure._() : super._();

  @override
  String get message;
  String? get code;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirestoreFailureImplCopyWith<_$FirestoreFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StorageFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$StorageFailureImplCopyWith(
    _$StorageFailureImpl value,
    $Res Function(_$StorageFailureImpl) then,
  ) = __$$StorageFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$StorageFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$StorageFailureImpl>
    implements _$$StorageFailureImplCopyWith<$Res> {
  __$$StorageFailureImplCopyWithImpl(
    _$StorageFailureImpl _value,
    $Res Function(_$StorageFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$StorageFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$StorageFailureImpl extends StorageFailure {
  const _$StorageFailureImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.storage(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageFailureImplCopyWith<_$StorageFailureImpl> get copyWith =>
      __$$StorageFailureImplCopyWithImpl<_$StorageFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) timeout,
    required TResult Function(String message) authentication,
    required TResult Function(String message) authorization,
    required TResult Function(String message, String? field) validation,
    required TResult Function(String message, String? code) firestore,
    required TResult Function(String message) storage,
    required TResult Function(String message) notFound,
    required TResult Function(String message) state,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) unknown,
  }) {
    return storage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? authentication,
    TResult? Function(String message)? authorization,
    TResult? Function(String message, String? field)? validation,
    TResult? Function(String message, String? code)? firestore,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? state,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? unknown,
  }) {
    return storage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? timeout,
    TResult Function(String message)? authentication,
    TResult Function(String message)? authorization,
    TResult Function(String message, String? field)? validation,
    TResult Function(String message, String? code)? firestore,
    TResult Function(String message)? storage,
    TResult Function(String message)? notFound,
    TResult Function(String message)? state,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (storage != null) {
      return storage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(TimeoutFailure value) timeout,
    required TResult Function(AuthenticationFailure value) authentication,
    required TResult Function(AuthorizationFailure value) authorization,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(FirestoreFailure value) firestore,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(StateFailure value) state,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return storage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(TimeoutFailure value)? timeout,
    TResult? Function(AuthenticationFailure value)? authentication,
    TResult? Function(AuthorizationFailure value)? authorization,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(FirestoreFailure value)? firestore,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(StateFailure value)? state,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return storage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(TimeoutFailure value)? timeout,
    TResult Function(AuthenticationFailure value)? authentication,
    TResult Function(AuthorizationFailure value)? authorization,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(FirestoreFailure value)? firestore,
    TResult Function(StorageFailure value)? storage,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(StateFailure value)? state,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (storage != null) {
      return storage(this);
    }
    return orElse();
  }
}

abstract class StorageFailure extends Failure {
  const factory StorageFailure({required final String message}) =
      _$StorageFailureImpl;
  const StorageFailure._() : super._();

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StorageFailureImplCopyWith<_$StorageFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NotFoundFailureImplCopyWith(
    _$NotFoundFailureImpl value,
    $Res Function(_$NotFoundFailureImpl) then,
  ) = __$$NotFoundFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotFoundFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NotFoundFailureImpl>
    implements _$$NotFoundFailureImplCopyWith<$Res> {
  __$$NotFoundFailureImplCopyWithImpl(
    _$NotFoundFailureImpl _value,
    $Res Function(_$NotFoundFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$NotFoundFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NotFoundFailureImpl extends NotFoundFailure {
  const _$NotFoundFailureImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.notFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundFailureImplCopyWith<_$NotFoundFailureImpl> get copyWith =>
      __$$NotFoundFailureImplCopyWithImpl<_$NotFoundFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) timeout,
    required TResult Function(String message) authentication,
    required TResult Function(String message) authorization,
    required TResult Function(String message, String? field) validation,
    required TResult Function(String message, String? code) firestore,
    required TResult Function(String message) storage,
    required TResult Function(String message) notFound,
    required TResult Function(String message) state,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) unknown,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? authentication,
    TResult? Function(String message)? authorization,
    TResult? Function(String message, String? field)? validation,
    TResult? Function(String message, String? code)? firestore,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? state,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? unknown,
  }) {
    return notFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? timeout,
    TResult Function(String message)? authentication,
    TResult Function(String message)? authorization,
    TResult Function(String message, String? field)? validation,
    TResult Function(String message, String? code)? firestore,
    TResult Function(String message)? storage,
    TResult Function(String message)? notFound,
    TResult Function(String message)? state,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(TimeoutFailure value) timeout,
    required TResult Function(AuthenticationFailure value) authentication,
    required TResult Function(AuthorizationFailure value) authorization,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(FirestoreFailure value) firestore,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(StateFailure value) state,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(TimeoutFailure value)? timeout,
    TResult? Function(AuthenticationFailure value)? authentication,
    TResult? Function(AuthorizationFailure value)? authorization,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(FirestoreFailure value)? firestore,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(StateFailure value)? state,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(TimeoutFailure value)? timeout,
    TResult Function(AuthenticationFailure value)? authentication,
    TResult Function(AuthorizationFailure value)? authorization,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(FirestoreFailure value)? firestore,
    TResult Function(StorageFailure value)? storage,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(StateFailure value)? state,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFoundFailure extends Failure {
  const factory NotFoundFailure({required final String message}) =
      _$NotFoundFailureImpl;
  const NotFoundFailure._() : super._();

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundFailureImplCopyWith<_$NotFoundFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StateFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$StateFailureImplCopyWith(
    _$StateFailureImpl value,
    $Res Function(_$StateFailureImpl) then,
  ) = __$$StateFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$StateFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$StateFailureImpl>
    implements _$$StateFailureImplCopyWith<$Res> {
  __$$StateFailureImplCopyWithImpl(
    _$StateFailureImpl _value,
    $Res Function(_$StateFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$StateFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$StateFailureImpl extends StateFailure {
  const _$StateFailureImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.state(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StateFailureImplCopyWith<_$StateFailureImpl> get copyWith =>
      __$$StateFailureImplCopyWithImpl<_$StateFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) timeout,
    required TResult Function(String message) authentication,
    required TResult Function(String message) authorization,
    required TResult Function(String message, String? field) validation,
    required TResult Function(String message, String? code) firestore,
    required TResult Function(String message) storage,
    required TResult Function(String message) notFound,
    required TResult Function(String message) state,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) unknown,
  }) {
    return state(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? authentication,
    TResult? Function(String message)? authorization,
    TResult? Function(String message, String? field)? validation,
    TResult? Function(String message, String? code)? firestore,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? state,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? unknown,
  }) {
    return state?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? timeout,
    TResult Function(String message)? authentication,
    TResult Function(String message)? authorization,
    TResult Function(String message, String? field)? validation,
    TResult Function(String message, String? code)? firestore,
    TResult Function(String message)? storage,
    TResult Function(String message)? notFound,
    TResult Function(String message)? state,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(TimeoutFailure value) timeout,
    required TResult Function(AuthenticationFailure value) authentication,
    required TResult Function(AuthorizationFailure value) authorization,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(FirestoreFailure value) firestore,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(StateFailure value) state,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(TimeoutFailure value)? timeout,
    TResult? Function(AuthenticationFailure value)? authentication,
    TResult? Function(AuthorizationFailure value)? authorization,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(FirestoreFailure value)? firestore,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(StateFailure value)? state,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(TimeoutFailure value)? timeout,
    TResult Function(AuthenticationFailure value)? authentication,
    TResult Function(AuthorizationFailure value)? authorization,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(FirestoreFailure value)? firestore,
    TResult Function(StorageFailure value)? storage,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(StateFailure value)? state,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class StateFailure extends Failure {
  const factory StateFailure({required final String message}) =
      _$StateFailureImpl;
  const StateFailure._() : super._();

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StateFailureImplCopyWith<_$StateFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelledFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$CancelledFailureImplCopyWith(
    _$CancelledFailureImpl value,
    $Res Function(_$CancelledFailureImpl) then,
  ) = __$$CancelledFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CancelledFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$CancelledFailureImpl>
    implements _$$CancelledFailureImplCopyWith<$Res> {
  __$$CancelledFailureImplCopyWithImpl(
    _$CancelledFailureImpl _value,
    $Res Function(_$CancelledFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$CancelledFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CancelledFailureImpl extends CancelledFailure {
  const _$CancelledFailureImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.cancelled(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelledFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelledFailureImplCopyWith<_$CancelledFailureImpl> get copyWith =>
      __$$CancelledFailureImplCopyWithImpl<_$CancelledFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) timeout,
    required TResult Function(String message) authentication,
    required TResult Function(String message) authorization,
    required TResult Function(String message, String? field) validation,
    required TResult Function(String message, String? code) firestore,
    required TResult Function(String message) storage,
    required TResult Function(String message) notFound,
    required TResult Function(String message) state,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) unknown,
  }) {
    return cancelled(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? authentication,
    TResult? Function(String message)? authorization,
    TResult? Function(String message, String? field)? validation,
    TResult? Function(String message, String? code)? firestore,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? state,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? unknown,
  }) {
    return cancelled?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? timeout,
    TResult Function(String message)? authentication,
    TResult Function(String message)? authorization,
    TResult Function(String message, String? field)? validation,
    TResult Function(String message, String? code)? firestore,
    TResult Function(String message)? storage,
    TResult Function(String message)? notFound,
    TResult Function(String message)? state,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(TimeoutFailure value) timeout,
    required TResult Function(AuthenticationFailure value) authentication,
    required TResult Function(AuthorizationFailure value) authorization,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(FirestoreFailure value) firestore,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(StateFailure value) state,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return cancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(TimeoutFailure value)? timeout,
    TResult? Function(AuthenticationFailure value)? authentication,
    TResult? Function(AuthorizationFailure value)? authorization,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(FirestoreFailure value)? firestore,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(StateFailure value)? state,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return cancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(TimeoutFailure value)? timeout,
    TResult Function(AuthenticationFailure value)? authentication,
    TResult Function(AuthorizationFailure value)? authorization,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(FirestoreFailure value)? firestore,
    TResult Function(StorageFailure value)? storage,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(StateFailure value)? state,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled(this);
    }
    return orElse();
  }
}

abstract class CancelledFailure extends Failure {
  const factory CancelledFailure({required final String message}) =
      _$CancelledFailureImpl;
  const CancelledFailure._() : super._();

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelledFailureImplCopyWith<_$CancelledFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$UnknownFailureImplCopyWith(
    _$UnknownFailureImpl value,
    $Res Function(_$UnknownFailureImpl) then,
  ) = __$$UnknownFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnknownFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnknownFailureImpl>
    implements _$$UnknownFailureImplCopyWith<$Res> {
  __$$UnknownFailureImplCopyWithImpl(
    _$UnknownFailureImpl _value,
    $Res Function(_$UnknownFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$UnknownFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$UnknownFailureImpl extends UnknownFailure {
  const _$UnknownFailureImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.unknown(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      __$$UnknownFailureImplCopyWithImpl<_$UnknownFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) network,
    required TResult Function(String message) timeout,
    required TResult Function(String message) authentication,
    required TResult Function(String message) authorization,
    required TResult Function(String message, String? field) validation,
    required TResult Function(String message, String? code) firestore,
    required TResult Function(String message) storage,
    required TResult Function(String message) notFound,
    required TResult Function(String message) state,
    required TResult Function(String message) cancelled,
    required TResult Function(String message) unknown,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? network,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? authentication,
    TResult? Function(String message)? authorization,
    TResult? Function(String message, String? field)? validation,
    TResult? Function(String message, String? code)? firestore,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? state,
    TResult? Function(String message)? cancelled,
    TResult? Function(String message)? unknown,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? network,
    TResult Function(String message)? timeout,
    TResult Function(String message)? authentication,
    TResult Function(String message)? authorization,
    TResult Function(String message, String? field)? validation,
    TResult Function(String message, String? code)? firestore,
    TResult Function(String message)? storage,
    TResult Function(String message)? notFound,
    TResult Function(String message)? state,
    TResult Function(String message)? cancelled,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetworkFailure value) network,
    required TResult Function(TimeoutFailure value) timeout,
    required TResult Function(AuthenticationFailure value) authentication,
    required TResult Function(AuthorizationFailure value) authorization,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(FirestoreFailure value) firestore,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(NotFoundFailure value) notFound,
    required TResult Function(StateFailure value) state,
    required TResult Function(CancelledFailure value) cancelled,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(TimeoutFailure value)? timeout,
    TResult? Function(AuthenticationFailure value)? authentication,
    TResult? Function(AuthorizationFailure value)? authorization,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(FirestoreFailure value)? firestore,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(NotFoundFailure value)? notFound,
    TResult? Function(StateFailure value)? state,
    TResult? Function(CancelledFailure value)? cancelled,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetworkFailure value)? network,
    TResult Function(TimeoutFailure value)? timeout,
    TResult Function(AuthenticationFailure value)? authentication,
    TResult Function(AuthorizationFailure value)? authorization,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(FirestoreFailure value)? firestore,
    TResult Function(StorageFailure value)? storage,
    TResult Function(NotFoundFailure value)? notFound,
    TResult Function(StateFailure value)? state,
    TResult Function(CancelledFailure value)? cancelled,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownFailure extends Failure {
  const factory UnknownFailure({required final String message}) =
      _$UnknownFailureImpl;
  const UnknownFailure._() : super._();

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
