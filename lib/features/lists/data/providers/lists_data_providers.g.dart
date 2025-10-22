// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_data_providers.dart';

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

/// Provider for ListsRemoteDatasource

@ProviderFor(listsRemoteDatasource)
const listsRemoteDatasourceProvider = ListsRemoteDatasourceProvider._();

/// Provider for ListsRemoteDatasource

final class ListsRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          ListsRemoteDatasource,
          ListsRemoteDatasource,
          ListsRemoteDatasource
        >
    with $Provider<ListsRemoteDatasource> {
  /// Provider for ListsRemoteDatasource
  const ListsRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listsRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listsRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<ListsRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ListsRemoteDatasource create(Ref ref) {
    return listsRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListsRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ListsRemoteDatasource>(value),
    );
  }
}

String _$listsRemoteDatasourceHash() =>
    r'd53d84c00649bc482da46e3d14ea37f8d36cb033';
