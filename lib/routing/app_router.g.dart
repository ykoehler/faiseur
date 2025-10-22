// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider that creates a ChangeNotifier for GoRouter's refreshListenable
/// This notifier will trigger GoRouter to re-evaluate redirects when auth state changes

@ProviderFor(authStateNotifier)
const authStateProvider = AuthStateNotifierProvider._();

/// Provider that creates a ChangeNotifier for GoRouter's refreshListenable
/// This notifier will trigger GoRouter to re-evaluate redirects when auth state changes

final class AuthStateNotifierProvider
    extends
        $FunctionalProvider<
          Raw<AsyncValueNotifier<bool?>>,
          Raw<AsyncValueNotifier<bool?>>,
          Raw<AsyncValueNotifier<bool?>>
        >
    with $Provider<Raw<AsyncValueNotifier<bool?>>> {
  /// Provider that creates a ChangeNotifier for GoRouter's refreshListenable
  /// This notifier will trigger GoRouter to re-evaluate redirects when auth state changes
  const AuthStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authStateNotifierHash();

  @$internal
  @override
  $ProviderElement<Raw<AsyncValueNotifier<bool?>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Raw<AsyncValueNotifier<bool?>> create(Ref ref) {
    return authStateNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<AsyncValueNotifier<bool?>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<AsyncValueNotifier<bool?>>>(
        value,
      ),
    );
  }
}

String _$authStateNotifierHash() => r'64085f5b3f5dbeb601307834751413b7abe74f09';

@ProviderFor(goRouter)
const goRouterProvider = GoRouterProvider._();

final class GoRouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  const GoRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'goRouterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$goRouterHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return goRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$goRouterHash() => r'0926ce4e72d95bf89ccf814cd505c194447a7648';
