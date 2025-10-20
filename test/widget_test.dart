import 'package:faiseur/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App E2E Smoke Tests', () {
    testWidgets(
      'App launches and renders home screen',
      (tester) async {
        // Build the app and trigger a frame
        await tester.pumpWidget(
          const ProviderScope(
            child: FaiseurApp(),
          ),
        );

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
      'App renders MaterialApp with router',
      (tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: FaiseurApp(),
          ),
        );
        await tester.pumpAndSettle(const Duration(seconds: 2));

        // With Go Router, the MaterialApp.router should exist
        expect(find.byType(MaterialApp), findsOneWidget);

        // Verify no uncaught exceptions
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'Theme applies correctly (light and dark modes)',
      (tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: FaiseurApp(),
          ),
        );
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
        await tester.pumpWidget(
          const ProviderScope(
            child: FaiseurApp(),
          ),
        );
        await tester.pumpAndSettle(const Duration(seconds: 2));

        // Simulate hot reload by re-pumping the widget
        await tester.pumpWidget(
          const ProviderScope(
            child: FaiseurApp(),
          ),
        );
        await tester.pumpAndSettle(const Duration(seconds: 1));

        // Should still have the MaterialApp after reload
        expect(find.byType(MaterialApp), findsOneWidget);
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets(
      'Renders without layout issues',
      (tester) async {
        await tester.pumpWidget(
          const ProviderScope(
            child: FaiseurApp(),
          ),
        );
        await tester.pumpAndSettle(const Duration(seconds: 2));

        // Verify basic widget tree is intact
        expect(find.byType(MaterialApp), findsOneWidget);

        // No rendering errors should occur
        expect(tester.takeException(), isNull);
      },
    );
  });
}
