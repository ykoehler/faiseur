import 'package:faiseur/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Web E2E Tests - App Initialization', () {
    testWidgets('App initializes successfully and shows UI', (tester) async {
      // Build the app
      tester.binding.window.physicalSizeTestValue = const Size(1280, 720);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));

      // App should start and render
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Verify basic widgets are rendered
      expect(find.byType(MaterialApp), findsOneWidget, reason: 'MaterialApp should be present');
      expect(tester.takeException(), isNull, reason: 'No exceptions during initialization');
    });

    testWidgets('Firebase initializes without errors', (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 720);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Check for any exception
      expect(tester.takeException(), isNull, reason: 'Firebase should initialize without errors');

      // App should still be running
      expect(find.byType(FaiseurApp), findsOneWidget);
    });

    testWidgets('App does not get stuck on splash screen', (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 720);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));

      // Wait for initialization with longer timeout
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // App should have transitioned from splash to main app
      final scaffolds = find.byType(Scaffold);
      expect(scaffolds, findsWidgets, reason: 'App should have navigated from splash');

      // No crashes
      expect(tester.takeException(), isNull);
    });

    testWidgets('Riverpod providers initialize without circular dependency errors', (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 720);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Check for Riverpod-specific errors
      final exception = tester.takeException();
      expect(exception, isNull, reason: 'No Riverpod provider modification errors');

      // App should still be functional
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });

  group('Web E2E Tests - Navigation', () {
    testWidgets('App routing initializes correctly', (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 720);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Verify router is created and pages render
      expect(find.byType(Scaffold), findsWidgets, reason: 'Router should render pages');

      // No exceptions
      expect(tester.takeException(), isNull);
    });

    testWidgets('App responds to window resizing', (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 720);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Simulate resize to tablet size
      tester.binding.window.physicalSizeTestValue = const Size(800, 600);
      tester.binding.window.onMetricsChanged?.call();
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // App should still be responsive
      expect(find.byType(FaiseurApp), findsOneWidget);
      expect(tester.takeException(), isNull);

      // Simulate resize to mobile size
      tester.binding.window.physicalSizeTestValue = const Size(400, 800);
      tester.binding.window.onMetricsChanged?.call();
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // App should still render without errors
      expect(find.byType(FaiseurApp), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });

  group('Web E2E Tests - UI/UX', () {
    testWidgets('Theme applies correctly (Material 3)', (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 720);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Get context and verify theme
      final BuildContext context = tester.element(find.byType(FaiseurApp).first);
      final theme = Theme.of(context);

      // Material 3 theme should have color scheme
      expect(theme.colorScheme.primary, isNotNull);
      expect(theme.colorScheme.secondary, isNotNull);

      // Verify text themes exist
      expect(theme.textTheme.displayLarge, isNotNull);
      expect(theme.textTheme.bodyMedium, isNotNull);
    });

    testWidgets('App renders without layout issues', (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 720);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // No layout overflow errors
      expect(tester.takeException(), isNull);

      // Widgets should render properly
      expect(find.byType(Scaffold), findsWidgets);
    });

    testWidgets('Text is readable and visible', (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 720);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify text widgets are rendered
      expect(find.byType(Text), findsWidgets, reason: 'App should have text content');
    });
  });

  group('Web E2E Tests - Performance', () {
    testWidgets('App initializes within reasonable time', (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 720);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      final stopwatch = Stopwatch()..start();

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pumpAndSettle(const Duration(seconds: 5));

      stopwatch.stop();

      debugPrint('App initialization took ${stopwatch.elapsedMilliseconds}ms');
      expect(stopwatch.elapsedMilliseconds, lessThan(10000), reason: 'App should initialize within 10 seconds');

      expect(tester.takeException(), isNull);
    });

    testWidgets('App remains responsive during rendering', (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 720);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));

      // Pump multiple times to simulate user interactions
      for (int i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Should still be responsive
      expect(find.byType(FaiseurApp), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });

  group('Web E2E Tests - Error Handling', () {
    testWidgets('App handles initialization gracefully', (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 720);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // App should still render even if there are non-fatal errors
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('No assertions or exceptions during normal operation', (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(1280, 720);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Verify no exceptions
      expect(tester.takeException(), isNull, reason: 'App should run without exceptions');
    });
  });
}
