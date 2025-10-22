# Faiseur - Test Analysis and Improvement Plan

## Document Information

**Version:** 0.1.0  
**Last Updated:** October 21, 2025  
**Status:** Current Analysis - Active

---

## Executive Summary

### Current State
- **Total Tests:** 45
- **Lint Violations:** 0
- **Test Files:** 6
- **Coverage Areas:** Enums, Entities, E2E Smoke Tests
- **Status:** ✅ All tests passing

### Major Gaps
- ❌ No unit tests for use cases (SignInWithEmail, SignUp, etc.)
- ❌ No unit tests for repositories (AuthRepository implementation)
- ❌ No tests for Riverpod providers
- ❌ No widget tests for UI (login_page, signup_page)
- ❌ No integration tests for auth flows
- ❌ No tests for error handling paths
- ⚠️ Entity tests only cover happy paths

---

## Current Test Suite Analysis

### 1. Core Tests (`test/core/constants/enums_test.dart`)
**Status:** ✅ Good foundation  
**Coverage:** 138 lines, 17 tests

**What's Tested:**
- TodoStatus enum (5 tests)
  - All enum values exist
  - displayName property correct
  - shortName property correct
- TodoPriority enum (3 tests)
- UserRole enum (4 tests)
- GamificationLevel enum (2 tests)
- RedemptionStatus enum (2 tests)
- ViewType enum (2 tests)

**Issues:**
- ⚠️ Only tests happy paths (correct values)
- ⚠️ No edge case testing
- ⚠️ No null/invalid input handling tests
- ✅ Good test names and organization

### 2. Auth Entity Tests (`test/features/auth/domain/entities/user_test.dart`)
**Status:** ✅ Good coverage  
**Coverage:** User entity with Freezed

**What's Tested:**
- User creation with required fields
- User creation with optional fields
- Value equality
- copyWith method
- Model serialization (fromJson/toJson)
- Round-trip conversion

**Issues:**
- ⚠️ No validation tests
- ⚠️ No null safety tests
- ⚠️ No edge cases (empty strings, invalid dates, etc.)

### 3. Todo/Lists Entity Tests
**Status:** ✅ Comprehensive  
**Coverage:** TodoList and Todo entities

**What's Tested:**
- Entity creation
- Value equality
- copyWith functionality
- Model conversion (entity ↔ model)
- Role handling and invalid role gracefully
- Round-trip conversion

**Issues:**
- ⚠️ No business logic tests (status transitions, assignments)
- ⚠️ No validation tests

### 4. E2E Smoke Tests (`test/widget_test.dart`)
**Status:** ⚠️ Minimal E2E coverage  
**Coverage:** 6 smoke tests

**What's Tested:**
- App launches and renders home screen
- MaterialApp with router rendered
- Theme (light/dark modes) applies correctly
- Hot reload handling
- Renders without layout issues

**Issues:**
- ⚠️ No navigation tests
- ⚠️ No user flow tests
- ❌ No auth flow testing
- ⚠️ No error state testing

---

## Critical Missing Test Coverage

### 1. **Use Cases Layer** ❌ CRITICAL
**Files with no tests:**
- `lib/features/auth/domain/usecases/sign_in_with_email.dart`
- `lib/features/auth/domain/usecases/sign_up_with_email.dart`
- `lib/features/auth/domain/usecases/sign_in_anonymously.dart`
- `lib/features/auth/domain/usecases/sign_out.dart`
- `lib/features/auth/domain/usecases/get_current_user.dart`

**Impact:** Medium-High
- Use cases are core business logic
- No tests mean unverified authentication flows
- Error handling not verified

**Recommended Tests per Use Case:**
```
SignInWithEmailUseCase:
- ✅ Should sign in successfully with valid email/password
- ✅ Should throw Failure.authentication for wrong password
- ✅ Should throw Failure.notFound for non-existent user
- ✅ Should throw Failure.validation for empty email
- ✅ Should throw Failure.validation for invalid email
- ✅ Should throw Failure.network for network errors

SignUpWithEmailUseCase:
- ✅ Should create user successfully
- ✅ Should throw for duplicate email
- ✅ Should throw for duplicate username
- ✅ Should validate password strength
- ✅ Should validate email format
- ✅ Should validate username format
- ✅ Should handle network errors

[Similar for other use cases]
```

### 2. **Repository Implementation** ❌ CRITICAL
**File with no tests:**
- `lib/features/auth/data/repositories/auth_repository_impl.dart` (273 lines, zero tests)

**Impact:** HIGH
- Direct Firebase integration
- Error handling critical
- User authentication/security concerns

**Recommended Tests:**
```
AuthRepositoryImpl:
- Firebase error mapping tests
- Username availability checking
- User profile updates
- Authentication state streaming
- Network error handling
- Firebase-specific error codes
```

### 3. **Riverpod Providers** ❌ CRITICAL
**File with no tests:**
- `lib/features/auth/presentation/providers/auth_providers.dart`

**Impact:** HIGH
- State management for entire auth feature
- Dependency injection verified
- Provider interactions

**Recommended Tests:**
```
authProvider:
- ✅ Should start in loading state
- ✅ Should update on auth state changes
- ✅ Should handle sign in success
- ✅ Should handle sign in failure
- ✅ Should handle sign out
- ✅ Should refresh user data

authRepositoryProvider:
- ✅ Should create singleton instance
- ✅ Should return AuthRepositoryImpl

Use case providers:
- ✅ Each should provide correct use case instance
```

### 4. **Widget Tests for UI Pages** ❌ HIGH PRIORITY
**Files with no widget tests:**
- `lib/features/auth/presentation/pages/login_page.dart`
- `lib/features/auth/presentation/pages/signup_page.dart`

**Impact:** MEDIUM
- User-facing authentication
- Form validation not verified
- Error display not verified
- Navigation not verified

**Recommended Widget Tests:**

**LoginPage Tests:**
```
LoginPageTest:
- ✅ Should render all form fields
- ✅ Should show password visibility toggle
- ✅ Should validate email format
- ✅ Should validate password minimum length
- ✅ Should show validation errors
- ✅ Should enable sign-in button when form valid
- ✅ Should disable sign-in button when form invalid
- ✅ Should show loading state during sign-in
- ✅ Should navigate to signup page
- ✅ Should handle sign-in errors
- ✅ Should support anonymous sign-in
```

**SignupPage Tests:**
```
SignupPageTest:
- ✅ Should render all form fields
- ✅ Should validate email format
- ✅ Should validate username format
- ✅ Should validate display name length
- ✅ Should validate password strength
- ✅ Should validate password confirmation
- ✅ Should require terms agreement
- ✅ Should show validation errors
- ✅ Should show loading state during signup
- ✅ Should navigate to login page
- ✅ Should handle signup errors
```

### 5. **Integration Tests** ❌ MISSING
**Impact:** MEDIUM
- End-to-end auth flows
- Error recovery
- State persistence

**Recommended Integration Tests:**
```
AuthFlowIntegrationTest:
- ✅ Complete sign-up flow end-to-end
- ✅ Complete sign-in flow end-to-end
- ✅ Handle network interruptions gracefully
- ✅ Recover from auth errors
- ✅ Persist auth state across app restarts
```

---

## Test Quality Analysis

### Test Organization
**Good:**
- ✅ Tests grouped logically with `group()`
- ✅ Clear test names describing behavior
- ✅ One assertion per test generally followed
- ✅ Proper use of `expect()` and matchers

**Could Improve:**
- ⚠️ No `setUp()` for shared test data
- ⚠️ No `tearDown()` for cleanup
- ⚠️ Limited use of fixtures

### Test Robustness
**Good:**
- ✅ Entity tests cover important scenarios
- ✅ Enum tests comprehensive

**Gaps:**
- ❌ No error path testing
- ❌ No edge case testing
- ❌ No null safety testing
- ❌ No boundary value testing
- ❌ No integration point testing

---

## Recommended Test Implementation Roadmap

### Phase 1: Repository Unit Tests (Week 1)
**Priority:** CRITICAL  
**Effort:** 2-3 days

1. Create `test/features/auth/data/repositories/auth_repository_impl_test.dart`
   - Firebase error mapping tests
   - Username availability tests
   - User profile update tests
   - Mock Firebase services

2. Create `test/features/auth/domain/usecases/` directory with tests for each use case
   - SignInWithEmailUseCase tests
   - SignUpWithEmailUseCase tests
   - SignOutUseCase tests
   - GetCurrentUserUseCase tests
   - SignInAnonymouslyUseCase tests

**Expected Coverage:** ~50+ new tests, ~150 lines per file

### Phase 2: Provider Unit Tests (Week 1-2)
**Priority:** CRITICAL  
**Effort:** 1-2 days

1. Create `test/features/auth/presentation/providers/auth_providers_test.dart`
   - Provider initialization
   - Sign in/up/out flows
   - Error handling
   - State transitions

**Expected Coverage:** ~30+ new tests

### Phase 3: Widget Tests (Week 2)
**Priority:** HIGH  
**Effort:** 2-3 days

1. Create `test/features/auth/presentation/pages/login_page_test.dart`
   - Form validation tests
   - Error display tests
   - Loading states
   - Navigation tests
   - ~20+ tests

2. Create `test/features/auth/presentation/pages/signup_page_test.dart`
   - Form validation tests
   - Checkbox tests
   - Error display tests
   - ~25+ tests

**Expected Coverage:** ~45+ new tests

### Phase 4: Integration Tests (Week 3)
**Priority:** MEDIUM  
**Effort:** 1-2 days

1. Create `integration_test/auth_flow_test.dart`
   - Sign-up flow
   - Sign-in flow
   - Error recovery
   - ~10+ integration tests

**Expected Coverage:** ~10+ integration tests

### Phase 5: Improve Existing Tests (Week 3)
**Priority:** MEDIUM  
**Effort:** 1 day

1. Enhance entity tests with edge cases
2. Add error path testing
3. Improve E2E smoke tests
4. Add auth-specific E2E tests

**Expected Coverage:** +10-15 tests

---

## Recommended Test Infrastructure Improvements

### 1. Test Helpers Expansion
**Current:** `test/helpers/test_helpers.dart` (minimal)  
**Recommended additions:**

```dart
// Mock builders for Firebase services
MockFirebaseAuth createMockFirebaseAuth({
  required User? currentUser,
  bool throwOnSignIn = false,
});

// Test data builders for entities
User createTestUser({
  String id = 'test-id',
  String email = 'test@example.com',
  String username = 'testuser',
});

// Fixture loaders
String loadJsonFixture(String filename);

// Matchers for custom types
Matcher isFailure(FailureType type);
```

### 2. Mock Strategy
**Current:** No mocks/stubs  
**Recommended:**

- Use `mocktail` for mocking Firebase services
- Use `riverpod_test` for testing Riverpod providers
- Create mock builders for clean test setup
- Implement `FakeDio` for HTTP testing

### 3. Coverage Tracking
**Current:** Manual testing  
**Recommended:**

```bash
# Run tests with coverage
flutter test --coverage

# Generate coverage reports
generate_coverage -f

# Check coverage percentage
# Target: >80% for auth feature
```

### 4. Test Configuration
**Create:** `test/test_config.dart` or update `test/helpers/test_helpers.dart`

```dart
// Set up Firebase mocks globally
setUpAll(() {
  setupFirebaseMocks();
  setupProviderContainer();
});

// Common setUp for all tests
setUp(() {
  // Reset mocks between tests
});
```

---

## Test Coverage Targets

### Current State
| Component | Status | Coverage |
|-----------|--------|----------|
| Enums | ✅ | ~90% |
| Entities | ✅ | ~70% |
| Use Cases | ❌ | 0% |
| Repositories | ❌ | 0% |
| Providers | ❌ | 0% |
| Pages | ❌ | 0% |
| E2E | ⚠️ | ~10% |
| **TOTAL** | ⚠️ | ~20% |

### Target State (After Improvements)
| Component | Target | Notes |
|-----------|--------|-------|
| Enums | 95% | Add edge cases |
| Entities | 90% | Add validation tests |
| Use Cases | 90% | Full coverage needed |
| Repositories | 85% | Mock Firebase properly |
| Providers | 85% | Provider-specific testing |
| Pages | 80% | Widget tests |
| Integration | 75% | End-to-end flows |
| **TOTAL** | 85%+ | Comprehensive coverage |

---

## Quick Wins (Easy Improvements)

### 1. Enhance Enum Tests (30 mins)
- Add edge cases (invalid transitions, etc.)
- Add null/empty tests
- Better error messages

### 2. Add E2E Auth Test (1 hour)
- Create E2E flow test from splash → home
- Test both sign-in and sign-up paths
- Verify redirection logic

### 3. Basic Widget Test (1-2 hours)
- Create simple login page widget test
- Test form rendering
- Test basic validation

### 4. Improve Test Helpers (30 mins)
- Add test data builders
- Create mock factories
- Centralize test utilities

---

## Implementation Priority

### Critical Path (Must Do)
1. ✅ Use case unit tests (5 tests × 5 use cases = 25 tests)
2. ✅ Repository implementation tests (20+ tests)
3. ✅ Provider tests (20+ tests)
4. ✅ Login/signup page widget tests (45+ tests)

**Estimated effort:** 1 week  
**Impact:** Moves from ~20% to ~70% coverage

### Enhanced Coverage (Should Do)
5. ⚠️ Integration tests (10+ tests)
6. ⚠️ Error path testing (15+ tests)
7. ⚠️ Edge case testing (10+ tests)

**Estimated effort:** 1 week  
**Impact:** Moves from ~70% to ~85%+ coverage

### Polish (Nice To Have)
8. 🔧 Performance tests
9. 🔧 Security tests
10. 🔧 Accessibility tests

---

## Actionable Next Steps

### Today (Immediate)
1. [ ] Review this analysis document
2. [ ] Decide on testing approach (mocking strategy, frameworks)
3. [ ] Set up test infrastructure (helpers, mocks, fixtures)

### This Week
1. [ ] Implement use case unit tests
2. [ ] Implement repository tests
3. [ ] Implement provider tests
4. [ ] Add 2-3 widget tests for pages

### Next Week
1. [ ] Complete widget test suite
2. [ ] Add integration tests
3. [ ] Add error path tests
4. [ ] Achieve 80%+ coverage

---

## Testing Tools and Dependencies

### Current
- `flutter_test` - Widget testing
- `flutter_riverpod` - State management

### Recommended Additions

**For mocking:**
```yaml
dev_dependencies:
  mocktail: ^1.0.0  # For mocking Firebase services
  firebase_auth_mocks: ^0.x.x  # Firebase mock support
  fake_async: ^1.3.0  # For async testing
```

**For testing utilities:**
```yaml
dev_dependencies:
  riverpod_test: ^x.x.x  # Riverpod-specific testing
  alchemist: ^0.x.x  # Golden testing (optional)
```

### Firebase Mocking Setup
```dart
import 'firebase_core/firebase_core.dart';

void setupFirebaseMocks() {
  // Initialize Firebase mocks for testing
  // Prevents "Firebase not initialized" errors in tests
}
```

---

## Conclusion

### Current State Summary
The Faiseur project has a solid foundation with 45 passing tests, but critical gaps exist in:
- Business logic (use cases, repositories)
- State management (providers)
- User interface (widgets)
- Integration scenarios

### Recommended Action
Implement the test roadmap prioritizing use cases → providers → widgets. This will:
- ✅ Increase coverage from ~20% to 85%+
- ✅ Verify core authentication flows
- ✅ Catch errors early in development
- ✅ Improve code confidence and refactoring safety
- ✅ Establish testing patterns for future features

### Expected Outcome
**After 2 weeks of focused testing effort:**
- 150+ new unit tests
- 10+ integration tests
- 85%+ code coverage
- Complete authentication feature validation
- Reusable testing patterns for remaining features

---

**Next Review:** After Phase 1 implementation (approximately 1 week)
