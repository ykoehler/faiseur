# Faiseur - Flutter Todo App Workspace Instructions

## Project Overview
Cross-platform todo app built with Flutter and Firebase supporting web, macOS, iOS, and Android.

## Technology Stack
- Flutter SDK (latest stable)
- Firebase (Firestore, Auth, Cloud Functions)
- Riverpod for state management
- Go Router for navigation
- Clean architecture pattern

## Development Priorities
- Web platform for initial debugging
- Follow clean architecture principles
- Implement comprehensive planning documents before coding

## Progress Checklist
- [x] Create copilot-instructions.md
- [x] Get Flutter project setup information
- [x] Scaffold Flutter project
- [x] Create planning documents (requirements, design, architecture, implementation plan)
- [x] Update dependencies in pubspec.yaml
- [x] Install dependencies
- [x] Verify compilation
- [x] Create CI/CD workflows (PR validation, staging, production)
- [x] Create environment management documentation
- [x] Create firebase_config.dart helper
- [x] Update main.dart with environment-aware initialization
- [ ] Configure Firebase for all platforms (dev, staging, production)
- [ ] Configure GitHub secrets
- [ ] Set up branch protection rules
- [ ] Test CI/CD pipeline
- [ ] Begin Phase 1 implementation

## Next Steps

### Immediate Next Actions

1. **Create Firebase Projects** (see `docs/firebase-setup.md`)
   - Create `faiseur-dev` project
   - Create `faiseur-staging` project  
   - Create `faiseur` project (production)
   - Enable Auth, Firestore, Storage, Hosting for each

2. **Configure Firebase with FlutterFire CLI**
   ```bash
   # Install FlutterFire CLI
   dart pub global activate flutterfire_cli
   
   # Configure each environment
   flutterfire configure --project=faiseur-dev --out=lib/firebase_options_dev.dart
   flutterfire configure --project=faiseur-staging --out=lib/firebase_options_staging.dart
   flutterfire configure --project=faiseur --out=lib/firebase_options_prod.dart
   ```

3. **Configure GitHub Secrets** (see `docs/github-secrets-setup.md`)
   - Add all Firebase configuration secrets
   - Add iOS signing secrets (for App Store)
   - Add Android keystore secrets (for Play Store)
   - Add service account keys
   - Optional: Add Slack webhook for notifications

4. **Set Up Branch Protection**
   - Protect `develop` branch (require 1 approval)
   - Protect `main` branch (require 2 approvals)
   - Require status checks to pass
   - Require conversations to be resolved

5. **Test CI/CD Pipeline**
   - Create feature branch
   - Make small change
   - Open PR to develop
   - Verify all CI checks pass
   - Merge and verify staging deployment

6. **Begin Phase 1.2**: Start implementing core domain models (see `docs/implementation-plan.md`)

### Phase 1 Implementation Order
Refer to `docs/implementation-plan.md` for detailed step-by-step implementation guide.

## Key Files

### Documentation
- `docs/requirements.md` - Complete feature requirements (100+ requirements)
- `docs/design.md` - UI/UX design specifications with user personas
- `docs/architecture.md` - Technical architecture details with Firestore schema
- `docs/implementation-plan.md` - Development roadmap (4 phases, 21-29 weeks)
- `docs/firebase-setup.md` - Firebase configuration instructions
- `docs/github-secrets-setup.md` - Environment and secrets management guide
- `AGENTS.md` - AI coding assistant best practices
- `README.md` - Project overview and setup instructions

### Configuration
- `pubspec.yaml` - Dependencies (Firebase, Riverpod, Freezed, Go Router, etc.)
- `.github/workflows/pr-ci.yml` - PR validation workflow (7 jobs)
- `.github/workflows/deploy-staging.yml` - Staging deployment (develop branch)
- `.github/workflows/deploy-production.yml` - Production deployment (main branch)

### Core Application Files
- `lib/main.dart` - App entry point with environment-aware Firebase initialization
- `lib/firebase_config.dart` - Environment configuration helper (dev/staging/prod)

## Coding Guidelines
- Follow clean architecture principles
- Use Riverpod for all state management
- Implement offline-first data layer
- Write tests for all features (target >80% coverage)
- Use Freezed for all data models
- Follow Material Design 3 guidelines
- Ensure accessibility compliance (WCAG 2.1 AA)

## Firebase Configuration Notes
When configuring Firebase:
- Create separate projects for dev/staging/prod
- Enable Authentication (Email/Password, Anonymous)
- Enable Cloud Firestore
- Enable Firebase Storage
- Set up Cloud Functions
- Configure security rules (see `docs/architecture.md`)

## Testing Strategy
- Unit tests for business logic
- Widget tests for UI components
- Integration tests for critical flows
- E2E tests for release validation

## Development Workflow
1. Review planning documents before starting a feature
2. Create feature branch from `develop`
3. Implement following clean architecture
4. Write tests alongside implementation
5. Run `flutter analyze` and `flutter test`
6. Create PR for review
7. Merge to `develop` after approval

## Platform Notes
- **Web**: Primary development platform, use Chrome for debugging
- **macOS**: Test desktop experience regularly
- **iOS**: Requires Xcode and Apple Developer account
- **Android**: Requires Android Studio and Google Play Console account
