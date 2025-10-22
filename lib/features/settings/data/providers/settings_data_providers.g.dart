// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for Firestore instance singleton.

@ProviderFor(firebaseFirestore)
const firebaseFirestoreProvider = FirebaseFirestoreProvider._();

/// Provider for Firestore instance singleton.

final class FirebaseFirestoreProvider
    extends
        $FunctionalProvider<
          FirebaseFirestore,
          FirebaseFirestore,
          FirebaseFirestore
        >
    with $Provider<FirebaseFirestore> {
  /// Provider for Firestore instance singleton.
  const FirebaseFirestoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firebaseFirestoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firebaseFirestoreHash();

  @$internal
  @override
  $ProviderElement<FirebaseFirestore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FirebaseFirestore create(Ref ref) {
    return firebaseFirestore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirebaseFirestore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirebaseFirestore>(value),
    );
  }
}

String _$firebaseFirestoreHash() => r'eca974fdc891fcd3f9586742678f47582b20adec';

/// Provider for settings remote datasource.

@ProviderFor(settingsRemoteDatasource)
const settingsRemoteDatasourceProvider = SettingsRemoteDatasourceProvider._();

/// Provider for settings remote datasource.

final class SettingsRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          SettingsRemoteDatasource,
          SettingsRemoteDatasource,
          SettingsRemoteDatasource
        >
    with $Provider<SettingsRemoteDatasource> {
  /// Provider for settings remote datasource.
  const SettingsRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<SettingsRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SettingsRemoteDatasource create(Ref ref) {
    return settingsRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsRemoteDatasource>(value),
    );
  }
}

String _$settingsRemoteDatasourceHash() =>
    r'8ef51fff8269f7a9bc404e753af8f9c045bc6d18';
