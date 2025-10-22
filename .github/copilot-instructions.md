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
