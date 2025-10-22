import 'package:faiseur/firebase_config.dart';
import 'package:faiseur/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

/// Simple debug test to trace splash screen and login flow
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    try {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp(options: FirebaseConfig.currentPlatform);
      } else {
        Firebase.app();
      }
    } on FirebaseException catch (error) {
      if (error.code != 'duplicate-app') {
        rethrow;
      }
      // Default app already exists (e.g. initialized by host platform); reuse it.
      Firebase.app();
    }
  });

  testWidgets('Debug splash screen and guest login', (tester) async {
    debugPrint('🔍 [DEBUG] Starting app...');

    await tester.pumpWidget(const ProviderScope(child: FaiseurApp()));
    debugPrint('🔍 [DEBUG] App widget created');

    await tester.pump();
    debugPrint('🔍 [DEBUG] Initial pump done');

    // Pump a few times to let initial rendering happen
    debugPrint('🔍 [DEBUG] Waiting for app initialization...');
    for (int i = 0; i < 30; i++) {
      await tester.pump(const Duration(milliseconds: 200));

      // Check if guest button is visible
      if (i % 5 == 0) {
        final guestButton = find.text('Continue as Guest');
        if (guestButton.evaluate().isNotEmpty) {
          debugPrint('✅ [DEBUG] Found guest button at ${i * 200}ms');
          break;
        }
      }
    }
    debugPrint('🔍 [DEBUG] Initial pumping complete');

    // Check if we're on login page
    final guestButton = find.text('Continue as Guest');
    if (guestButton.evaluate().isEmpty) {
      debugPrint('❌ [DEBUG] "Continue as Guest" button not found');
      expect(guestButton, findsOneWidget, reason: 'Guest button should be visible');
      return;
    }

    debugPrint('✅ [DEBUG] Found "Continue as Guest" button');

    // Scroll to make sure button is visible
    debugPrint('🔍 [DEBUG] Scrolling to guest button...');
    await tester.ensureVisible(guestButton);
    await tester.pump(const Duration(milliseconds: 300));
    debugPrint('✅ [DEBUG] Guest button is visible');

    // Tap the guest button
    debugPrint('🔍 [DEBUG] Tapping guest button...');
    await tester.tap(guestButton);
    debugPrint('✅ [DEBUG] Tapped guest button');

    await tester.pump();
    debugPrint('🔍 [DEBUG] Pumped after tap');

    // Wait for sign in to complete (pump manually instead of pumpAndSettle)
    debugPrint('🔍 [DEBUG] Waiting for guest sign-in to complete...');
    bool navigatedAway = false;
    for (int i = 0; i < 50; i++) {
      await tester.pump(const Duration(milliseconds: 100));

      // Check if we've navigated away from login
      final stillOnLogin = find.text('Continue as Guest').evaluate().isNotEmpty;
      if (!stillOnLogin) {
        navigatedAway = true;
        debugPrint('✅ [DEBUG] Successfully signed in as guest and navigated away at ${i * 100}ms!');
        break;
      }

      if (i % 10 == 0) {
        debugPrint('⏱️  [DEBUG] Still on login page after ${i * 100}ms');
      }
    }

    if (!navigatedAway) {
      debugPrint('⚠️  [DEBUG] Still on login page after 5 seconds');

      // Check for errors
      final exception = tester.takeException();
      if (exception != null) {
        debugPrint('❌ [DEBUG] Exception occurred: $exception');
      }

      // List what's on screen
      debugPrint('🔍 [DEBUG] Current screen contents:');
      for (final element in find.byType(Text).evaluate().take(10)) {
        final widget = element.widget as Text;
        debugPrint('   - ${widget.data ?? "TextSpan"}');
      }
    }

    expect(find.byType(FaiseurApp), findsOneWidget);
    expect(navigatedAway, isTrue, reason: 'Should navigate away from login after guest sign-in');
  });
}
