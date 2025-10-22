// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for FirestoreDatasourceImpl singleton

@ProviderFor(firestoreDatasource)
const firestoreDatasourceProvider = FirestoreDatasourceProvider._();

/// Provider for FirestoreDatasourceImpl singleton

final class FirestoreDatasourceProvider
    extends
        $FunctionalProvider<
          FirestoreDatasourceImpl,
          FirestoreDatasourceImpl,
          FirestoreDatasourceImpl
        >
    with $Provider<FirestoreDatasourceImpl> {
  /// Provider for FirestoreDatasourceImpl singleton
  const FirestoreDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firestoreDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firestoreDatasourceHash();

  @$internal
  @override
  $ProviderElement<FirestoreDatasourceImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FirestoreDatasourceImpl create(Ref ref) {
    return firestoreDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirestoreDatasourceImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirestoreDatasourceImpl>(value),
    );
  }
}

String _$firestoreDatasourceHash() =>
    r'787cf354020d618f5987c09ed3c32e26d7b13f95';

/// Provider for TodosRemoteDatasource

@ProviderFor(todosRemoteDatasource)
const todosRemoteDatasourceProvider = TodosRemoteDatasourceProvider._();

/// Provider for TodosRemoteDatasource

final class TodosRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          TodosRemoteDatasource,
          TodosRemoteDatasource,
          TodosRemoteDatasource
        >
    with $Provider<TodosRemoteDatasource> {
  /// Provider for TodosRemoteDatasource
  const TodosRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todosRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todosRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<TodosRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TodosRemoteDatasource create(Ref ref) {
    return todosRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TodosRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TodosRemoteDatasource>(value),
    );
  }
}

String _$todosRemoteDatasourceHash() =>
    r'27cedb7879440832e0688744f791917e5d6ca86e';
