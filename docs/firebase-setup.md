# Firebase Setup Guide

This guide walks you through setting up Firebase for the Faiseur app.

## Prerequisites

- Firebase account (https://firebase.google.com/)
- Flutter SDK installed
- FlutterFire CLI installed

## Step 1: Install FlutterFire CLI

```bash
dart pub global activate flutterfire_cli
```

Make sure the pub global bin directory is in your PATH:
```bash
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

## Step 2: Create Firebase Projects

1. Go to https://console.firebase.google.com/
2. Click "Add project"
3. Create **three separate projects**:
   - `faiseur-dev` (Development)
   - `faiseur-staging` (Staging)
   - `faiseur-prod` (Production)

## Step 3: Enable Firebase Services

For **each project**, enable the following services:

### Authentication
1. Go to **Build** → **Authentication**
2. Click **Get Started**
3. Enable **Email/Password** provider
4. Enable **Anonymous** provider

### Cloud Firestore
1. Go to **Build** → **Firestore Database**
2. Click **Create database**
3. Start in **test mode** for dev, **production mode** for prod
4. Choose a location (e.g., `us-central1`)

### Firebase Storage
1. Go to **Build** → **Storage**
2. Click **Get started**
3. Use default security rules for now

### Cloud Functions
1. Go to **Build** → **Functions**
2. Upgrade to Blaze plan (pay-as-you-go, required for functions)
3. Note: Development can start without functions

## Step 4: Configure Flutter App

### For Development Environment

```bash
# Make sure you're in the project root
cd /Users/ykoehler/Projects/faiseur

# Run FlutterFire configure
flutterfire configure \
  --project=faiseur-dev \
  --out=lib/firebase_options.dart \
  --ios-bundle-id=com.faiseur.faiseur \
  --macos-bundle-id=com.faiseur.faiseur \
  --android-package-name=com.faiseur.faiseur
```

This will:
- Generate `lib/firebase_options.dart`
- Download `google-services.json` for Android
- Download `GoogleService-Info.plist` for iOS/macOS
- Update platform-specific configuration files

### For Staging and Production

Create separate configuration files:

```bash
# Staging
flutterfire configure \
  --project=faiseur-staging \
  --out=lib/firebase_options_staging.dart \
  --ios-bundle-id=com.faiseur.faiseur.staging \
  --macos-bundle-id=com.faiseur.faiseur.staging \
  --android-package-name=com.faiseur.faiseur.staging

# Production
flutterfire configure \
  --project=faiseur-prod \
  --out=lib/firebase_options_prod.dart \
  --ios-bundle-id=com.faiseur.faiseur \
  --macos-bundle-id=com.faiseur.faiseur \
  --android-package-name=com.faiseur.faiseur
```

## Step 5: Update Firebase Configuration in Code

Update `lib/main.dart` to initialize Firebase:

```dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}
```

## Step 6: Set Up Firestore Security Rules

1. Go to **Firestore Database** → **Rules**
2. Replace with the rules from `docs/architecture.md` (Section: Firestore Security Rules)
3. Click **Publish**

### Quick Start Rules (Development Only)

For initial development, you can use these permissive rules:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

**⚠️ Important**: Replace with production-ready rules before launch!

## Step 7: Test Firebase Connection

Run the app to verify Firebase is configured correctly:

```bash
# Web
flutter run -d chrome

# macOS
flutter run -d macos

# iOS
flutter run -d iphone

# Android
flutter run -d android
```

Check the console for any Firebase initialization errors.

## Step 8: Set Up Firebase Emulators (Optional but Recommended)

Install Firebase CLI:

```bash
npm install -g firebase-tools
```

Login to Firebase:

```bash
firebase login
```

Initialize Firebase in your project:

```bash
firebase init
```

Select:
- Firestore
- Functions
- Storage
- Emulators

Configure emulators in `lib/main.dart`:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  if (kDebugMode) {
    // Use emulators in debug mode
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
    FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    FirebaseStorage.instance.useStorageEmulator('localhost', 9199);
  }
  
  runApp(const MyApp());
}
```

Start emulators:

```bash
firebase emulators:start
```

## Step 9: Set Up Cloud Functions (Phase 2)

When you're ready to implement Cloud Functions:

```bash
# Navigate to functions directory
cd functions

# Install dependencies
npm install

# Write your functions in functions/src/index.ts

# Test locally
firebase emulators:start --only functions

# Deploy
firebase deploy --only functions
```

## Troubleshooting

### Issue: FlutterFire CLI not found
**Solution**: Make sure pub global bin is in your PATH:
```bash
echo 'export PATH="$PATH":"$HOME/.pub-cache/bin"' >> ~/.zshrc
source ~/.zshrc
```

### Issue: Firebase initialization fails on iOS
**Solution**: 
1. Open `ios/Runner.xcworkspace` in Xcode
2. Check that `GoogleService-Info.plist` is added to the project
3. Clean build folder (Cmd+Shift+K) and rebuild

### Issue: Firebase initialization fails on Android
**Solution**:
1. Check that `google-services.json` is in `android/app/`
2. Verify `com.google.gms.google-services` plugin is applied in `android/app/build.gradle`
3. Run `flutter clean` and rebuild

### Issue: Permission denied errors in Firestore
**Solution**: 
1. Check security rules in Firebase Console
2. Verify user is authenticated before accessing data
3. Review rules in `docs/architecture.md`

## Environment Variables

For managing different environments, create a `.env` file:

```env
FIREBASE_PROJECT_ID=faiseur-dev
FIREBASE_API_KEY=your-api-key
FIREBASE_AUTH_DOMAIN=faiseur-dev.firebaseapp.com
```

Use `flutter_dotenv` package to load environment variables.

## Next Steps

1. ✅ Firebase configured for all platforms
2. ✅ Test authentication flows
3. ✅ Test Firestore read/write operations
4. ✅ Set up proper security rules
5. ✅ Configure emulators for local development
6. → Begin implementing authentication feature (Phase 1.3)

## Resources

- [FlutterFire Documentation](https://firebase.flutter.dev/)
- [Firebase Console](https://console.firebase.google.com/)
- [Firebase CLI Documentation](https://firebase.google.com/docs/cli)
- [Firestore Security Rules](https://firebase.google.com/docs/firestore/security/get-started)
- [Firebase Emulators](https://firebase.google.com/docs/emulator-suite)

## Support

If you encounter issues:
1. Check the [FlutterFire GitHub Issues](https://github.com/firebase/flutterfire/issues)
2. Review the [Firebase documentation](https://firebase.google.com/docs)
3. Ask in [FlutterFire Discord](https://discord.gg/X4XsKnC)
