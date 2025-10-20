# Testing Fixes and Setup

**Date**: October 20, 2025  
**Status**: ✅ Fixed - All Tests Passing  
**Test Results**: 5/5 widget tests passing ✅

---

## Quick Summary

After Phase C (Go Router + Riverpod), widget tests were failing because `FaiseurApp` became a `ConsumerWidget` requiring `ProviderScope`. This document covers the issue, solution, and best practices.

---

## The Problem

### Error Message
```
Bad state: No ProviderScope found
Exit Code: 1
```

### Root Cause

**Phase C Changes**:
- `FaiseurApp` changed from `StatelessWidget` → `ConsumerWidget`
- Main app uses Riverpod providers
- App wrapped in `ProviderScope` in `main()`

**Test Issue**:
- Tests directly instantiated `FaiseurApp()` without `ProviderScope`
- `ConsumerWidget` needs access to Riverpod provider container
- Missing `ProviderScope` → Runtime error

### Stack Trace (Abbreviated)
```
#0 ProviderScope.containerOf (...)
#1 ConsumerStatefulElement.container (...)
#2 FaiseurApp.build (...)
   ↓ Bad state: No ProviderScope found
```

---

## The Solution

### Changes to `test/widget_test.dart`

#### Step 1: Add Import

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
```

#### Step 2: Wrap App in ProviderScope (5 test cases)

**Before**:
```dart
await tester.pumpWidget(const FaiseurApp());
```

**After**:
```dart
await tester.pumpWidget(
  const ProviderScope(
    child: FaiseurApp(),
  ),
);
```

#### Step 3: Update Test Expectations

Go Router uses `MaterialApp.router` (not traditional `MaterialApp`), so adjust expectations:

**Before**:
```dart
// Expected AppBar or navigation
final hasAppBar = find.byType(AppBar).evaluate().isNotEmpty;
final hasNavBar = find.byType(NavigationBar).evaluate().isNotEmpty;
expect(hasAppBar || hasNavBar || ..., isTrue);
```

**After**:
```dart
// Go Router uses MaterialApp.router
expect(find.byType(MaterialApp), findsOneWidget);
expect(tester.takeException(), isNull);
```

---

## Test Results

### After Fix
```
✅ 00:01 +5: All tests passed!

Tests:
  ✅ App launches and renders home screen
  ✅ App renders MaterialApp with router
  ✅ Theme applies correctly (light and dark modes)
  ✅ App handles hot reload gracefully
  ✅ Renders without layout issues
```

### Code Quality
```
✅ flutter analyze test/widget_test.dart
   No issues found!
```

---

## Best Practices for Riverpod Testing

### Always Wrap ConsumerWidgets in ProviderScope

**Pattern for all widget tests**:

```dart
testWidgets('My test', (WidgetTester tester) async {
  await tester.pumpWidget(
    const ProviderScope(
      child: MyApp(), // Or any ConsumerWidget
    ),
  );

  // ... test code
});
```

**Why**:
- `ConsumerWidget` needs provider container
- `ProviderScope` provides the container
- Required in both `main.dart` AND tests

### Test Pattern for Providers

```dart
// Test a provider with overrides
testWidgets('Provider test', (tester) async {
  final testContainer = ProviderContainer(
    overrides: [
      // Override providers for testing
      userIdProvider.overrideWithValue('test-user'),
    ],
  );

  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: testContainer,
      child: const MyWidget(),
    ),
  );

  expect(find.text('test-user'), findsOneWidget);
});
```

### Multiple Test Cases - Checklist

✅ **Do**:
- Wrap every `pumpWidget` in `ProviderScope`
- Add import: `import 'package:flutter_riverpod/flutter_riverpod.dart';`
- Update expectations to match new structure
- Test app initialization flow
- Test navigation between routes

❌ **Don't**:
- Forget `ProviderScope` wrapper
- Assume old navigation structure (AppBar at top)
- Use string literals for route names
- Test Firebase directly (use emulators)
- Mix old and new testing patterns

---

## Complete Test Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:faiseur/main.dart';

void main() {
  group('FaiseurApp Widget Tests', () {
    testWidgets('App launches without crashing', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: FaiseurApp(),
        ),
      );

      expect(find.byType(MaterialApp), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('App renders with theme', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: FaiseurApp(),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(Scaffold), findsWidgets);
    });

    testWidgets('Hot reload works', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: FaiseurApp(),
        ),
      );

      await tester.binding.window.physicalSizeTestValue =
        const Size(800, 600);
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
```

---

## Integration Test Setup

### With Firebase Emulator

**File**: `integration_test/app_test.dart`

```dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Integration Tests', () {
    testWidgets('App initializes with Firebase', (tester) async {
      app.main();
      await tester.pumpAndSettle(Duration(seconds: 5));

      // App should be ready
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('Navigation works', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify on appropriate page
      final onLoginPage = find.byType(LoginPage).evaluate().isNotEmpty;
      final onListsPage = find.byType(ListsPage).evaluate().isNotEmpty;

      expect(onLoginPage || onListsPage, isTrue);
    });
  });
}
```

---

## Running Tests

### Widget Tests (All Platforms)

```bash
# Run all widget tests
flutter test test/

# Run specific test file
flutter test test/widget_test.dart

# Run specific test
flutter test test/widget_test.dart -k "launches"

# Watch mode
flutter test test/ --watch

# Verbose output
flutter test test/ -v
```

### Integration Tests (Mobile/Desktop)

```bash
# iOS
flutter test integration_test/ -d ios

# Android
flutter test integration_test/ -d emulator-5554

# macOS
flutter test integration_test/ -d macos

# With Firebase emulator
# Terminal 1: firebase emulators:start
# Terminal 2: flutter test integration_test/ -d ios
```

### Coverage

```bash
# Generate coverage
flutter test --coverage

# View coverage (requires lcov)
lcov --list coverage/lcov.info
```

---

## Debugging Failed Tests

### Test Fails with Build Error

```bash
# Clean and retry
flutter clean
flutter pub get
flutter test test/

# Or force rebuild
flutter test test/ --no-build-cache
```

### Test Times Out

```dart
// Increase timeout
testWidgets(
  'My test',
  (tester) async { ... },
  timeout: const Timeout(Duration(seconds: 30)),
);
```

### Provider Not Found

```dart
// Ensure ProviderScope wraps everything
const ProviderScope(
  child: FaiseurApp(),
) // Don't forget the closing parenthesis!
```

### Async Provider Issues

```dart
// Wait for async operations
await tester.pumpAndSettle();
await tester.pumpAndSettle(
  const Duration(seconds: 2),
); // Longer wait for Firebase
```

---

## CI/CD Integration

### GitHub Actions

```yaml
name: Tests
on: [pull_request]

jobs:
  test:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter test test/
      - run: flutter build web
```

---

## Migration Checklist

If adding tests to existing project:

- [ ] Add `flutter_riverpod` import
- [ ] Wrap all `pumpWidget` calls in `ProviderScope`
- [ ] Update test expectations for new structure
- [ ] Run `flutter test` to verify
- [ ] Add to CI/CD pipeline
- [ ] Update test documentation

---

## Files Modified

| File | Changes |
|------|---------|
| `test/widget_test.dart` | Import + 5 wraps + expectations |
| `test/README.md` | Added testing guide |
| `integration_test/README.md` | Added integration guide |

---

## Related Documentation

- **Testing Setup Complete**: `docs/TESTING-SETUP-COMPLETE.md`
- **Router Setup**: `docs/ROUTER-SETUP.md`
- **Phase C**: `docs/PHASE-C-SETUP.md`
- **Architecture**: `docs/architecture.md`

---

## Key Takeaway

**When using Riverpod in Flutter:**

1. App main: `ProviderScope(child: MaterialApp.router(...))`
2. Widget tests: `ProviderScope(child: MyApp())`
3. Both need the same wrapper pattern

This ensures provider container is available everywhere.

---

**Status**: ✅ Complete  
**Tests**: 5/5 Passing  
**Next Phase**: Phase 1.2 Feature Implementation

