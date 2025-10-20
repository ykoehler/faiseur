# Testing Infrastructure

The Faiseur project includes comprehensive testing infrastructure to ensure quality across all platforms (web, iOS, Android, macOS).

## Test Structure

```
test/
├── widget_test.dart          # E2E smoke tests (runs on all platforms)
└── [future unit tests]       # Unit tests for core/ and features/

integration_test/
├── app_test.dart             # Integration tests (Android/iOS/macOS/Linux/Windows)
└── [future feature tests]    # Feature-specific integration tests
```

## Test Types

### 1. Widget Tests (E2E Smoke Tests)

**Location**: `test/widget_test.dart`

**What they test**:
- App launches without crashing
- Navigation widgets are present
- Theme system applies correctly
- App handles hot reload
- No rendering errors occur

**Run on**:
- ✅ Web (Chrome, Firefox, Safari)
- ✅ Desktop (macOS, Linux, Windows)
- ✅ Mobile (through flutter test command)

**Run tests**:
```bash
# All widget tests
flutter test test/

# Specific test
flutter test test/widget_test.dart -k "App launches"

# Verbose output
flutter test test/widget_test.dart -v

# Watch mode (re-run on changes)
flutter test test/ --watch
```

**Results**:
```
00:03 +5: All tests passed!
```

### 2. Integration Tests

**Location**: `integration_test/app_test.dart`

**What they test**:
- Same as widget tests but with actual Flutter runtime
- Firebase initialization
- Platform-specific behavior
- Complex user flows

**Run on**:
- ❌ Web (not yet supported by Flutter)
- ✅ iOS (requires iOS simulator or device)
- ✅ Android (requires emulator or device)
- ✅ macOS
- ✅ Linux
- ✅ Windows

**Run tests**:
```bash
# iOS simulator
flutter test integration_test/ -d ios

# Android emulator
flutter test integration_test/ -d emulator-5554

# macOS
flutter test integration_test/ -d macos

# Linux
flutter test integration_test/ -d linux
```

## Running Tests Locally

### Setup

```bash
# Install dependencies (includes test packages)
flutter pub get
```

### Quick Test (Widget Tests - All Platforms)

```bash
flutter test test/widget_test.dart
```

### Full Test Suite

```bash
# Run all widget tests
flutter test test/

# Run all tests with coverage
flutter test --coverage

# View coverage report
lcov --list coverage/lcov.info
```

### Platform-Specific Testing

**Web (Chrome - via flutter test)**:
```bash
flutter test test/widget_test.dart
# Note: Web integration tests require flutter drive + chromedriver
```

**iOS**:
```bash
# Start simulator
open -a Simulator

# Run tests
flutter test integration_test/ -d ios
```

**Android**:
```bash
# Start emulator
emulator -avd <emulator_name>

# Run tests
flutter test integration_test/ -d emulator-5554
```

**macOS**:
```bash
flutter test integration_test/ -d macos
```

## CI/CD Integration

### GitHub Actions

Tests run automatically on PR via `.github/workflows/pr-ci.yml`:

```yaml
- name: Run widget tests
  run: flutter test test/

- name: Run integration tests (Android)
  run: flutter test integration_test/ -d emulator-5554

- name: Generate coverage report
  run: flutter test test/ --coverage

- name: Upload coverage
  uses: codecov/codecov-action@v3
```

## Test Coverage

Target coverage: **>80%** for `lib/core/` and core business logic.

### Generate coverage report

```bash
# Generate coverage data
flutter test --coverage

# Install lcov (macOS)
brew install lcov

# Generate HTML report
lcov --remove coverage/lcov.info '**/*.freezed.dart' '**/*.g.dart' -o coverage/lcov.info
genhtml coverage/lcov.info -o coverage/html/

# Open report
open coverage/html/index.html
```

### Coverage targets by module

| Module | Target |
|--------|--------|
| `core/errors/` | 90% |
| `core/extensions/` | 85% |
| `core/utils/` | 90% |
| `core/constants/` | 100% |
| `features/*/domain/usecases/` | 85% |
| `features/*/data/` | 80% |
| `features/*/presentation/` | 70% |

## Writing Tests

### Widget Test Pattern

```dart
void main() {
  group('Feature Name', () {
    testWidgets('description', (tester) async {
      // Arrange: Setup
      await tester.pumpWidget(const FaiseurApp());
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Act: Perform action
      // e.g., await tester.tap(find.byType(Button));

      // Assert: Verify result
      expect(find.byType(Text), findsWidgets);
    });
  });
}
```

### Finding Widgets

```dart
// By type
find.byType(FloatingActionButton)

// By widget name
find.byType(Text)

// By text
find.text('Hello World')

// By icon
find.byIcon(Icons.add)

// By tooltip
find.byTooltip('Add item')

// Custom predicate
find.byWidgetPredicate((w) => w is Text && w.data?.startsWith('Hello') ?? false)
```

### Interacting with Widgets

```dart
// Tap
await tester.tap(find.byType(ElevatedButton));

// Enter text
await tester.enterText(find.byType(TextField), 'Hello');

// Scroll
await tester.scroll(find.byType(ListView), const Offset(0, -300));

// Drag
await tester.drag(find.byType(Draggable), const Offset(100, 0));

// Pump frames
await tester.pumpAndSettle(); // Wait for animations
await tester.pump(const Duration(milliseconds: 100)); // Single frame
```

### Waiting for Async Operations

```dart
// Wait for animations and futures to complete
await tester.pumpAndSettle();

// With custom timeout
await tester.pumpAndSettle(const Duration(seconds: 5));

// Manual wait loop
for (int i = 0; i < 50; i++) {
  await tester.pump(const Duration(milliseconds: 100));
}
```

### Testing Firebase Integration

```dart
testWidgets('Firebase initialization', (tester) async {
  await tester.pumpWidget(const FaiseurApp());
  
  // Wait for Firebase to initialize
  await tester.pumpAndSettle(const Duration(seconds: 2));
  
  // Verify no initialization errors
  expect(tester.takeException(), isNull);
});
```

## Firebase Emulator Testing

For integration tests that use Firestore, Realtime Database, or Authentication:

### Setup Emulators

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login
firebase login

# In project root, initialize emulator
firebase init emulators

# Start emulators
firebase emulators:start
```

### Use Emulators in Tests

```dart
Future<void> setUpAll() async {
  // Connect to emulator
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // Connect Firestore to emulator
  if (kDebugMode) {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
    FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }
}
```

## Debugging Tests

### Run with verbose output

```bash
flutter test test/ -v
```

### Run single test

```bash
flutter test test/widget_test.dart -k "App launches"
```

### Debug test in IDE

Set breakpoint and run:
```bash
flutter test test/widget_test.dart --start-paused
```

Then attach debugger in IDE.

### Common Issues

**Tests hang with pumpAndSettle()**:
- Increase timeout: `await tester.pumpAndSettle(const Duration(seconds: 5));`
- Use manual pump loop instead

**FirebaseException in tests**:
- Use Firebase emulators (see section above)
- Or mock Firebase services

**Find returns no widgets**:
- Add debug output: `debugPrintBeginFrame = true;`
- Check widget tree with `expect(find.byType(MyWidget), findsOne);`

## Test Metrics

### Current Status

- **Widget Tests**: 5 tests (100% passing)
- **Integration Tests**: 5 tests (ready for mobile/desktop)
- **Coverage**: Phase D (to be implemented)

### Goals

- **Phase D.1**: Unit tests for core/ (80%+ coverage)
- **Phase D.2**: Feature unit tests (80%+ coverage)
- **Phase D.3**: Feature integration tests
- **Phase E**: Full E2E test scenarios

## Future Test Types

### Unit Tests
```
test/core/
├── errors/
├── extensions/
├── theme/
└── utils/
```

### Feature Tests
```
test/features/
├── auth/
├── todos/
├── lists/
└── settings/
```

### Mock Services

```dart
// Example: Mock repository
class MockTodosRepository extends Mock implements TodosRepository {}

// Use in test
final mockRepo = MockTodosRepository();
when(mockRepo.getTodos()).thenAnswer((_) async => []);

// Verify calls
verify(mockRepo.getTodos()).called(1);
```

## References

- [Flutter Testing Documentation](https://flutter.dev/docs/testing)
- [WidgetTester API](https://api.flutter.dev/flutter/flutter_test/WidgetTester-class.html)
- [Finder API](https://api.flutter.dev/flutter/flutter_test/Finder-class.html)
- [Mockito Documentation](https://github.com/dart-lang/mockito)
- [Firebase Testing Guide](https://firebase.google.com/docs/rules/unit-tests)
