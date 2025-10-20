import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'firebase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with environment-specific configuration
  try {
    await Firebase.initializeApp(
      options: FirebaseConfig.currentPlatform,
    );

    // Log environment information in non-production builds
    if (FirebaseConfig.showDebugInfo) {
      debugPrint('🚀 Running in ${FirebaseConfig.environmentName} environment');
      debugPrint('📦 Flavor: ${FirebaseConfig.flavor}');
    }

    // TODO: Initialize Firebase emulators in development
    // Uncomment after Firebase setup is complete:
    // if (FirebaseConfig.useEmulators && kDebugMode) {
    //   await _connectToEmulators();
    // }
  } catch (e) {
    // If Firebase is not configured yet, show helpful error message
    debugPrint('⚠️  Firebase not initialized: $e');
    debugPrint('💡 Run `flutterfire configure` to set up Firebase.');
    debugPrint('📖 See docs/firebase-setup.md for detailed instructions.');
  }

  runApp(const FaiseurApp());
}

/// Connects to Firebase emulators for local development.
///
/// Uncomment and use this after Firebase setup is complete.
// Future<void> _connectToEmulators() async {
//   await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
//   FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
//   await FirebaseStorage.instance.useStorageEmulator('localhost', 9199);
//   debugPrint('🔧 Connected to Firebase emulators');
// }

class FaiseurApp extends StatelessWidget {
  const FaiseurApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Faiseur',
      debugShowCheckedModeBanner: FirebaseConfig.showDebugInfo,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Faiseur'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '👷 Faiseur Todo App',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Environment: ${FirebaseConfig.environmentName}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Flavor: ${FirebaseConfig.flavor}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(height: 32),
            const Card(
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '🚧 Setup Required',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text('Next steps:'),
                    SizedBox(height: 8),
                    Text('1. Create Firebase projects (dev, staging, prod)'),
                    Text('2. Run `flutterfire configure` for each environment'),
                    Text('3. Configure GitHub secrets'),
                    Text('4. Begin Phase 1 implementation'),
                    SizedBox(height: 16),
                    Text(
                      '📖 See docs/firebase-setup.md and '
                      'docs/github-secrets-setup.md',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
}
