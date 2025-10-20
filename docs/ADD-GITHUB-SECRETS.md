# Adding GitHub Secrets for Firebase Credentials

## Current Status

✅ **Already Configured (4 secrets - to be renamed):**
- `FIREBASE_PROJECT_ID_PROD` → rename to `PROD_FIREBASE_PROJECT_ID`
- `FIREBASE_PROJECT_ID_STAGING` → rename to `STAGING_FIREBASE_PROJECT_ID`
- `FIREBASE_SERVICE_ACCOUNT_PROD` → rename to `PROD_FIREBASE_SERVICE_ACCOUNT`
- `FIREBASE_SERVICE_ACCOUNT_STAGING` → rename to `STAGING_FIREBASE_SERVICE_ACCOUNT`

⚠️ **Still Needed (10 new secrets for web-only deployment):**

Since Faiseur currently deploys **web only**, you only need the web-specific Firebase credentials. Mobile (Android, iOS, macOS) secrets are not required yet.

## Why These Secrets?

The CI/CD workflows create a `.env` file during builds using these secrets:
- `deploy-production.yml` reads `PROD_FIREBASE_*` secrets to build the `.env` file
- `deploy-staging.yml` reads `STAGING_FIREBASE_*` secrets to build the `.env` file
- Then `flutter pub get` loads these values via `flutter_dotenv`
- `lib/firebase_options_prod.dart` reads the **web** configuration

Web builds only use 6 fields from `FirebaseOptions`:
- `apiKey` ← `PROD_FIREBASE_API_KEY`
- `appId` ← `PROD_FIREBASE_APP_ID_WEB`
- `messagingSenderId` ← `PROD_FIREBASE_MESSAGING_SENDER_ID`
- `projectId` ← `PROD_FIREBASE_PROJECT_ID`
- `authDomain` ← `PROD_FIREBASE_AUTH_DOMAIN`
- `storageBucket` ← `PROD_FIREBASE_STORAGE_BUCKET`

Without these secrets, the build fails with: `Undefined name 'DefaultFirebaseOptions'`

## Adding the Secrets

Go to: **GitHub Repository → Settings → Secrets and variables → Actions**

Click **New repository secret** for each of these:

### Production Secrets (PROD_FIREBASE_*)

For web deployment, add these 5 values to GitHub Secrets:

| Secret Name | Value |
|---|---|
| `PROD_FIREBASE_PROJECT_ID` | `faiseur` |
| `PROD_FIREBASE_API_KEY` | `AIzaSyA9nYA6THfK2euIOjO0KORDfgXgNUFW-Rw` |
| `PROD_FIREBASE_APP_ID_WEB` | `1:406108331781:web:5b3eb44dfc61142860a16c` |
| `PROD_FIREBASE_AUTH_DOMAIN` | `faiseur.firebaseapp.com` |
| `PROD_FIREBASE_STORAGE_BUCKET` | `faiseur.appspot.com` |
| `PROD_FIREBASE_MESSAGING_SENDER_ID` | `406108331781` |

### Staging Secrets (STAGING_FIREBASE_*)

For web deployment, add these 5 values to GitHub Secrets:

| Secret Name | Value |
|---|---|
| `STAGING_FIREBASE_PROJECT_ID` | `faiseur-staging` |
| `STAGING_FIREBASE_API_KEY` | `AIzaSyC4A-yi-F5ckIRWSHWWo4i4idwSfJBFF-k` |
| `STAGING_FIREBASE_APP_ID_WEB` | `1:987894355541:web:8b9880882a3544c4bda6dc` |
| `STAGING_FIREBASE_AUTH_DOMAIN` | `faiseur-staging.firebaseapp.com` |
| `STAGING_FIREBASE_STORAGE_BUCKET` | `faiseur-staging.appspot.com` |
| `STAGING_FIREBASE_MESSAGING_SENDER_ID` | `987894355541` |

## How to Get These Values

### Option 1: From Your Local .env File (Easiest)

```bash
# Show all secrets for production
grep "^PROD_FIREBASE" .env

# Show all secrets for staging
grep "^STAGING_FIREBASE" .env
```

### Option 2: From Firebase Console

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project (faiseur, faiseur-staging, or faiseur-dev)
3. Click **Project Settings** (gear icon)
4. Under "Your apps", find your Web app
5. Click "Config" or the code icon
6. Copy the values shown

### Option 3: From FlutterFire CLI

```bash
# For production
flutterfire configure --project=faiseur --list-platforms

# For staging
flutterfire configure --project=faiseur-staging --list-platforms
```

## Quick Copy-Paste Instructions

1. Open your terminal and show the .env file values:
   ```bash
   cat .env | grep "PROD_FIREBASE\|STAGING_FIREBASE" | sort
   ```

2. For each secret in the tables above:
   - Go to GitHub Secrets page
   - Click "New repository secret"
   - **Name**: Use the secret name exactly (case-sensitive)
   - **Value**: Copy the value from `.env` file
   - Click "Add secret"

3. After adding all secrets, verify:
   ```bash
   gh secret list | grep FIREBASE
   ```

## Testing After Adding Secrets

Once you've added the secrets:

1. **Verify locally** that the app still builds:
   ```bash
   flutter clean
   flutter pub get
   flutter build web --release --dart-define=FLAVOR=production
   ```

2. **Trigger a workflow test** by creating a test PR:
   ```bash
   git checkout -b test/secrets
   touch docs/test.md
   git add docs/test.md
   git commit -m "test: trigger CI workflow"
   git push origin test/secrets
   ```

3. **Open PR** to `main` and watch the workflow run
   - Check that the "Deploy to Production" job passes
   - Verify it says "Build web for production" completed
   - If it fails, check the logs for which secret is missing

## Troubleshooting

### Error: "Undefined name 'DefaultFirebaseOptions'"

**Cause**: The `.env` file wasn't created (secrets are missing)

**Fix**: 
1. Check if all `PROD_FIREBASE_*` or `STAGING_FIREBASE_*` secrets exist
2. Verify secret names match exactly (including underscores and capitalization)
3. Re-run the workflow after adding secrets

### Error: "secret not found"

**Cause**: A secret you referenced in the workflow doesn't exist

**Fix**:
1. List all secrets: `gh secret list`
2. Check spelling and capitalization
3. Add the missing secret

### Build succeeds but deployment fails

**Cause**: The web app builds but Firebase initialization fails at runtime

**Fix**:
1. Check that `FIREBASE_PROJECT_ID_PROD` matches the actual project ID
2. Verify the API key is valid in Firebase Console
3. Check Firebase Hosting is enabled for the project

## Security Notes

⚠️ **IMPORTANT**: Never commit actual secret values to Git!

- The `.env` file is in `.gitignore` - never commit it
- Secret names are OK to reference in code/workflows (the tool displays them)
- Secret values are never shown in logs (GitHub redacts them)
- Only you can read secret values from the repository settings

## What's Next?

Once all 10 web secrets are added:

1. ✅ Commit and push a change to test the workflow
2. ✅ Monitor the deployment to verify it succeeds
3. ✅ Set up branch protection rules
4. ✅ Begin Phase 1.2: Core Domain Models

### When Adding Mobile Platforms (Future)

When you add Android, iOS, or macOS deployment, you'll also need:
- `PROD_FIREBASE_APP_ID_ANDROID`
- `PROD_FIREBASE_APP_ID_IOS`
- `PROD_FIREBASE_APP_ID_MACOS`
- `PROD_FIREBASE_DATABASE_URL`
- (Same 5 for STAGING_FIREBASE_*)

---

**Questions?** Check the GitHub Actions logs in the "Actions" tab of your repository. Failed workflows show which step failed and why.
