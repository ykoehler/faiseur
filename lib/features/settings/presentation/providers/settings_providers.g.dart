// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the SettingsRepository singleton instance

@ProviderFor(settingsRepository)
const settingsRepositoryProvider = SettingsRepositoryProvider._();

/// Provider for the SettingsRepository singleton instance

final class SettingsRepositoryProvider
    extends $FunctionalProvider<SettingsRepository, SettingsRepository, SettingsRepository>
    with $Provider<SettingsRepository> {
  /// Provider for the SettingsRepository singleton instance
  const SettingsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsRepositoryHash();

  @$internal
  @override
  $ProviderElement<SettingsRepository> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  SettingsRepository create(Ref ref) {
    return settingsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsRepository value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<SettingsRepository>(value));
  }
}

String _$settingsRepositoryHash() => r'a0927ba6d2b7845492260ea4abbe7787b58544d1';

/// Provides a stream of the current user's settings.
///
/// Automatically watches the current authenticated user's settings
/// and updates in real-time as they change.

@ProviderFor(userSettings)
const userSettingsProvider = UserSettingsProvider._();

/// Provides a stream of the current user's settings.
///
/// Automatically watches the current authenticated user's settings
/// and updates in real-time as they change.

final class UserSettingsProvider
    extends $FunctionalProvider<AsyncValue<UserSettings>, UserSettings, Stream<UserSettings>>
    with $FutureModifier<UserSettings>, $StreamProvider<UserSettings> {
  /// Provides a stream of the current user's settings.
  ///
  /// Automatically watches the current authenticated user's settings
  /// and updates in real-time as they change.
  const UserSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userSettingsHash();

  @$internal
  @override
  $StreamProviderElement<UserSettings> $createElement($ProviderPointer pointer) => $StreamProviderElement(pointer);

  @override
  Stream<UserSettings> create(Ref ref) {
    return userSettings(ref);
  }
}

String _$userSettingsHash() => r'5c30e8ab146c827918b8c9b897ffc50d6f214cea';

/// Provides async version of current user settings for one-time fetches.
///
/// Use this when you need to fetch settings once without streaming.

@ProviderFor(userSettingsAsync)
const userSettingsAsyncProvider = UserSettingsAsyncProvider._();

/// Provides async version of current user settings for one-time fetches.
///
/// Use this when you need to fetch settings once without streaming.

final class UserSettingsAsyncProvider
    extends $FunctionalProvider<AsyncValue<UserSettings>, UserSettings, FutureOr<UserSettings>>
    with $FutureModifier<UserSettings>, $FutureProvider<UserSettings> {
  /// Provides async version of current user settings for one-time fetches.
  ///
  /// Use this when you need to fetch settings once without streaming.
  const UserSettingsAsyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userSettingsAsyncProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userSettingsAsyncHash();

  @$internal
  @override
  $FutureProviderElement<UserSettings> $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<UserSettings> create(Ref ref) {
    return userSettingsAsync(ref);
  }
}

String _$userSettingsAsyncHash() => r'a30032754c9c58e27ad71d368451101428184e10';

/// Notifier for managing settings state and operations.
///
/// Provides methods for updating settings and handles state transitions.

@ProviderFor(SettingsNotifier)
const settingsProvider = SettingsNotifierProvider._();

/// Notifier for managing settings state and operations.
///
/// Provides methods for updating settings and handles state transitions.
final class SettingsNotifierProvider extends $NotifierProvider<SettingsNotifier, void> {
  /// Notifier for managing settings state and operations.
  ///
  /// Provides methods for updating settings and handles state transitions.
  const SettingsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsNotifierHash();

  @$internal
  @override
  SettingsNotifier create() => SettingsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<void>(value));
  }
}

String _$settingsNotifierHash() => r'090692201ef6565d133dadaf722232ba3fa1f13a';

/// Notifier for managing settings state and operations.
///
/// Provides methods for updating settings and handles state transitions.

abstract class _$SettingsNotifier extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element = ref.element as $ClassProviderElement<AnyNotifier<void, void>, void, Object?, Object?>;
    element.handleValue(ref, null);
  }
}
