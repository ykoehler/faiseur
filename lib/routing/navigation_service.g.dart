// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides navigation service for imperative navigation.

@ProviderFor(navigationService)
const navigationServiceProvider = NavigationServiceProvider._();

/// Provides navigation service for imperative navigation.

final class NavigationServiceProvider
    extends $FunctionalProvider<NavigationService, NavigationService, NavigationService>
    with $Provider<NavigationService> {
  /// Provides navigation service for imperative navigation.
  const NavigationServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'navigationServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$navigationServiceHash();

  @$internal
  @override
  $ProviderElement<NavigationService> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  NavigationService create(Ref ref) {
    return navigationService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NavigationService value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<NavigationService>(value));
  }
}

String _$navigationServiceHash() => r'ca94d380e0a0dd33b0e6f34727a6d15b3474952e';
