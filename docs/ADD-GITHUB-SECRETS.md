# Adding GitHub Secrets for Firebase Credentials

## Current Status

✅ **Already Configured:**
- `FIREBASE_PROJECT_ID_PROD`
- `FIREBASE_PROJECT_ID_STAGING`
- `FIREBASE_SERVICE_ACCOUNT_PROD`
- `FIREBASE_SERVICE_ACCOUNT_STAGING`

⚠️ **Still Needed (11 secrets):**

These individual Firebase credentials must be added for the CI/CD workflows to build successfully.

## Why These Secrets?

The CI/CD workflows create a `.env` file during builds using these secrets:
- `deploy-production.yml` reads `PROD_FIREBASE_*` secrets to build the `.env` file
- `deploy-staging.yml` reads `STAGING_FIREBASE_*` secrets to build the `.env` file
- Then `flutter pub get` loads these values via `flutter_dotenv`
- `lib/firebase_options_prod.dart` and `lib/firebase_options_staging.dart` read them

Without these secrets, the build fails with: `Undefined name 'DefaultFirebaseOptions'`

## Adding the Secrets

Go to: **GitHub Repository → Settings → Secrets and variables → Actions**

Click **New repository secret** for each of these:

### Production Secrets (PROD_FIREBASE_*)

From your local `.env` file or Firebase Console:

| Secret Name | Value | Source |
|---|---|---|
| `PROD_FIREBASE_API_KEY` | `AIzaSyA9nYA6THfK2euIOjO0KORDfgXgNUFW-Rw` | `.env` file (PROD_FIREBASE_API_KEY) |
| `PROD_FIREBASE_APP_ID_WEB` | `1:406108331781:web:5b3eb44dfc61142860a16c` | `.env` file (PROD_FIREBASE_APP_ID_WEB) |
| `PROD_FIREBASE_APP_ID_ANDROID` | Get from `.env` | `.env` file (PROD_FIREBASE_APP_ID_ANDROID) |
| `PROD_FIREBASE_APP_ID_IOS` | Get from `.env` | `.env` file (PROD_FIREBASE_APP_ID_IOS) |
| `PROD_FIREBASE_APP_ID_MACOS` | Get from `.env` | `.env` file (PROD_FIREBASE_APP_ID_MACOS) |
| `PROD_FIREBASE_AUTH_DOMAIN` | `faiseur.firebaseapp.com` | `.env` file (PROD_FIREBASE_AUTH_DOMAIN) |
| `PROD_FIREBASE_DATABASE_URL` | `https://faiseur.firebaseio.com` | `.env` file (PROD_FIREBASE_DATABASE_URL) |
| `PROD_FIREBASE_STORAGE_BUCKET` | `faiseur.appspot.com` | `.env` file (PROD_FIREBASE_STORAGE_BUCKET) |
| `PROD_FIREBASE_MESSAGING_SENDER_ID` | `406108331781` | `.env` file (PROD_FIREBASE_MESSAGING_SENDER_ID) |
| `PROD_FIREBASE_MEASUREMENT_ID` | Get from `.env` or Firebase | `.env` file (PROD_FIREBASE_MEASUREMENT_ID) |

### Staging Secrets (STAGING_FIREBASE_*)

From your local `.env` file or Firebase Console:

| Secret Name | Value | Source |
|---|---|---|
| `STAGING_FIREBASE_API_KEY` | `AIzaSyC4A-yi-F5ckIRWSHWWo4i4idwSfJBFF-k` | `.env` file (STAGING_FIREBASE_API_KEY) |
| `STAGING_FIREBASE_APP_ID_WEB` | `1:987894355541:web:8b9880882a3544c4bda6dc` | `.env` file (STAGING_FIREBASE_APP_ID_WEB) |
| `STAGING_FIREBASE_APP_ID_ANDROID` | Get from `.env` | `.env` file (STAGING_FIREBASE_APP_ID_ANDROID) |
| `STAGING_FIREBASE_APP_ID_IOS` | Get from `.env` | `.env` file (STAGING_FIREBASE_APP_ID_IOS) |
| `STAGING_FIREBASE_APP_ID_MACOS` | Get from `.env` | `.env` file (STAGING_FIREBASE_APP_ID_MACOS) |
| `STAGING_FIREBASE_AUTH_DOMAIN` | `faiseur-staging.firebaseapp.com` | `.env` file (STAGING_FIREBASE_AUTH_DOMAIN) |
| `STAGING_FIREBASE_DATABASE_URL` | `https://faiseur-staging.firebaseio.com` | `.env` file (STAGING_FIREBASE_DATABASE_URL) |
| `STAGING_FIREBASE_STORAGE_BUCKET` | `faiseur-staging.appspot.com` | `.env` file (STAGING_FIREBASE_STORAGE_BUCKET) |
| `STAGING_FIREBASE_MESSAGING_SENDER_ID` | `987894355541` | `.env` file (STAGING_FIREBASE_MESSAGING_SENDER_ID) |
| `STAGING_FIREBASE_MEASUREMENT_ID` | Get from `.env` or Firebase | `.env` file (STAGING_FIREBASE_MEASUREMENT_ID) |

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

Once all secrets are added:

1. ✅ Commit and push a change to test the workflow
2. ✅ Monitor the deployment to verify it succeeds
3. ✅ Set up branch protection rules
4. ✅ Begin Phase 1.2: Core Domain Models

---

**Questions?** Check the GitHub Actions logs in the "Actions" tab of your repository. Failed workflows show which step failed and why.
