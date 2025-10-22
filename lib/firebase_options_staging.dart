// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Firebase options for Staging environment
/// All values are loaded from environment variables (.env file or GitHub Actions secrets)
///
/// To use this in your app:
/// ```dart
/// import 'firebase_options_staging.dart';
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
        throw UnsupportedError('DefaultFirebaseOptions have not been configured for windows');
      case TargetPlatform.linux:
        throw UnsupportedError('DefaultFirebaseOptions have not been configured for linux');
      default:
        throw UnsupportedError('DefaultFirebaseOptions are not supported for this platform.');
    }
  }

  // Web Firebase Options (from environment variables)
  static FirebaseOptions get web {
    return FirebaseOptions(
      apiKey: dotenv.env['STAGING_FIREBASE_API_KEY'] ?? '',
      appId: dotenv.env['STAGING_FIREBASE_APP_ID_WEB'] ?? '',
      messagingSenderId: dotenv.env['STAGING_FIREBASE_MESSAGING_SENDER_ID'] ?? '',
      projectId: dotenv.env['STAGING_FIREBASE_PROJECT_ID'] ?? 'faiseur-staging',
      authDomain: dotenv.env['STAGING_FIREBASE_AUTH_DOMAIN'] ?? 'faiseur-staging.firebaseapp.com',
      storageBucket: dotenv.env['STAGING_FIREBASE_STORAGE_BUCKET'] ?? 'faiseur-staging.appspot.com',
      measurementId: dotenv.env['STAGING_FIREBASE_MEASUREMENT_ID'],
    );
  }

  // Android Firebase Options (from environment variables)
  static FirebaseOptions get android {
    return FirebaseOptions(
      apiKey: dotenv.env['STAGING_FIREBASE_API_KEY'] ?? '',
      appId: dotenv.env['STAGING_FIREBASE_APP_ID_ANDROID'] ?? '',
      messagingSenderId: dotenv.env['STAGING_FIREBASE_MESSAGING_SENDER_ID'] ?? '',
      projectId: dotenv.env['STAGING_FIREBASE_PROJECT_ID'] ?? 'faiseur-staging',
      storageBucket: dotenv.env['STAGING_FIREBASE_STORAGE_BUCKET'] ?? 'faiseur-staging.appspot.com',
    );
  }

  // iOS Firebase Options (from environment variables)
  static FirebaseOptions get ios {
    return FirebaseOptions(
      apiKey: dotenv.env['STAGING_FIREBASE_API_KEY'] ?? '',
      appId: dotenv.env['STAGING_FIREBASE_APP_ID_IOS'] ?? '',
      messagingSenderId: dotenv.env['STAGING_FIREBASE_MESSAGING_SENDER_ID'] ?? '',
      projectId: dotenv.env['STAGING_FIREBASE_PROJECT_ID'] ?? 'faiseur-staging',
      storageBucket: dotenv.env['STAGING_FIREBASE_STORAGE_BUCKET'] ?? 'faiseur-staging.appspot.com',
      iosBundleId: 'com.ykoehler.faiseur.staging',
    );
  }

  // macOS Firebase Options (from environment variables)
  static FirebaseOptions get macos {
    return FirebaseOptions(
      apiKey: dotenv.env['STAGING_FIREBASE_API_KEY'] ?? '',
      appId: dotenv.env['STAGING_FIREBASE_APP_ID_MACOS'] ?? '',
      messagingSenderId: dotenv.env['STAGING_FIREBASE_MESSAGING_SENDER_ID'] ?? '',
      projectId: dotenv.env['STAGING_FIREBASE_PROJECT_ID'] ?? 'faiseur-staging',
      storageBucket: dotenv.env['STAGING_FIREBASE_STORAGE_BUCKET'] ?? 'faiseur-staging.appspot.com',
      iosBundleId: 'com.ykoehler.faiseur.staging',
    );
  }
}
