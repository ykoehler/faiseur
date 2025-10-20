# Integration Tests

This directory contains Flutter integration tests for the Faiseur app. These tests run against the actual Flutter app (not mocked), making them ideal for smoke tests, E2E flows, and platform-specific testing.

## Overview

- **app_test.dart**: Smoke tests that verify the app launches, renders, and handles basic operations
  - App loads and renders without crashing
  - Navigation widgets are present
  - Theme system applies correctly
  - App handles hot reload
  - Responsive behavior works

## Running Integration Tests

### Prerequisites

```bash
# Install dependencies
flutter pub get
```

### Run on Web (Chrome)

```bash
# Run all integration tests
flutter test integration_test/app_test.dart -d chrome

# Run with verbose output
flutter test integration_test/app_test.dart -d chrome -v

# Run specific test
flutter test integration_test/app_test.dart::App\ Smoke\ Tests::App\ launches\ and\ renders\ home\ screen -d chrome
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
flutter test integration_test/app_test.dart -d macos
```

### Run on Desktop (macOS/Linux/Windows)

```bash
flutter test integration_test/app_test.dart -d macos
flutter test integration_test/app_test.dart -d linux
flutter test integration_test/app_test.dart -d windows
```

## Firebase Emulator Integration

For future integration tests that require Firebase services:

```dart
// In test setup
Future<void> setUpAll() async {
  // Use Firebase emulators for testing
  // Requires: firebase emulators:start
}
```

To run Firebase emulators:

```bash
# Terminal 1: Start emulators
firebase emulators:start

# Terminal 2: Run tests (they'll use localhost emulators)
flutter test integration_test/ -d chrome
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
