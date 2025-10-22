# Phase B: Riverpod State Management Setup

**Date**: October 19-20, 2025  
**Status**: Planning & Ready to Implement  
**Duration**: ~2-3 hours  
**Complexity**: Medium

---

## Executive Summary

Phase B establishes Riverpod state management infrastructure for the entire Faiseur app. This
phase sets up the code generation pipeline and creates example providers that will be used by
all features in subsequent phases.

**Objective**: Enable Riverpod-based state management by creating shared providers infrastructure,
running code generation, and verifying everything works correctly.

---

## What This Phase Accomplishes

### ✅ Provides the Foundation For
- ✅ All feature-specific providers (Auth, Todos, Lists, etc.)
- ✅ Global app state management (initialization, errors, theme)
- ✅ Firebase service integration via dependency injection
- ✅ Hot reload and code generation workflow

### ✅ Creates
1. **Shared Models** - Freezed immutable app state model
2. **Firebase Providers** - Singleton instances for Firebase services
3. **App Providers** - App-level providers for initialization and error handling
4. **Code Generation** - Automatic `.g.dart` and `.freezed.dart` files

---

## Quick Start (2-3 hours)

### Step 1: Create Shared Providers Infrastructure (45 min)

**Files to create** (~240 lines total):

```
lib/shared/models/
  └── app_state_model.dart        (80 lines, Freezed)

lib/shared/providers/
  ├── firebase_providers.dart     (60 lines, Firebase singletons)
  └── app_providers.dart          (100 lines, App-level providers)
```

**Key Classes**:
- `AppState` - Freezed class for app-level state (isInitialized, currentUser, isLoading, error)
- `firebaseAppProvider` - Singleton Firebase App instance
- `firestoreProvider` - Singleton Firestore instance
- `firebaseAuthProvider` - Singleton Firebase Auth instance
- `appStateProvider` - App state management provider
- `isAuthenticatedProvider` - Boolean auth state
- `currentUserIdProvider` - Current user ID

### Step 2: Run Code Generation (10 min)

```bash
dart run build_runner build
```

**Creates**:
- `app_providers.g.dart` - Provider code generation
- `firebase_providers.g.dart` - Provider code generation
- `app_state_model.freezed.dart` - Freezed code generation

### Step 3: Verify & Test (20 min)

```bash
flutter analyze        # Should have 0 errors
flutter build web     # Should build successfully
flutter test test/    # Existing tests should pass
```

### Step 4: Documentation (30 min)

Create or update:
- Provider usage patterns in code comments
- Usage examples in README
- Architecture integration notes

**Total**: ~2-2.5 hours

---

## Detailed Implementation Plan

### Part 1: Core Provider Classes

#### `lib/shared/models/app_state_model.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state_model.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(false) bool isInitialized,
    @Default(false) bool isLoading,
    @Default(null) String? currentUserId,
    @Default(null) String? errorMessage,
  }) = _AppState;
}
```

**Purpose**: Immutable app state representation
- `isInitialized` - Whether app finished startup
- `isLoading` - Global loading indicator
- `currentUserId` - Authenticated user ID (null if not authed)
- `errorMessage` - Global error message (null if no error)

#### `lib/shared/providers/firebase_providers.dart`

```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_providers.g.dart';

@riverpod(keepAlive: true)
FirebaseApp firebaseApp(FirebaseAppRef ref) {
  // Return Firebase.app() - already initialized in main.dart
  return Firebase.app();
}

@riverpod(keepAlive: true)
FirebaseFirestore firestore(FirestoreRef ref) {
  // Watch firebaseApp to ensure it's initialized
  ref.watch(firebaseAppProvider);
  return FirebaseFirestore.instance;
}

@riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  // Watch firebaseApp to ensure it's initialized
  ref.watch(firebaseAppProvider);
  return FirebaseAuth.instance;
}
```

**Purpose**: Singleton Firebase service instances
- `keepAlive: true` prevents garbage collection
- Firebase best practice: single instance per app
- Providers depend on each other for proper initialization order

#### `lib/shared/providers/app_providers.dart`

```dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/app_state_model.dart';
import 'firebase_providers.dart';

part 'app_providers.g.dart';

@riverpod(keepAlive: true)
Future<void> appInitialization(AppInitializationRef ref) async {
  // Watch Firebase providers to ensure they initialize
  await ref.watch(firebaseAppProvider).whenComplete(() => {});
  
  // Any other initialization logic goes here
  // (theme loading, settings, etc.)
}

@riverpod
Future<String?> currentUserId(CurrentUserIdRef ref) async {
  final auth = ref.watch(firebaseAuthProvider);
  return auth.currentUser?.uid;
}

@riverpod
Future<bool> isAuthenticated(IsAuthenticatedRef ref) async {
  final userId = await ref.watch(currentUserIdRef.future);
  return userId != null;
}

@riverpod
Future<AppState> appState(AppStateRef ref) async {
  final isInit = await ref.watch(appInitializationRef.future);
  final userId = await ref.watch(currentUserIdRef.future);
  
  return AppState(
    isInitialized: true,
    currentUserId: userId,
    isLoading: false,
  );
}
```

**Purpose**: App-level state and initialization
- `appInitialization` - Async provider that runs during startup
- `currentUserId` - Watches Firebase Auth for current user
- `isAuthenticated` - Simple boolean derived from currentUserId
- `appState` - Complete app state in one place

---

### Part 2: Code Generation Workflow

#### What is `@riverpod`?

The `@riverpod` annotation tells Riverpod's code generator to create:
1. A provider class (e.g., `currentUserIdProvider`)
2. A reference class for callbacks (e.g., `CurrentUserIdRef`)
3. Proper type safety and IDE support

**Before code generation**:
```dart
@riverpod
Future<String?> currentUserId(CurrentUserIdRef ref) async { ... }
```

**After code generation** (in `.g.dart`):
```dart
// Automatically generated
final currentUserIdProvider = FutureProvider<String?>(...)
class CurrentUserIdRef { ... }
```

#### Running Code Generation

```bash
# One-time build
dart run build_runner build

# Watch mode (auto-regenerate on changes)
dart run build_runner watch

# Clean cache if issues arise
dart run build_runner clean
flutter clean
```

---

## Key Technical Decisions

### ✅ Decision 1: Use New `@riverpod` Annotation Style

**Why**: Type-safe, auto-generated, IDE support, Riverpod's recommended approach

**Alternative**: Old `Provider()` style (less type-safe, no code generation)

**Impact**: Requires `build_runner`, but generates excellent code

### ✅ Decision 2: Firebase as Singletons

**Why**: Firebase instances should be shared app-wide, prevents memory leaks

**Alternative**: Fresh instance per provider (inefficient, wasteful)

**Pattern**: `@riverpod(keepAlive: true)` prevents garbage collection

### ✅ Decision 3: Async Providers for Firebase

**Why**: Natural async/await syntax, automatic error handling, loading states

**Alternative**: Synchronous providers (Firebase can't be sync)

**Pattern**: Return `Future<T>` and let Riverpod handle AsyncValue

---

## Dependency Graph

```
Firebase Services (Singletons - keepAlive: true)
├── firebaseApp
├── firestore (depends on: firebaseApp)
└── firebaseAuth (depends on: firebaseApp)
        ↓
    App Initialization
├── appInitialization (depends on: firebaseApp)
├── currentUserId (depends on: firebaseAuth)
├── isAuthenticated (depends on: currentUserId)
└── appState (depends on: all of above)
```

---

## Integration with Other Phases

### Phase C: Go Router Navigation
- Uses `isAuthenticatedProvider` for route guards
- Uses `appInitializationProvider` for splash screen
- Depends on: Phase B providers ✅

### Phase 1.2: Feature Implementation
- Features create their own providers
- Features depend on shared Firebase providers
- Follow same `@riverpod` patterns
- Depends on: Phase B patterns ✅

---

## Success Criteria

### ✅ Must Have
- [ ] Code compiles: `flutter analyze` = 0 errors
- [ ] Web builds: `flutter build web` succeeds
- [ ] Providers generate: `*.g.dart` files created
- [ ] Tests pass: `flutter test test/` = 5/5 passing
- [ ] Generated files ignored: `.gitignore` has `**.g.dart`

### ✅ Quality Checks
- [ ] No circular dependencies between providers
- [ ] Proper dependency injection order
- [ ] Error handling in all async providers
- [ ] Documentation comments on all providers

### ✅ Verification
- [ ] Manual testing: App initializes without errors
- [ ] Hot reload works: Change provider code, hot reload works
- [ ] Build succeeds on all platforms tested

---

## What We're NOT Doing (Yet)

❌ Feature-specific providers (Auth, Todos, Lists) - Phase 1.2  
❌ State listeners in UI widgets - Phase 1.2+  
❌ Unit tests for providers - Phase D  
❌ Analytics integration - Phase D  
❌ Complex state mutations - Phase 1.2+  

---

## Rollback Plan

If anything goes wrong:

```bash
# Clean everything
dart run build_runner clean
flutter clean
flutter pub get

# Or restore from git
git restore lib/shared/
git restore pubspec.yaml
```

**Very low risk** - Changes are isolated and easily reversible

---

## File Structure After Phase B

```
faiseur/
├── lib/
│   ├── shared/
│   │   ├── models/
│   │   │   ├── app_state_model.dart          ← NEW
│   │   │   └── app_state_model.freezed.dart  ← GENERATED
│   │   └── providers/
│   │       ├── firebase_providers.dart       ← NEW
│   │       ├── firebase_providers.g.dart     ← GENERATED
│   │       ├── app_providers.dart            ← NEW
│   │       └── app_providers.g.dart          ← GENERATED
│   ├── core/                                  (FROM PHASE A)
│   ├── features/                              (READY FOR PHASE 1.2)
│   ├── routing/                               (READY FOR PHASE C)
│   └── main.dart                              (NO CHANGES)
│
├── pubspec.yaml                               (VERIFY DEPENDENCIES)
└── .gitignore                                 (VERIFY PATTERNS)
```

---

## Common Issues & Solutions

| Issue | Solution |
|-------|----------|
| `Cannot find module for annotation` | Run `flutter pub get` then `dart run build_runner build` |
| `Circular dependency detected` | Check provider dependencies - move to separate providers |
| `Generated file not updating` | Run `dart run build_runner clean` then `build` again |
| `Provider not found at runtime` | Ensure `pub get` ran after modifying providers |
| `Build takes too long` | Move non-Firebase logic out of `@riverpod` functions |

---

## Next Steps

### Before Phase B
1. Review this plan
2. Confirm approach
3. Ready to proceed?

### During Phase B
1. Create the 3 files (models + providers)
2. Run code generation
3. Run tests and analysis
4. Document patterns

### After Phase B
**Proceed to Phase C**: Go Router Navigation Setup

---

## Questions & Clarifications

### Q: Why `keepAlive: true` for Firebase?
**A**: Firebase instances are expensive to create. `keepAlive: true` prevents Riverpod from
garbage collecting them, keeping them in memory for the app lifetime.

### Q: What if Firebase initialization fails?
**A**: `firebaseApp` will throw an error. The error will propagate to dependents. Phase C's
splash screen catches this and shows error state.

### Q: Can I create feature providers now?
**A**: Better to wait for Phase 1.2. This phase focuses on shared infrastructure. Feature
providers will follow the same pattern.

### Q: How do I access these providers in widgets?
**A**: Use `ref.watch(providerName)` in `ConsumerWidget`. Phase 1.2 will show examples.

---

## References

- **Riverpod Docs**: <https://riverpod.dev>
- **Code Generation**: <https://riverpod.dev/docs/essentials/side_effects>
- **Architecture**: `docs/architecture.md`
- **Implementation Plan**: `docs/implementation-plan.md`

---

**Status**: 📋 Ready for Implementation  
**Next Phase**: Phase C (Go Router Navigation)  
**Est. Completion**: October 20-21, 2025
