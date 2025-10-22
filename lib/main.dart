import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'firebase_config.dart';
import 'routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with environment-specific configuration
  // Environment is set via --dart-define or --dart-define-from-file at build time
  try {
    debugPrint(
      '🔧 Initializing Firebase for ${FirebaseConfig.environmentName}...',
    );

    await Firebase.initializeApp(options: FirebaseConfig.currentPlatform);

    debugPrint('✅ Firebase initialized successfully');

    // Log environment information in non-production builds
    if (FirebaseConfig.showDebugInfo) {
      debugPrint('🚀 Running in ${FirebaseConfig.environmentName} environment');
      debugPrint('📦 Flavor: ${FirebaseConfig.flavor}');
      debugPrint('🌐 Platform: ${kIsWeb ? 'Web' : defaultTargetPlatform}');
    }

    if (FirebaseConfig.useEmulators && kDebugMode) {
      await _connectToEmulators();
    }
  } catch (e, stackTrace) {
    // If Firebase is not configured yet, show helpful error message
    debugPrint('❌ Firebase initialization failed: $e');
    if (kDebugMode) {
      debugPrint('Stack trace: $stackTrace');
    }
    debugPrint('💡 Troubleshooting steps:');
    debugPrint(
      '   1. Use --dart-define-from-file to set environment variables:',
    );
    debugPrint('      flutter run --dart-define-from-file=.env.dev');
    debugPrint('   2. Or use individual --dart-define flags:');
    debugPrint('      flutter run --dart-define=FLAVOR=dev');
    debugPrint(
      '   3. Ensure Firebase options are generated in lib/firebase_options_*.dart',
    );
    debugPrint('   4. Check docs/firebase-setup.md for detailed instructions.');
  }

  runApp(const ProviderScope(child: FaiseurApp()));
}

/// Connects to Firebase emulators for local development.
///
Future<void> _connectToEmulators() async {
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  await FirebaseStorage.instance.useStorageEmulator('localhost', 9199);
  debugPrint('🔧 Connected to Firebase emulators');
}

/// Main app widget.
///
/// Provides Riverpod scope and configures Material 3 theme with Go Router.
class FaiseurApp extends ConsumerWidget {
  /// Creates the Faiseur app.
  const FaiseurApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'Faiseur',
      debugShowCheckedModeBanner: FirebaseConfig.showDebugInfo,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
