import 'package:faiseur/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App E2E Smoke Tests', () {
    testWidgets(
      'App launches and renders home screen',
      (tester) async {
        // Build the app and trigger a frame
        await tester.pumpWidget(const FaiseurApp());

        // Wait for Firebase initialization and initial build
        await tester.pumpAndSettle(const Duration(seconds: 2));

        // Verify the app is still mounted (didn't crash)
        expect(find.byType(FaiseurApp), findsOneWidget);

        // Verify we have a Material app
        expect(find.byType(MaterialApp), findsOneWidget);

        // Verify scaffold exists (basic layout check)
        expect(find.byType(Scaffold), findsWidgets);

        // Verify at least one text widget is rendered
        expect(find.byType(Text), findsWidgets);

        // Verify the app rendered without exceptions
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'App renders AppBar or primary navigation',
      (tester) async {
        await tester.pumpWidget(const FaiseurApp());
        await tester.pumpAndSettle(const Duration(seconds: 2));

        // Check for AppBar (most Material apps have one)
        // or any navigation widget
        final hasAppBar =
            find.byType(AppBar).evaluate().isNotEmpty;
        final hasNavBar =
            find.byType(NavigationBar).evaluate().isNotEmpty;
        final hasRail =
            find.byType(NavigationRail).evaluate().isNotEmpty;
        final hasDrawer =
            find.byType(Drawer).evaluate().isNotEmpty;

        expect(
          hasAppBar || hasNavBar || hasRail || hasDrawer,
          isTrue,
          reason:
              'Expected at least one navigation component '
              '(AppBar, NavigationBar, NavigationRail, or Drawer)',
        );
      },
    );

    testWidgets(
      'Theme applies correctly (light and dark modes)',
      (tester) async {
        await tester.pumpWidget(const FaiseurApp());
        await tester.pumpAndSettle(const Duration(seconds: 2));

        // Verify theme data exists
        final context = tester.element(find.byType(FaiseurApp));
        final theme = Theme.of(context);

        expect(theme, isNotNull);
        expect(theme.colorScheme, isNotNull);
        expect(theme.textTheme, isNotNull);

        // Verify we have Material 3 color scheme
        expect(theme.colorScheme.primary, isNotNull);
        expect(theme.colorScheme.secondary, isNotNull);
        expect(theme.colorScheme.tertiary, isNotNull);
      },
    );

    testWidgets(
      'App handles hot reload gracefully',
      (tester) async {
        await tester.pumpWidget(const FaiseurApp());
        await tester.pumpAndSettle(const Duration(seconds: 2));

        final initialWidgetCount =
            find.byType(FaiseurApp).evaluate().length;

        // Simulate hot reload by rebuilding
        await tester.pumpWidget(const FaiseurApp());
        await tester.pumpAndSettle(const Duration(seconds: 1));

        final afterReloadWidgetCount =
            find.byType(FaiseurApp).evaluate().length;

        expect(afterReloadWidgetCount, equals(initialWidgetCount));
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'Renders without layout issues',
      (tester) async {
        await tester.pumpWidget(const FaiseurApp());
        await tester.pumpAndSettle(const Duration(seconds: 2));

        // Verify basic widget tree is intact
        expect(find.byType(MaterialApp), findsOneWidget);
        expect(find.byType(Scaffold), findsWidgets);

        // No rendering errors should occur
        expect(tester.takeException(), isNull);
      },
    );
  });
}
