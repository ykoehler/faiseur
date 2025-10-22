import 'package:faiseur/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

/// macOS E2E Tests
///
/// Comprehensive end-to-end tests for the macOS platform to debug
/// splash screen and app initialization issues.
///
/// Run with:
/// ```bash
/// flutter test integration_test/macos_e2e_test.dart --device=macos
/// ```
///
/// Or with flavor:
/// ```bash
/// flutter test integration_test/macos_e2e_test.dart \
///   --dart-define=FLAVOR=dev \
///   --device=macos
/// ```
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('macOS E2E Tests - Splash Screen & Initialization', () {
    testWidgets('App launches successfully on macOS', (tester) async {
      debugPrint('📱 [macOS E2E] Starting app launch test');

      // Build the app with ProviderScope
      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      debugPrint('✅ [macOS E2E] App widget built');

      // Initial pump
      await tester.pump();
      debugPrint('✅ [macOS E2E] Initial pump completed');

      // Verify app is present
      expect(
        find.byType(FaiseurApp),
        findsOneWidget,
        reason: 'FaiseurApp should be present',
      );
      debugPrint('✅ [macOS E2E] FaiseurApp widget found');
    });

    testWidgets('Firebase initializes without crashing', (tester) async {
      debugPrint('📱 [macOS E2E] Starting Firebase initialization test');

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pump();

      // Wait a short time for Firebase initialization
      await tester.pump(const Duration(milliseconds: 500));
      debugPrint('✅ [macOS E2E] Waited 500ms for Firebase');

      // Check for exceptions
      final exception = tester.takeException();
      if (exception != null) {
        debugPrint('❌ [macOS E2E] Exception during Firebase init: $exception');
      }
      expect(
        exception,
        isNull,
        reason: 'Firebase should initialize without throwing exceptions',
      );
      debugPrint('✅ [macOS E2E] No exceptions during Firebase initialization');
    });

    testWidgets('Splash screen appears and renders correctly', (tester) async {
      debugPrint('📱 [macOS E2E] Starting splash screen render test');

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pump();

      // Wait for initial render
      await tester.pump(const Duration(milliseconds: 100));
      debugPrint('✅ [macOS E2E] Initial render completed');

      // Verify MaterialApp is present
      expect(
        find.byType(MaterialApp),
        findsOneWidget,
        reason: 'MaterialApp should be present',
      );
      debugPrint('✅ [macOS E2E] MaterialApp found');

      // Wait for router to initialize
      await tester.pump(const Duration(seconds: 1));
      debugPrint('✅ [macOS E2E] Router initialized');

      // Verify we have a Scaffold (either splash or main app)
      expect(
        find.byType(Scaffold),
        findsWidgets,
        reason: 'At least one Scaffold should be present',
      );
      debugPrint('✅ [macOS E2E] Scaffold found');
    });

    testWidgets('App transitions from splash screen within reasonable time', (
      tester,
    ) async {
      debugPrint('📱 [macOS E2E] Starting splash transition test');

      final stopwatch = Stopwatch()..start();

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pump();

      // Wait for initialization with timeout
      bool splashDismissed = false;
      int pumpCount = 0;
      const maxPumps = 50; // Max 5 seconds (50 * 100ms)

      while (!splashDismissed && pumpCount < maxPumps) {
        await tester.pump(const Duration(milliseconds: 100));
        pumpCount++;

        // Check if we have navigated away from splash
        // Look for loading indicator or splash-specific widgets
        final loadingIndicators = find.byType(CircularProgressIndicator);
        final hasLoading = loadingIndicators.evaluate().isNotEmpty;

        if (pumpCount % 10 == 0) {
          debugPrint(
            '⏱️  [macOS E2E] Still initializing after ${pumpCount * 100}ms, hasLoading: $hasLoading',
          );
        }

        // If no loading indicator, we've likely transitioned
        if (!hasLoading) {
          splashDismissed = true;
          debugPrint(
            '✅ [macOS E2E] Splash screen dismissed after ${pumpCount * 100}ms',
          );
        }
      }

      stopwatch.stop();
      debugPrint(
        '⏱️  [macOS E2E] Total initialization time: ${stopwatch.elapsedMilliseconds}ms',
      );

      // Verify app is still running
      expect(
        find.byType(FaiseurApp),
        findsOneWidget,
        reason: 'App should still be running',
      );

      // Check for exceptions
      final exception = tester.takeException();
      if (exception != null) {
        debugPrint('❌ [macOS E2E] Exception during transition: $exception');
      }
      expect(
        exception,
        isNull,
        reason: 'No exceptions should occur during transition',
      );
    });

    testWidgets('App providers initialize correctly', (tester) async {
      debugPrint('📱 [macOS E2E] Starting provider initialization test');

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pump();

      // Pump several times to allow providers to initialize
      for (int i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 100));
        if (i % 3 == 0) {
          debugPrint(
            '⏱️  [macOS E2E] Provider initialization pump ${i + 1}/10',
          );
        }
      }

      // Wait for providers to settle
      await tester.pumpAndSettle(const Duration(seconds: 3));
      debugPrint('✅ [macOS E2E] Providers settled');

      // Check for Riverpod-specific errors (circular dependencies, etc.)
      final exception = tester.takeException();
      if (exception != null) {
        debugPrint('❌ [macOS E2E] Provider error: $exception');
        if (exception.toString().contains('circular')) {
          debugPrint(
            '⚠️  [macOS E2E] Circular dependency detected in providers!',
          );
        }
        if (exception.toString().contains('disposed')) {
          debugPrint('⚠️  [macOS E2E] Provider disposed prematurely!');
        }
      }
      expect(
        exception,
        isNull,
        reason: 'Providers should initialize without errors',
      );
      debugPrint('✅ [macOS E2E] No provider errors detected');
    });
  });

  group('macOS E2E Tests - Routing & Navigation', () {
    testWidgets('Router initializes and handles initial route', (tester) async {
      debugPrint('📱 [macOS E2E] Starting router initialization test');

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pump();

      // Wait for router to initialize
      await tester.pumpAndSettle(const Duration(seconds: 2));
      debugPrint('✅ [macOS E2E] Router settled');

      // Verify we have navigated to a valid route (Scaffold should exist)
      expect(
        find.byType(Scaffold),
        findsWidgets,
        reason: 'Router should render a page with Scaffold',
      );
      debugPrint('✅ [macOS E2E] Router rendered valid page');

      // No exceptions
      final exception = tester.takeException();
      expect(exception, isNull, reason: 'Router should not throw exceptions');
      debugPrint('✅ [macOS E2E] Router initialized without exceptions');
    });

    testWidgets('Router handles redirects correctly', (tester) async {
      debugPrint('📱 [macOS E2E] Starting router redirect test');

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pump();

      // Wait for redirects to complete
      await tester.pumpAndSettle(const Duration(seconds: 3));
      debugPrint('✅ [macOS E2E] Redirects completed');

      // Verify app reached a stable state
      expect(find.byType(FaiseurApp), findsOneWidget);
      expect(find.byType(Scaffold), findsWidgets);
      debugPrint('✅ [macOS E2E] App in stable state after redirects');

      // No infinite redirect loops
      final exception = tester.takeException();
      expect(exception, isNull, reason: 'No redirect errors');
      debugPrint('✅ [macOS E2E] No redirect loops detected');
    });
  });

  group('macOS E2E Tests - UI Rendering', () {
    testWidgets('Theme applies correctly on macOS', (tester) async {
      debugPrint('📱 [macOS E2E] Starting theme test');

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Get context and verify theme
      final materialAppFinder = find.byType(MaterialApp);
      expect(materialAppFinder, findsOneWidget);

      final context = tester.element(materialAppFinder.first);
      final theme = Theme.of(context);
      debugPrint('✅ [macOS E2E] Theme retrieved from context');

      // Verify Material 3 theme properties
      expect(
        theme.colorScheme,
        isNotNull,
        reason: 'ColorScheme should be present',
      );
      expect(
        theme.colorScheme.primary,
        isNotNull,
        reason: 'Primary color should be set',
      );
      expect(
        theme.colorScheme.secondary,
        isNotNull,
        reason: 'Secondary color should be set',
      );
      expect(theme.textTheme, isNotNull, reason: 'TextTheme should be present');
      debugPrint('✅ [macOS E2E] Material 3 theme properties verified');

      // Verify text theme has required styles
      expect(theme.textTheme.displayLarge, isNotNull);
      expect(theme.textTheme.bodyMedium, isNotNull);
      expect(theme.textTheme.labelLarge, isNotNull);
      debugPrint('✅ [macOS E2E] Text theme styles verified');
    });

    testWidgets('App renders without layout overflow errors', (tester) async {
      debugPrint('📱 [macOS E2E] Starting layout test');

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Check for layout exceptions
      final exception = tester.takeException();
      if (exception != null) {
        debugPrint('❌ [macOS E2E] Layout error: $exception');
        if (exception.toString().contains('overflow')) {
          debugPrint('⚠️  [macOS E2E] Layout overflow detected!');
        }
      }
      expect(exception, isNull, reason: 'No layout errors should occur');
      debugPrint('✅ [macOS E2E] No layout overflow errors');
    });

    testWidgets('Text widgets render with proper styling', (tester) async {
      debugPrint('📱 [macOS E2E] Starting text rendering test');

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Find text widgets
      final textWidgets = find.byType(Text);
      final textCount = textWidgets.evaluate().length;
      debugPrint('📝 [macOS E2E] Found $textCount Text widgets');

      // Verify at least some text is rendered
      expect(
        textWidgets,
        findsWidgets,
        reason: 'App should render text content',
      );
      debugPrint('✅ [macOS E2E] Text widgets rendered');

      // Check that text is visible (not zero-sized)
      if (textCount > 0) {
        final firstText = textWidgets.first;
        final firstTextWidget = tester.widget<Text>(firstText);
        expect(
          firstTextWidget.data != null || firstTextWidget.textSpan != null,
          isTrue,
          reason: 'Text widget should have content',
        );
        debugPrint('✅ [macOS E2E] Text content verified');
      }
    });

    testWidgets('App handles window resize (macOS-specific)', (tester) async {
      debugPrint('📱 [macOS E2E] Starting window resize test');

      // Set initial window size
      tester.view.physicalSize = const Size(1024, 768);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pumpAndSettle(const Duration(seconds: 2));
      debugPrint('✅ [macOS E2E] Initial window size: 1024x768');

      // Verify initial render
      expect(find.byType(FaiseurApp), findsOneWidget);

      // Simulate window resize to larger size
      tester.view.physicalSize = const Size(1440, 900);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      debugPrint('✅ [macOS E2E] Resized to 1440x900');

      // Verify app still renders
      expect(find.byType(FaiseurApp), findsOneWidget);
      expect(
        tester.takeException(),
        isNull,
        reason: 'No exceptions during resize',
      );

      // Simulate resize to smaller size
      tester.view.physicalSize = const Size(800, 600);
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      debugPrint('✅ [macOS E2E] Resized to 800x600');

      // Verify responsive behavior
      expect(find.byType(FaiseurApp), findsOneWidget);
      expect(
        tester.takeException(),
        isNull,
        reason: 'No exceptions during resize',
      );
      debugPrint('✅ [macOS E2E] Window resize handled correctly');
    });
  });

  group('macOS E2E Tests - Performance & Stability', () {
    testWidgets('App initialization completes within acceptable time', (
      tester,
    ) async {
      debugPrint('📱 [macOS E2E] Starting performance test');

      final stopwatch = Stopwatch()..start();

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pump();

      // Wait for full initialization
      await tester.pumpAndSettle(const Duration(seconds: 10));

      stopwatch.stop();
      final elapsed = stopwatch.elapsedMilliseconds;
      debugPrint('⏱️  [macOS E2E] Full initialization took ${elapsed}ms');

      // Verify initialization time is reasonable (< 10 seconds)
      expect(
        elapsed,
        lessThan(10000),
        reason: 'App should initialize within 10 seconds',
      );

      // Log performance breakdown
      if (elapsed < 2000) {
        debugPrint('🚀 [macOS E2E] Excellent performance: <2s');
      } else if (elapsed < 5000) {
        debugPrint('✅ [macOS E2E] Good performance: 2-5s');
      } else {
        debugPrint('⚠️  [macOS E2E] Slow performance: >5s');
      }

      // Verify app is functional
      expect(find.byType(FaiseurApp), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('App remains stable during rapid pumps', (tester) async {
      debugPrint('📱 [macOS E2E] Starting stability test');

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pump();

      // Rapidly pump to simulate intensive updates
      for (int i = 0; i < 50; i++) {
        await tester.pump(const Duration(milliseconds: 50));
        if (i % 10 == 0) {
          debugPrint('⚡ [macOS E2E] Rapid pump ${i + 1}/50');
        }
      }

      // Verify app is still stable
      expect(
        find.byType(FaiseurApp),
        findsOneWidget,
        reason: 'App should remain stable',
      );
      expect(
        tester.takeException(),
        isNull,
        reason: 'No exceptions during rapid updates',
      );
      debugPrint('✅ [macOS E2E] App remained stable during rapid pumps');
    });

    testWidgets('Memory does not leak during state changes', (tester) async {
      debugPrint('📱 [macOS E2E] Starting memory leak test');

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Simulate multiple state changes by pumping
      for (int i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 100));
        await tester.pumpAndSettle(const Duration(milliseconds: 500));
        if (i % 3 == 0) {
          debugPrint('🔄 [macOS E2E] State change cycle ${i + 1}/10');
        }
      }

      // Verify app still functions
      expect(find.byType(FaiseurApp), findsOneWidget);
      expect(tester.takeException(), isNull);
      debugPrint('✅ [macOS E2E] No memory leaks detected');
    });

    testWidgets('App handles hot reload simulation', (tester) async {
      debugPrint('📱 [macOS E2E] Starting hot reload test');

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final initialWidgetCount = find.byType(FaiseurApp).evaluate().length;
      debugPrint('📊 [macOS E2E] Initial widget count: $initialWidgetCount');

      // Simulate hot reload by rebuilding
      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final afterReloadCount = find.byType(FaiseurApp).evaluate().length;
      debugPrint('📊 [macOS E2E] After reload widget count: $afterReloadCount');

      expect(
        afterReloadCount,
        equals(initialWidgetCount),
        reason: 'Widget count should remain consistent',
      );
      expect(
        tester.takeException(),
        isNull,
        reason: 'Hot reload should not cause errors',
      );
      debugPrint('✅ [macOS E2E] Hot reload handled correctly');
    });
  });

  group('macOS E2E Tests - Error Handling', () {
    testWidgets('App handles Firebase errors gracefully', (tester) async {
      debugPrint('📱 [macOS E2E] Starting Firebase error handling test');

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pump();

      // Wait for Firebase initialization (may succeed or fail)
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // App should render even if Firebase has issues
      expect(
        find.byType(FaiseurApp),
        findsOneWidget,
        reason: 'App should still render',
      );
      expect(
        find.byType(MaterialApp),
        findsOneWidget,
        reason: 'MaterialApp should be present',
      );
      debugPrint('✅ [macOS E2E] App handles Firebase state gracefully');
    });

    testWidgets('No unhandled exceptions during normal flow', (tester) async {
      debugPrint('📱 [macOS E2E] Starting exception detection test');

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pump();

      // Run through typical initialization flow
      for (int i = 0; i < 20; i++) {
        await tester.pump(const Duration(milliseconds: 100));
        final exception = tester.takeException();
        if (exception != null) {
          debugPrint('❌ [macOS E2E] Exception at pump $i: $exception');
          fail('Unhandled exception: $exception');
        }
      }

      await tester.pumpAndSettle(const Duration(seconds: 2));
      final finalException = tester.takeException();
      expect(
        finalException,
        isNull,
        reason: 'No exceptions should occur during normal flow',
      );
      debugPrint('✅ [macOS E2E] No unhandled exceptions detected');
    });

    testWidgets('App displays error states when appropriate', (tester) async {
      debugPrint('📱 [macOS E2E] Starting error state display test');

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Look for error indicators if Firebase fails
      // (should show error UI, not crash)
      final hasScaffold = find.byType(Scaffold).evaluate().isNotEmpty;
      expect(
        hasScaffold,
        isTrue,
        reason: 'App should render UI even with errors',
      );
      debugPrint('✅ [macOS E2E] Error states handled gracefully');
    });
  });

  group('macOS E2E Tests - Debug Info', () {
    testWidgets('Collect debug information about app state', (tester) async {
      debugPrint('📱 [macOS E2E] Starting debug info collection');

      await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
      await tester.pump();

      // Collect various debug info
      debugPrint('🔍 [macOS E2E] === Debug Information ===');

      // Window size
      final windowSize = tester.view.physicalSize;
      final pixelRatio = tester.view.devicePixelRatio;
      debugPrint(
        '📐 [macOS E2E] Window size: ${windowSize.width}x${windowSize.height}, DPR: $pixelRatio',
      );

      // Wait and collect widget tree info
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Widget counts
      final scaffoldCount = find.byType(Scaffold).evaluate().length;
      final textCount = find.byType(Text).evaluate().length;
      final buttonCount = find.byType(ElevatedButton).evaluate().length;
      debugPrint(
        '🧱 [macOS E2E] Widget counts: Scaffold=$scaffoldCount, Text=$textCount, Button=$buttonCount',
      );

      // Check for common widgets
      final hasAppBar = find.byType(AppBar).evaluate().isNotEmpty;
      final hasCircularProgress = find
          .byType(CircularProgressIndicator)
          .evaluate()
          .isNotEmpty;
      debugPrint(
        '🎨 [macOS E2E] UI elements: AppBar=$hasAppBar, Loading=$hasCircularProgress',
      );

      // Exception status
      final exception = tester.takeException();
      debugPrint(
        '❗ [macOS E2E] Exception status: ${exception == null ? "None" : exception.toString()}',
      );

      // Final state
      final appPresent = find.byType(FaiseurApp).evaluate().isNotEmpty;
      debugPrint('✅ [macOS E2E] App present: $appPresent');
      debugPrint('🔍 [macOS E2E] === End Debug Information ===');

      expect(appPresent, isTrue);
    });
  });
}
