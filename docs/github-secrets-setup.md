# GitHub Secrets and Environment Configuration

This document provides detailed instructions for setting up GitHub Secrets and managing different environments (dev, staging, production) for the Faiseur project.

## Overview

The project uses three separate environments:

1. **Development (dev)**: Local development and PR builds
2. **Staging**: Testing environment (deployed from `develop` branch)
3. **Production**: Live environment (deployed from `main` branch)

Each environment has its own Firebase project to ensure complete data isolation.

---

## Firebase Projects Setup

### 1. Create Firebase Projects

Create three separate Firebase projects in the [Firebase Console](https://console.firebase.google.com/):

1. `faiseur-dev` - Development
2. `faiseur-staging` - Staging
3. `faiseur` - Production

For each project:
- Enable Authentication (Email/Password, Anonymous)
- Create Firestore database
- Enable Firebase Storage
- Set up Firebase Hosting

### 2. Generate Firebase Configuration Files

For each environment, run:

```bash
# Development
flutterfire configure \
  --project=faiseur-dev \
  --out=lib/firebase_options_dev.dart \
  --platforms=web,ios,android,macos

# Staging
flutterfire configure \
  --project=faiseur-staging \
  --out=lib/firebase_options_staging.dart \
  --platforms=web,ios,android,macos

# Production
flutterfire configure \
  --project=faiseur \
  --out=lib/firebase_options_prod.dart \
  --platforms=web,ios,android,macos
```

### 3. Extract Configuration for GitHub Secrets

After running `flutterfire configure`, you'll have three files. Copy the **entire content** of each file to use as GitHub Secrets.

---

## GitHub Secrets Configuration

### Repository Secrets (Settings → Secrets and variables → Actions → New repository secret)

#### Firebase Configuration Secrets

**FIREBASE_OPTIONS_DEV**
```dart
// Copy entire content of lib/firebase_options_dev.dart
```

**FIREBASE_OPTIONS_STAGING**
```dart
// Copy entire content of lib/firebase_options_staging.dart
```

**FIREBASE_OPTIONS_PROD**
```dart
// Copy entire content of lib/firebase_options_prod.dart
```

#### Firebase Service Account Secrets

For deployment to Firebase Hosting, you need service account keys.

1. Go to Firebase Console → Project Settings → Service Accounts
2. Click "Generate new private key" for each project
3. Download the JSON file
4. Convert to base64 or copy the JSON content

**FIREBASE_SERVICE_ACCOUNT_STAGING**
```json
{
  "type": "service_account",
  "project_id": "faiseur-staging",
  "private_key_id": "...",
  "private_key": "...",
  ...
}
```

**FIREBASE_SERVICE_ACCOUNT_PROD**
```json
{
  "type": "service_account",
  "project_id": "faiseur",
  "private_key_id": "...",
  "private_key": "...",
  ...
}
```

#### Firebase Project IDs

**FIREBASE_PROJECT_ID_STAGING**
```
faiseur-staging
```

**FIREBASE_PROJECT_ID_PROD**
```
faiseur
```

#### iOS Secrets (for App Store deployment)

**IOS_PROVISIONING_PROFILE**
- Base64-encoded provisioning profile from Apple Developer Portal
```bash
base64 -i YourProfile.mobileprovision
```

**IOS_CERTIFICATE_P12**
- Base64-encoded P12 certificate
```bash
base64 -i Certificates.p12
```

**IOS_CERTIFICATE_PASSWORD**
- Password for the P12 certificate
```
your-certificate-password
```

**APP_STORE_CONNECT_API_KEY_ID**
- API Key ID from App Store Connect
```
XXXXXXXXXX
```

**APP_STORE_CONNECT_API_ISSUER_ID**
- Issuer ID from App Store Connect
```
xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```

**APP_STORE_CONNECT_API_KEY**
- Base64-encoded App Store Connect API Key (.p8 file)
```bash
base64 -i AuthKey_XXXXXXXXXX.p8
```

#### Android Secrets (for Play Store deployment)

**ANDROID_KEYSTORE**
- Base64-encoded Android keystore file
```bash
keytool -genkey -v -keystore upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
base64 -i upload-keystore.jks
```

**ANDROID_KEYSTORE_PASSWORD**
- Keystore password
```
your-keystore-password
```

**ANDROID_KEY_ALIAS**
- Key alias
```
upload
```

**ANDROID_KEY_PASSWORD**
- Key password
```
your-key-password
```

**PLAY_STORE_SERVICE_ACCOUNT_JSON**
- Service account JSON for Play Store deployment
- Create in Google Play Console → Setup → API access
```json
{
  "type": "service_account",
  "project_id": "api-...",
  "private_key_id": "...",
  "private_key": "...",
  ...
}
```

#### Optional: Notification Secrets

**SLACK_WEBHOOK_URL** (optional)
- Slack webhook URL for deployment notifications
```
https://hooks.slack.com/services/YOUR/WEBHOOK/URL
```

---

## Environment Variables in Code

### Using Dart-Define for Environment Selection

The app uses `--dart-define` to determine which Firebase configuration to use:

**lib/firebase_config.dart** (create this file):

```dart
import 'package:firebase_core/firebase_core.dart';

// Import all environment configs
import 'firebase_options_dev.dart' as dev;
import 'firebase_options_staging.dart' as staging;
import 'firebase_options_prod.dart' as prod;

class FirebaseConfig {
  static const String flavor = String.fromEnvironment(
    'FLAVOR',
    defaultValue: 'dev',
  );

  static FirebaseOptions get currentPlatform {
    switch (flavor) {
      case 'staging':
        return staging.DefaultFirebaseOptions.currentPlatform;
      case 'production':
        return prod.DefaultFirebaseOptions.currentPlatform;
      case 'dev':
      default:
        return dev.DefaultFirebaseOptions.currentPlatform;
    }
  }

  static bool get isDevelopment => flavor == 'dev';
  static bool get isStaging => flavor == 'staging';
  static bool get isProduction => flavor == 'production';
}
```

### Update main.dart

```dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseConfig.currentPlatform,
  );

  // Show environment indicator in dev/staging
  if (!FirebaseConfig.isProduction) {
    debugPrint('Running in ${FirebaseConfig.flavor} environment');
  }

  runApp(const MyApp());
}
```

### Running with Different Environments

```bash
# Development (default)
flutter run

# Explicitly specify dev
flutter run --dart-define=FLAVOR=dev

# Staging
flutter run --dart-define=FLAVOR=staging

# Production
flutter run --dart-define=FLAVOR=production
```

---

## Setting Up GitHub Secrets (Step-by-Step)

### 1. Navigate to Repository Settings

1. Go to your repository on GitHub
2. Click **Settings**
3. Click **Secrets and variables** → **Actions**

### 2. Add Secrets

For each secret listed above:

1. Click **New repository secret**
2. Enter the **Name** (exactly as shown above)
3. Paste the **Value**
4. Click **Add secret**

### 3. Set Up Environments (Optional but Recommended)

For better control over deployments:

1. Go to **Settings** → **Environments**
2. Create two environments:
   - `staging`
   - `production`

3. For **production** environment:
   - Add protection rules:
     - ✅ Required reviewers (add team members)
     - ✅ Wait timer: 5 minutes
   - This ensures manual approval before production deployment

### 4. Configure Environment-Specific Secrets

You can also set secrets at the environment level instead of repository level:

1. Click on the environment (e.g., `production`)
2. Add environment secrets
3. These override repository secrets when the workflow runs for that environment

---

## Firestore Security Rules for Multiple Environments

Update your Firestore security rules to handle different environments:

**firestore.rules**:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    
    // Helper functions
    function isAuthenticated() {
      return request.auth != null;
    }
    
    function isOwner(userId) {
      return isAuthenticated() && request.auth.uid == userId;
    }
    
    function isDevEnvironment() {
      // You can't directly check environment in rules,
      // but you can use different rule files for different projects
      return true;
    }
    
    // Development: More permissive rules for testing
    // Production: Strict rules
    
    match /users/{userId} {
      allow read: if isAuthenticated();
      allow create: if isOwner(userId);
      allow update, delete: if isOwner(userId);
    }
    
    match /lists/{listId} {
      function isListCollaborator() {
        return isAuthenticated() && 
               get(/databases/$(database)/documents/lists/$(listId))
                 .data.collaborators[request.auth.uid] != null;
      }
      
      allow read: if isListCollaborator();
      allow create: if isAuthenticated();
      allow update: if isListCollaborator();
      allow delete: if isOwner(resource.data.ownerId);
      
      match /todos/{todoId} {
        allow read, write: if isListCollaborator();
      }
      
      match /rewards/{rewardId} {
        allow read: if isListCollaborator();
        allow write: if isOwner(
          get(/databases/$(database)/documents/lists/$(listId)).data.ownerId
        );
      }
    }
  }
}
```

Deploy rules to each environment:

```bash
# Staging
firebase use faiseur-staging
firebase deploy --only firestore:rules

# Production
firebase use faiseur
firebase deploy --only firestore:rules
```

---

## Branch Protection Rules

Set up branch protection to enforce PR workflow:

### 1. Protect `develop` Branch

1. Go to **Settings** → **Branches**
2. Add rule for `develop`
3. Configure:
   - ✅ Require a pull request before merging
   - ✅ Require approvals (1)
   - ✅ Require status checks to pass
     - Select: `Code Analysis`, `Unit & Widget Tests`, `Build Web (Dev)`, `Build macOS (Dev)`
   - ✅ Require conversation resolution before merging
   - ✅ Do not allow bypassing the above settings

### 2. Protect `main` Branch

1. Add rule for `main`
2. Configure:
   - ✅ Require a pull request before merging
   - ✅ Require approvals (2)
   - ✅ Require status checks to pass
     - Select all checks from PR workflow
   - ✅ Require branches to be up to date
   - ✅ Require conversation resolution before merging
   - ✅ Do not allow bypassing the above settings
   - ✅ Require deployments to succeed (for production environment)

---

## Local Development Setup

### 1. Create Local Firebase Options

For local development, use the dev configuration:

```bash
cp lib/firebase_options_dev.dart lib/firebase_options.dart
```

Add to `.gitignore` (already done):
```
lib/firebase_options.dart
```

### 2. Use Firebase Emulators

**firebase.json**:

```json
{
  "firestore": {
    "rules": "firestore.rules",
    "indexes": "firestore.indexes.json"
  },
  "hosting": {
    "public": "build/web",
    "ignore": [
      "firebase.json",
      "**/.*",
      "**/node_modules/**"
    ]
  },
  "emulators": {
    "auth": {
      "port": 9099
    },
    "firestore": {
      "port": 8080
    },
    "storage": {
      "port": 9199
    },
    "ui": {
      "enabled": true,
      "port": 4000
    }
  }
}
```

Start emulators:

```bash
firebase emulators:start
```

Connect to emulators in code (already in main.dart):

```dart
if (kDebugMode && useEmulators) {
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  await FirebaseStorage.instance.useStorageEmulator('localhost', 9199);
}
```

---

## Testing Secrets Locally

To test GitHub Actions workflows locally, use [act](https://github.com/nektos/act):

```bash
# Install act
brew install act

# Create .secrets file (DO NOT COMMIT)
cat > .secrets << EOF
FIREBASE_OPTIONS_DEV=<content>
FIREBASE_OPTIONS_STAGING=<content>
FIREBASE_OPTIONS_PROD=<content>
EOF

# Run workflow locally
act pull_request --secret-file .secrets
```

---

## Security Checklist

- [ ] All Firebase configuration files added to `.gitignore`
- [ ] All secrets added to GitHub repository settings
- [ ] Branch protection rules configured for `develop` and `main`
- [ ] Production environment requires manual approval
- [ ] Firestore security rules deployed to all environments
- [ ] Service account keys have minimal required permissions
- [ ] Secrets are rotated regularly (every 90 days)
- [ ] Local `.env` files are gitignored
- [ ] Firebase projects have different owner accounts or tight IAM controls
- [ ] Monitoring and alerting set up for production

---

## Troubleshooting

### Secret Not Found Error

If you get "secret not found" error:
1. Verify secret name matches exactly (case-sensitive)
2. Check if secret is at repository level or environment level
3. Ensure workflow has access to environment secrets

### Firebase Configuration Error

If Firebase initialization fails:
1. Verify the Firebase options file content is valid Dart code
2. Check that all required fields are present
3. Ensure project IDs match in Firebase Console and secrets

### Build Fails in CI

If builds fail in CI but work locally:
1. Check that all required secrets are set
2. Verify Flutter version matches local setup
3. Review CI logs for specific error messages
4. Test with `act` locally to reproduce

---

## Maintenance

### Rotating Secrets

Recommended schedule:
- **Every 90 days**: Rotate service account keys
- **Every 180 days**: Regenerate signing certificates
- **Immediately**: If a secret is compromised

### Updating Firebase Configuration

When updating Firebase settings:
1. Regenerate Firebase options with `flutterfire configure`
2. Update corresponding GitHub secrets
3. Test in staging before production
4. Deploy with a new version number

---

## Support

For questions or issues:
- **Firebase**: [Firebase Support](https://firebase.google.com/support)
- **GitHub Actions**: [GitHub Docs](https://docs.github.com/en/actions)
- **Team Slack**: #faiseur-dev channel

**Last Updated**: October 19, 2025
