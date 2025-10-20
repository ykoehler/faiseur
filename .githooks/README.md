# Git Hooks for Faiseur

This directory contains Git hooks that automatically verify code quality before commits.

## Quick Start

### First Time Setup

Run this command once after cloning the repository:

```bash
bash .githooks/setup.sh
```

This will:
- Configure git to use `.githooks/` as the hooks directory
- Verify the pre-commit hook is executable
- Enable pre-commit verification

### What Happens Before Each Commit

The pre-commit hook runs these checks:

1. **Code Formatting** (`dart format`)
   - Ensures consistent code style
   - 80-character line limits
   - Proper indentation

2. **Linting** (`flutter analyze`)
   - Detects code issues
   - Enforces style rules
   - Identifies potential bugs

3. **Unit Tests** (`flutter test`)
   - Runs all unit tests
   - Ensures no test regressions
   - Validates core functionality

## Hook Details

### Pre-Commit Hook

**File**: `.githooks/pre-commit`

**What it does**:
```
✓ Checks code formatting
✓ Runs linting analysis
✓ Executes unit tests
✓ Prevents commit if any check fails
```

**Success Output**:
```
🔍 Running Faiseur pre-commit verification...

📋 Checking code formatting...
✓ Code formatting is correct

🔎 Running linting analysis...
✓ No linting issues found

🧪 Running unit tests...
✓ All unit tests passed

✅ All pre-commit checks passed!
🚀 Ready to commit
```

## Manual Commands

You can also run these checks manually without committing:

### Format Code
```bash
dart format lib/ test/ integration_test/
```

### Run Linting
```bash
flutter analyze
```

### Run Tests
```bash
flutter test
```

### Run All Checks (like pre-commit)
```bash
# Format
dart format lib/ test/ integration_test/

# Lint
flutter analyze

# Test
flutter test test/core/constants/enums_test.dart
```

## Bypassing Hooks

⚠️ **Not Recommended** - Only use if absolutely necessary:

```bash
git commit --no-verify
```

This skips all pre-commit checks. Use sparingly and only if you have a very good reason.

## Troubleshooting

### Hook Not Running

If the pre-commit hook isn't running:

1. Verify git is configured:
   ```bash
   git config core.hooksPath
   ```
   Should output: `.githooks`

2. Verify hook is executable:
   ```bash
   ls -la .githooks/pre-commit
   ```
   Should have `x` flag: `-rwxr-xr-x`

3. Re-run setup:
   ```bash
   bash .githooks/setup.sh
   ```

### Formatting Errors Before Commit

If `dart format` fails, run it manually first:

```bash
dart format lib/ test/ integration_test/ --line-length 80
git add .
git commit
```

### Linting Errors Before Commit

To see detailed linting issues:

```bash
flutter analyze
```

Fix issues as shown, then try committing again.

### Test Failures Before Commit

To see which tests are failing:

```bash
flutter test
```

Fix the failing tests, then try committing again.

## Adding New Hooks

To add additional hooks in the future:

1. Create new hook file: `.githooks/hook-name`
2. Make it executable: `chmod +x .githooks/hook-name`
3. Add logic to check what you need
4. Git will automatically use it

Common hook names:
- `pre-commit` - Runs before commit (already exists)
- `pre-push` - Runs before git push
- `commit-msg` - Validates commit message format
- `post-merge` - Runs after merge

## CI/CD Integration

These same checks run in CI/CD pipelines:
- GitHub Actions (`.github/workflows/`)
- All PRs require passing checks
- Blocking merge until checks pass

**Local + CI ensures**:
- Issues caught early (locally)
- Consistent standards across all commits
- Fast feedback loop for developers

## Questions?

See the main project documentation:
- `docs/` - Main documentation
- `AGENTS.md` - AI assistant guidelines
- `README.md` - Project overview

---

**Last Updated**: October 20, 2025  
**Faiseur Version**: 0.1.0-dev
