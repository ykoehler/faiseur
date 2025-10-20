// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the GoRouter instance for the entire app.
///
/// Watches authentication state and app initialization to manage redirects.
/// This provider should be accessed via `ref.watch(goRouterProvider)` in
/// `MaterialApp.router(routerConfig: ...)`.

@ProviderFor(goRouter)
const goRouterProvider = GoRouterProvider._();

/// Provides the GoRouter instance for the entire app.
///
/// Watches authentication state and app initialization to manage redirects.
/// This provider should be accessed via `ref.watch(goRouterProvider)` in
/// `MaterialApp.router(routerConfig: ...)`.

final class GoRouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// Provides the GoRouter instance for the entire app.
  ///
  /// Watches authentication state and app initialization to manage redirects.
  /// This provider should be accessed via `ref.watch(goRouterProvider)` in
  /// `MaterialApp.router(routerConfig: ...)`.
  const GoRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'goRouterProvider',
        isAutoDispose: true,
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

String _$goRouterHash() => r'a1fcbff2014dd4932df5f0636384aa1a1539d517';
