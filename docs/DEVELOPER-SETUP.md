# Faiseur Developer Setup Guide

This guide helps you set up the Faiseur project for local development with all quality checks enabled.

## Prerequisites

- Flutter SDK (latest stable)
- Dart SDK 3.0+
- Git
- macOS, Linux, or Windows with WSL

## Initial Setup

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/faiseur.git
cd faiseur
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Configure Git Hooks

⚠️ **Important**: Run this once to enable pre-commit verification:

```bash
bash .githooks/setup.sh
```

This enables automatic code quality checks before each commit.

### 4. Verify Setup

Test that everything is working:

```bash
# Run linting
flutter analyze

# Run tests
flutter test test/core/constants/enums_test.dart

# Check formatting
dart format --set-exit-if-changed lib/ test/ integration_test/
```

All should pass with no issues.

## Development Workflow

### Making Changes

1. Create a feature branch:
   ```bash
   git checkout -b feature/my-feature
   ```

2. Make your changes

3. Format code:
   ```bash
   dart format lib/ test/ integration_test/
   ```

4. Fix any linting issues:
   ```bash
   flutter analyze
   ```

5. Run tests:
   ```bash
   flutter test
   ```

### Committing Changes

Simply commit as usual:

```bash
git add .
git commit -m "feat: add new feature"
```

The pre-commit hook will automatically:
- Check code formatting
- Run linting analysis
- Execute unit tests

If any check fails, the commit will be blocked. Fix the issues and try again.

### Skipping Hooks (Not Recommended)

Only use in emergencies:

```bash
git commit --no-verify
```

## Available Commands

### Code Quality

```bash
# Format code
dart format lib/ test/ integration_test/

# Check for linting issues
flutter analyze

# Run unit tests
flutter test

# Run specific test file
flutter test test/core/constants/enums_test.dart

# Run with coverage
flutter test --coverage
```

### Development

```bash
# Run web app
flutter run -d web

# Hot reload (while running)
r (in terminal)

# Full restart
R (in terminal)

# Stop app
q (in terminal)
```

### Build

```bash
# Build web
flutter build web

# Build iOS
flutter build ios

# Build Android
flutter build apk
```

## Pre-Commit Hook Details

The pre-commit hook (`.githooks/pre-commit`) runs:

1. **Formatting Check** - Ensures consistent code style
2. **Linting Analysis** - Detects code issues
3. **Unit Tests** - Runs all tests

### Bypass Hook (Emergency Only)

```bash
git commit --no-verify
```

**Note**: This bypasses all checks and should only be used if absolutely necessary.

## Project Structure

```
faiseur/
├── lib/                          # Main application code
│   ├── core/                     # Core functionality
│   │   ├── constants/           # Enums, constants
│   │   ├── errors/              # Error handling
│   │   ├── extensions/          # Dart extensions
│   │   ├── theme/               # App theming
│   │   └── utils/               # Utilities
│   ├── features/                # Feature modules
│   │   ├── auth/
│   │   ├── lists/
│   │   ├── todos/
│   │   └── settings/
│   ├── routing/                 # Navigation
│   ├── shared/                  # Shared code
│   └── main.dart
├── test/                        # Unit tests
│   ├── core/
│   ├── features/
│   └── helpers/
├── integration_test/            # Integration tests
├── .githooks/                   # Git hooks
│   ├── pre-commit              # Pre-commit hook
│   ├── setup.sh                # Hook setup script
│   └── README.md               # Hook documentation
├── docs/                        # Documentation
├── pubspec.yaml                # Dependencies
└── README.md
```

## Common Issues

### Pre-commit Hook Not Running

```bash
# Verify git is configured
git config core.hooksPath

# Should output: .githooks

# If not, re-run setup
bash .githooks/setup.sh
```

### Formatting Issues Before Commit

```bash
# Run formatter
dart format lib/ test/ integration_test/

# Then try committing again
git add .
git commit -m "message"
```

### Linting Errors Before Commit

```bash
# See detailed errors
flutter analyze

# Fix issues shown

# Commit again
git commit
```

### Test Failures Before Commit

```bash
# Run tests to see what failed
flutter test

# Fix failing tests

# Commit again
git commit
```

## IDE Setup

### VS Code

1. Install Flutter extension
2. Install Dart extension
3. Install Material Icon Theme (optional)

Recommended settings in `.vscode/settings.json`:

```json
{
  "dart.format.line.length": 80,
  "dart.enableSdkFormatter": true,
  "[dart]": {
    "editor.formatOnSave": true,
    "editor.codeActionsOnSave": {
      "source.fixAll": "explicit"
    }
  }
}
```

### Android Studio / IntelliJ IDEA

1. Install Flutter plugin
2. Install Dart plugin
3. Configure code style:
   - Settings → Editor → Code Style → Dart
   - Line length: 80

## Testing

### Run All Tests

```bash
flutter test
```

### Run Specific Test

```bash
flutter test test/core/constants/enums_test.dart
```

### Generate Coverage Report

```bash
flutter test --coverage
lcov --list coverage/lcov.info
```

## Useful Resources

- **Flutter Docs**: https://flutter.dev/docs
- **Dart Docs**: https://dart.dev/guides
- **Firebase Docs**: https://firebase.google.com/docs
- **Riverpod Docs**: https://riverpod.dev
- **Go Router Docs**: https://pub.dev/packages/go_router

## Getting Help

1. Check project documentation in `docs/`
2. Review existing code for patterns
3. Check issue tracker on GitHub
4. Ask in project discussions

## Next Steps

1. Read `docs/requirements.md` for feature overview
2. Review `docs/architecture.md` for technical design
3. Check `docs/implementation-plan.md` for development roadmap
4. See `AGENTS.md` for AI assistant guidelines

---

**Last Updated**: October 20, 2025  
**Faiseur Version**: 0.1.0-dev
