// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Firebase options for Production environment
/// All values are loaded from compile-time defines via --dart-define-from-file
///
/// Usage:
/// ```bash
/// flutter run --dart-define-from-file=.env.prod
/// ```
///
/// To use this in your app:
/// ```dart
/// import 'firebase_options_prod.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  // Web Firebase Options
  static FirebaseOptions get web {
    return FirebaseOptions(
      apiKey: const String.fromEnvironment('PROD_FIREBASE_API_KEY'),
      appId: const String.fromEnvironment('PROD_FIREBASE_APP_ID_WEB'),
      messagingSenderId: const String.fromEnvironment(
        'PROD_FIREBASE_MESSAGING_SENDER_ID',
      ),
      projectId: const String.fromEnvironment('PROD_FIREBASE_PROJECT_ID'),
      authDomain: const String.fromEnvironment('PROD_FIREBASE_AUTH_DOMAIN'),
      storageBucket: const String.fromEnvironment(
        'PROD_FIREBASE_STORAGE_BUCKET',
      ),
      measurementId: const String.fromEnvironment(
        'PROD_FIREBASE_MEASUREMENT_ID',
      ),
    );
  }

  // Android Firebase Options
  static FirebaseOptions get android {
    return FirebaseOptions(
      apiKey: const String.fromEnvironment('PROD_FIREBASE_API_KEY'),
      appId: const String.fromEnvironment('PROD_FIREBASE_APP_ID_ANDROID'),
      messagingSenderId: const String.fromEnvironment(
        'PROD_FIREBASE_MESSAGING_SENDER_ID',
      ),
      projectId: const String.fromEnvironment('PROD_FIREBASE_PROJECT_ID'),
      storageBucket: const String.fromEnvironment(
        'PROD_FIREBASE_STORAGE_BUCKET',
      ),
    );
  }

  // iOS Firebase Options
  static FirebaseOptions get ios {
    return FirebaseOptions(
      apiKey: const String.fromEnvironment('PROD_FIREBASE_API_KEY'),
      appId: const String.fromEnvironment('PROD_FIREBASE_APP_ID_IOS'),
      messagingSenderId: const String.fromEnvironment(
        'PROD_FIREBASE_MESSAGING_SENDER_ID',
      ),
      projectId: const String.fromEnvironment('PROD_FIREBASE_PROJECT_ID'),
      storageBucket: const String.fromEnvironment(
        'PROD_FIREBASE_STORAGE_BUCKET',
      ),
      iosBundleId: 'com.ykoehler.faiseur',
    );
  }

  // macOS Firebase Options
  static FirebaseOptions get macos {
    return FirebaseOptions(
      apiKey: const String.fromEnvironment('PROD_FIREBASE_API_KEY'),
      appId: const String.fromEnvironment('PROD_FIREBASE_APP_ID_MACOS'),
      messagingSenderId: const String.fromEnvironment(
        'PROD_FIREBASE_MESSAGING_SENDER_ID',
      ),
      projectId: const String.fromEnvironment('PROD_FIREBASE_PROJECT_ID'),
      storageBucket: const String.fromEnvironment(
        'PROD_FIREBASE_STORAGE_BUCKET',
      ),
      iosBundleId: 'com.ykoehler.faiseur',
    );
  }
}
