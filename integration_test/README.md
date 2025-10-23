# Integration Tests

This directory contains Flutter integration tests for the Faiseur app. These tests
run against the actual Flutter app (not mocked), making them ideal for smoke tests,
E2E flows, and platform-specific testing.

## Overview

- **app_test.dart**: Smoke tests that verify the app launches, renders, and handles basic operations
  - App loads and renders without crashing
  - Navigation widgets are present
  - Theme system applies correctly
  - App handles hot reload
  - Responsive behavior works

- **web_e2e_test.dart**: Comprehensive end-to-end tests for web platform
  - **Initialization Tests**: Firebase setup, provider initialization, splash screen handling
  - **Navigation Tests**: Router initialization, responsive design (desktop/tablet/mobile)
  - **UI/UX Tests**: Material 3 theme, layout issues, text rendering
  - **Performance Tests**: Initialization time, rendering responsiveness
  - **Error Handling**: Graceful error recovery, stability

- **macos_e2e_test.dart**: Comprehensive end-to-end tests for macOS platform (⭐ **Best for debugging splash/init**)
  - **Splash Screen & Initialization**: Detailed timing and transition analysis
  - **Routing & Navigation**: Router setup, redirects, authentication flow
  - **UI Rendering**: Theme application, layout validation, window resize handling
  - **Performance & Stability**: Initialization benchmarks, memory leak detection
  - **Error Handling**: Firebase errors, exception detection, graceful failures
  - **Debug Information**: Comprehensive runtime state collection
  - See [MACOS_E2E_TESTS.md](./MACOS_E2E_TESTS.md) for detailed documentation

## Running Integration Tests

### Prerequisites

```bash
# Install dependencies
flutter pub get
```

### Run on Web (Chrome)

```bash
# Run all integration tests
flutter test integration_test/ -d chrome

# Run smoke tests
flutter test integration_test/app_test.dart -d chrome

# Run E2E tests  
flutter test integration_test/web_e2e_test.dart -d chrome

# Run with verbose output
flutter test integration_test/ -d chrome -v

# Run specific test
flutter test integration_test/app_test.dart -k "launches and renders" -d chrome
```

### Run on Android

```bash
# Launch Android emulator first, then:
flutter test integration_test/app_test.dart -d emulator-5554
```

### Run on iOS

```bash
# Launch iOS simulator first, then:
flutter test integration_test/app_test.dart -d ios
```

### Run on macOS

```bash
# Basic smoke tests
flutter test integration_test/app_test.dart -d macos

# Comprehensive E2E tests (recommended)
flutter test integration_test/macos_e2e_test.dart \
  --dart-define=FLAVOR=dev \
  --device=macos

# Quick script (see run_macos_e2e.sh)
chmod +x run_macos_e2e.sh
./run_macos_e2e.sh

# Run specific test group
./run_macos_e2e.sh --test-name "Splash Screen"

# Collect debug information
./run_macos_e2e.sh --test-name "Debug Info"
```

### Run on Desktop (macOS/Linux/Windows)

```bash
flutter test integration_test/app_test.dart -d macos
flutter test integration_test/app_test.dart -d linux
flutter test integration_test/app_test.dart -d windows
```

## CI/CD Integration

To run integration tests in GitHub Actions:

```yaml
- name: Run integration tests
  run: flutter test integration_test/ -d chrome --dart-define=CI=true
```

## Performance Notes

- On web, tests run faster than on mobile
- Chromedriver is automatically managed by Flutter
- Tests include configurable timeouts for async operations

## Troubleshooting

### Tests hang on pumpAndSettle()

If tests hang with `pumpAndSettle()` waiting for Firebase initialization:

```dart
// Increase timeout
await tester.pumpAndSettle(const Duration(seconds: 5));

// Or use explicit wait loop
int count = 0;
while (count < 50) {
  await tester.pump(const Duration(milliseconds: 100));
  count++;
}
```

### Chrome driver not found

```bash
# Flutter manages chromedriver automatically, but if you get errors:
flutter clean
flutter pub get
```

### Tests fail in CI environment

Ensure GitHub Actions has proper Flutter setup:

```yaml
- uses: subosito/flutter-action@v2
  with:
    flutter-version: '3.x'
    channel: 'stable'
```

## Test Structure

Each test follows the Arrange-Act-Assert pattern:

```dart
testWidgets('description', (tester) async {
  // Arrange: Build app and wait for initialization
  await tester.pumpWidget(const FaiseurApp());
  await tester.pumpAndSettle(const Duration(seconds: 2));

  // Act: Perform user actions
  // (tap buttons, scroll, etc.)

  // Assert: Verify expected results
  expect(find.byType(MyWidget), findsOneWidget);
});
```

## Adding New Tests

1. Create a new test file in `integration_test/`
2. Import required packages
3. Use `testWidgets()` for UI tests
4. Use `tester.pumpWidget()` and `tester.pump()` for interactions
5. Use `find` locators to search for widgets
6. Use `expect()` for assertions

Example:

```dart
testWidgets('User can create a new todo', (tester) async {
  await tester.pumpWidget(const FaiseurApp());
  await tester.pumpAndSettle(const Duration(seconds: 2));

  // Find and tap FAB
  await tester.tap(find.byType(FloatingActionButton));
  await tester.pumpAndSettle();

  // Enter text
  await tester.enterText(find.byType(TextField), 'New Todo');
  await tester.tap(find.byType(ElevatedButton));
  await tester.pumpAndSettle();

  // Verify todo appears
  expect(find.text('New Todo'), findsOneWidget);
});
```

## Documentation

- [Flutter Integration Testing](https://flutter.dev/docs/testing/integration-tests)
- [WidgetTester API](https://api.flutter.dev/flutter/flutter_test/WidgetTester-class.html)
- [Finder API](https://api.flutter.dev/flutter/flutter_test/Finder-class.html)

## Test Patterns

### Wait for Firebase initialization

```dart
await tester.pumpAndSettle(const Duration(seconds: 2));
```

### Verify no crashes

```dart
expect(tester.takeException(), isNull);
```

### Find widgets

```dart
find.byType(MyWidget)
find.byWidgetPredicate((w) => w is Text && w.data == 'Hello')
find.byIcon(Icons.add)
find.byTooltip('Delete')
```

### Tap and scroll

```dart
await tester.tap(find.byType(ElevatedButton));
await tester.scroll(find.byType(ListView), const Offset(0, -300));
```
