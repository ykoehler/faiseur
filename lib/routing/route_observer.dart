import 'package:flutter/material.dart';

/// Observer for route navigation events.
///
/// Logs all route transitions for debugging and analytics purposes.
/// Can be extended to track analytics, log navigation, or record user journeys.
class AppRouteObserver extends NavigatorObserver {
  /// Creates a route observer.
  AppRouteObserver({this.onRouteChange});

  /// Callback when route changes
  /// Called with (previousRoute, currentRoute)
  final void Function(Route<Object?>?, Route<Object?>?)? onRouteChange;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _logNavigation('PUSH', previousRoute, route);
    onRouteChange?.call(previousRoute, route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _logNavigation('POP', route, previousRoute);
    onRouteChange?.call(route, previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    _logNavigation('REMOVE', route, previousRoute);
    onRouteChange?.call(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _logNavigation('REPLACE', oldRoute, newRoute);
    onRouteChange?.call(oldRoute, newRoute);
  }

  /// Log navigation events
  void _logNavigation(
    String action,
    Route<dynamic>? fromRoute,
    Route<dynamic>? toRoute,
  ) {
    final fromName = _getRouteName(fromRoute);
    final toName = _getRouteName(toRoute);

    // ignore: avoid_print
    print('🧭 Navigation: $action | $fromName → $toName');
  }

  /// Extract route name for logging
  String _getRouteName(Route<dynamic>? route) {
    if (route == null) {
      return 'null';
    }
    if (route.settings.name?.isNotEmpty ?? false) {
      return route.settings.name!;
    }
    return route.runtimeType.toString();
  }
}
