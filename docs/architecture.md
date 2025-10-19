# Faiseur - Architecture Document

## Document Information

**Version:** 0.1.0  
**Last Updated:** October 19, 2025  
**Status:** Draft - Pending Review

---

## Table of Contents

1. [Architecture Overview](#architecture-overview)
2. [Technology Stack](#technology-stack)
3. [Project Structure](#project-structure)
4. [Data Architecture](#data-architecture)
5. [Application Architecture](#application-architecture)
6. [Backend Architecture](#backend-architecture)
7. [Security Architecture](#security-architecture)
8. [Deployment Architecture](#deployment-architecture)
9. [Development Workflow](#development-workflow)
10. [Testing Strategy](#testing-strategy)

---

## Architecture Overview

### Architectural Style

**Clean Architecture with Feature-First Organization**

```
┌─────────────────────────────────────────────┐
│              Presentation Layer              │
│  (UI, State Management, Navigation)          │
├─────────────────────────────────────────────┤
│              Application Layer               │
│  (Use Cases, Business Logic)                 │
├─────────────────────────────────────────────┤
│               Domain Layer                   │
│  (Entities, Value Objects, Interfaces)       │
├─────────────────────────────────────────────┤
│            Infrastructure Layer              │
│  (Firebase, Local Storage, APIs)             │
└─────────────────────────────────────────────┘
```

### Design Principles

1. **Separation of Concerns**: Each layer has a single, well-defined responsibility
2. **Dependency Rule**: Dependencies point inward (Presentation → Application → Domain)
3. **Testability**: Easy to test each layer independently
4. **Platform Independence**: Core business logic agnostic to platform
5. **Scalability**: Easy to add new features and platforms

---

## Technology Stack

### Frontend

**Framework**: Flutter 3.x
- **Language**: Dart 3.9.2+
- **UI**: Material Design 3 / Cupertino
- **Platforms**: Web, macOS, iOS, Android

**State Management**: Riverpod 2.6+
- **Code Generation**: riverpod_generator
- **Hooks**: hooks_riverpod for functional components
- **Linting**: riverpod_lint

**Navigation**: Go Router 14.6+
- **Deep Linking**: Full support
- **Type-Safe**: Generated routes
- **Guards**: Authentication and authorization

**Code Generation**: build_runner
- **Freezed**: Immutable models
- **JSON Serialization**: json_serializable
- **Riverpod**: Provider generation

### Backend

**Firebase Services**:
- **Authentication**: Firebase Auth (email/password, anonymous)
- **Database**: Cloud Firestore (NoSQL)
- **Storage**: Firebase Storage (file uploads)
- **Functions**: Cloud Functions (Node.js/TypeScript)
- **Hosting**: Firebase Hosting (web app)

**Cloud Functions** (TypeScript):
- Email notifications (SendGrid or similar)
- Data aggregation and analytics
- Scheduled cleanup tasks
- Webhook handlers

### Development Tools

- **IDE**: VS Code, Android Studio, Xcode
- **Version Control**: Git + GitHub
- **CI/CD**: GitHub Actions
- **Testing**: flutter_test, mocktail, integration_test
- **Linting**: flutter_lints, custom_lint
- **Documentation**: dartdoc

---

## Project Structure

### Directory Organization

```
faiseur/
├── .github/
│   ├── workflows/              # CI/CD pipelines
│   └── copilot-instructions.md # Copilot workspace config
├── docs/                       # Documentation
│   ├── requirements.md
│   ├── design.md
│   ├── architecture.md
│   └── implementation-plan.md
├── functions/                  # Firebase Cloud Functions
│   ├── src/
│   ├── package.json
│   └── tsconfig.json
├── lib/
│   ├── core/                   # Core utilities
│   │   ├── constants/
│   │   ├── errors/
│   │   ├── extensions/
│   │   ├── theme/
│   │   └── utils/
│   ├── features/               # Feature modules
│   │   ├── auth/
│   │   │   ├── data/           # Repositories, DTOs
│   │   │   ├── domain/         # Entities, use cases
│   │   │   ├── presentation/   # UI, state
│   │   │   └── auth.dart       # Public API
│   │   ├── lists/
│   │   ├── todos/
│   │   ├── templates/
│   │   ├── gamification/
│   │   └── settings/
│   ├── shared/                 # Shared components
│   │   ├── widgets/
│   │   ├── models/
│   │   └── providers/
│   ├── routing/                # Navigation
│   │   ├── app_router.dart
│   │   └── routes.dart
│   └── main.dart               # Entry point
├── test/                       # Unit and widget tests
│   ├── features/
│   ├── shared/
│   └── test_helpers/
├── integration_test/           # Integration tests
├── web/                        # Web-specific files
├── macos/                      # macOS-specific files
├── ios/                        # iOS-specific files
├── android/                    # Android-specific files
├── analysis_options.yaml       # Linter configuration
├── pubspec.yaml                # Dependencies
├── firebase.json               # Firebase configuration
└── README.md
```

### Feature Module Structure

Each feature follows a consistent structure:

```
feature_name/
├── data/
│   ├── datasources/
│   │   ├── feature_remote_datasource.dart
│   │   └── feature_local_datasource.dart
│   ├── models/
│   │   └── feature_model.dart
│   └── repositories/
│       └── feature_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── feature_entity.dart
│   ├── repositories/
│   │   └── feature_repository.dart
│   └── usecases/
│       ├── get_feature.dart
│       ├── create_feature.dart
│       ├── update_feature.dart
│       └── delete_feature.dart
├── presentation/
│   ├── pages/
│   │   └── feature_page.dart
│   ├── widgets/
│   │   └── feature_widget.dart
│   └── providers/
│       └── feature_providers.dart
└── feature.dart                # Barrel file
```

---

## Data Architecture

### Firestore Database Schema

#### Collections

**1. users**
```dart
/users/{userId}
{
  id: string,              // User ID (Firebase Auth UID)
  username: string,        // Unique username
  email: string?,          // Optional email
  displayName: string,     // Display name
  avatarUrl: string?,      // Profile picture URL
  createdAt: timestamp,
  updatedAt: timestamp,
  settings: {
    theme: string,         // 'light' | 'dark' | 'auto'
    notifications: {
      email: boolean,
      push: boolean,
      defaultAssignmentNotification: boolean
    },
    language: string,
    defaultView: string    // 'list' | 'kanban' | 'card' | 'sprint' | 'calendar'
  },
  stats: {
    totalXP: number,
    level: number,
    listsCreated: number,
    todosCompleted: number
  }
}
```

**2. lists**
```dart
/lists/{listId}
{
  id: string,
  name: string,
  description: string?,
  ownerId: string,         // Reference to users/{userId}
  templateId: string?,     // Reference to templates/{templateId}
  createdAt: timestamp,
  updatedAt: timestamp,
  settings: {
    isGamified: boolean,
    allowComments: boolean,
    allowAttachments: boolean,
    defaultStatus: string
  },
  collaborators: {         // Map of userId to role
    [userId]: {
      role: string,        // 'owner' | 'editor' | 'viewer'
      joinedAt: timestamp,
      notificationSettings: {
        silent: boolean,
        email: boolean,
        push: boolean
      }
    }
  },
  stats: {
    totalTodos: number,
    completedTodos: number,
    activeTodos: number
  },
  archived: boolean
}
```

**3. todos**
```dart
/lists/{listId}/todos/{todoId}
{
  id: string,
  listId: string,
  title: string,
  description: string?,
  status: string,
  priority: string?,       // 'low' | 'medium' | 'high' | 'urgent'
  assignedTo: string[],    // Array of userIds
  createdBy: string,       // userId
  createdAt: timestamp,
  updatedAt: timestamp,
  dueDate: timestamp?,
  completedAt: timestamp?,
  completedBy: string?,
  order: number,           // For custom sorting
  gamification: {
    xpValue: number,
    xpAwarded: boolean
  }?,
  metadata: {
    tags: string[],
    color: string?,
    isRecurring: boolean
  }
}
```

**4. templates**
```dart
/templates/{templateId}
{
  id: string,
  name: string,
  description: string,
  createdBy: string,       // userId
  isPublic: boolean,
  createdAt: timestamp,
  updatedAt: timestamp,
  statusWorkflow: [
    {
      id: string,
      name: string,
      color: string,
      order: number,
      isDefault: boolean,
      isComplete: boolean
    }
  ],
  workflowRules: {
    restrictTransitions: boolean,
    allowedTransitions: {
      [statusId]: string[] // Array of allowed next statusIds
    },
    requireAssignment: boolean
  },
  gamification: {
    enabled: boolean,
    defaultXP: number
  },
  usageCount: number
}
```

**5. rewards**
```dart
/lists/{listId}/rewards/{rewardId}
{
  id: string,
  listId: string,
  name: string,
  description: string,
  icon: string,            // Emoji or icon identifier
  xpCost: number,
  isRecurring: boolean,
  availableCount: number?, // For limited rewards
  createdBy: string,
  createdAt: timestamp,
  enabled: boolean
}
```

**6. redemptions**
```dart
/lists/{listId}/redemptions/{redemptionId}
{
  id: string,
  listId: string,
  rewardId: string,
  requestedBy: string,     // userId
  requestedAt: timestamp,
  status: string,          // 'pending' | 'approved' | 'denied'
  reviewedBy: string?,
  reviewedAt: timestamp?,
  reviewNotes: string?,
  xpSpent: number
}
```

**7. comments**
```dart
/todos/{todoId}/comments/{commentId}
{
  id: string,
  todoId: string,
  userId: string,
  content: string,
  mentions: string[],      // Array of mentioned userIds
  createdAt: timestamp,
  updatedAt: timestamp?,
  isEdited: boolean
}
```

**8. activity_logs**
```dart
/lists/{listId}/activity/{activityId}
{
  id: string,
  listId: string,
  userId: string,
  action: string,          // 'created' | 'updated' | 'deleted' | 'completed'
  entityType: string,      // 'list' | 'todo' | 'reward' | 'redemption'
  entityId: string,
  changes: {
    field: string,
    oldValue: any,
    newValue: any
  }[],
  timestamp: timestamp
}
```

### Firestore Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    
    // Helper functions
    function isAuthenticated() {
      return request.auth != null;
    }
    
    function isOwner(userId) {
      return isAuthenticated() && request.auth.uid == userId;
    }
    
    function isListCollaborator(listId) {
      return isAuthenticated() && 
             exists(/databases/$(database)/documents/lists/$(listId)) &&
             get(/databases/$(database)/documents/lists/$(listId))
               .data.collaborators[request.auth.uid] != null;
    }
    
    // Users collection
    match /users/{userId} {
      allow read: if isAuthenticated();
      allow create: if isOwner(userId);
      allow update, delete: if isOwner(userId);
    }
    
    // Lists collection
    match /lists/{listId} {
      allow read: if isListCollaborator(listId);
      allow create: if isAuthenticated();
      allow update: if isListCollaborator(listId);
      allow delete: if isOwner(resource.data.ownerId);
      
      // Todos subcollection
      match /todos/{todoId} {
        allow read: if isListCollaborator(listId);
        allow create, update: if isListCollaborator(listId);
        allow delete: if isListCollaborator(listId);
      }
      
      // Rewards subcollection
      match /rewards/{rewardId} {
        allow read: if isListCollaborator(listId);
        allow create, update, delete: if isOwner(
          get(/databases/$(database)/documents/lists/$(listId)).data.ownerId
        );
      }
      
      // Redemptions subcollection
      match /redemptions/{redemptionId} {
        allow read: if isListCollaborator(listId);
        allow create: if isListCollaborator(listId);
        allow update: if isOwner(
          get(/databases/$(database)/documents/lists/$(listId)).data.ownerId
        ) || isOwner(resource.data.requestedBy);
      }
      
      // Activity logs
      match /activity/{activityId} {
        allow read: if isListCollaborator(listId);
        allow create: if isAuthenticated();
      }
    }
    
    // Templates collection
    match /templates/{templateId} {
      allow read: if resource.data.isPublic || 
                     isOwner(resource.data.createdBy);
      allow create: if isAuthenticated();
      allow update, delete: if isOwner(resource.data.createdBy);
    }
    
    // Comments subcollection
    match /todos/{todoId}/comments/{commentId} {
      allow read: if isAuthenticated();
      allow create: if isAuthenticated();
      allow update, delete: if isOwner(resource.data.userId);
    }
  }
}
```

### Local Data (Offline Support)

**Drift (SQLite) for offline caching**:
- Cache Firestore data locally
- Support offline mutations
- Sync when connection restored
- Conflict resolution strategies

---

## Application Architecture

### State Management (Riverpod)

#### Provider Types

**1. Provider**: Immutable, computed values
```dart
@riverpod
AppTheme appTheme(AppThemeRef ref) {
  final settings = ref.watch(userSettingsProvider);
  return AppTheme.fromSettings(settings);
}
```

**2. FutureProvider**: Async data fetching
```dart
@riverpod
Future<List<TodoList>> userLists(UserListsRef ref, String userId) async {
  final repository = ref.watch(listsRepositoryProvider);
  return repository.getUserLists(userId);
}
```

**3. StreamProvider**: Real-time data
```dart
@riverpod
Stream<List<Todo>> todosStream(TodosStreamRef ref, String listId) {
  final repository = ref.watch(todosRepositoryProvider);
  return repository.watchTodos(listId);
}
```

**4. StateNotifierProvider**: Complex state
```dart
@riverpod
class TodosNotifier extends _$TodosNotifier {
  @override
  AsyncValue<List<Todo>> build(String listId) {
    return const AsyncValue.loading();
  }
  
  Future<void> addTodo(Todo todo) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(todosRepositoryProvider).createTodo(todo);
      return ref.read(todosStreamProvider(listId).future);
    });
  }
}
```

### Navigation (Go Router)

**Route Definition**:
```dart
@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<ListDetailRoute>(
      path: 'lists/:listId',
      routes: [
        TypedGoRoute<TodoDetailRoute>(
          path: 'todos/:todoId',
        ),
      ],
    ),
    TypedGoRoute<TemplatesRoute>(path: 'templates'),
    TypedGoRoute<SettingsRoute>(path: 'settings'),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();
  
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}
```

**Auth Guard**:
```dart
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  
  return GoRouter(
    redirect: (context, state) {
      final isLoggedIn = authState.valueOrNull != null;
      final isLoginRoute = state.matchedLocation == '/login';
      
      if (!isLoggedIn && !isLoginRoute) return '/login';
      if (isLoggedIn && isLoginRoute) return '/';
      return null;
    },
    routes: $appRoutes,
  );
});
```

### Error Handling

**Custom Exception Hierarchy**:
```dart
sealed class AppException implements Exception {
  const AppException(this.message, [this.stackTrace]);
  final String message;
  final StackTrace? stackTrace;
}

class NetworkException extends AppException {
  const NetworkException(super.message, [super.stackTrace]);
}

class AuthException extends AppException {
  const AuthException(super.message, [super.stackTrace]);
}

class ValidationException extends AppException {
  const ValidationException(super.message, [super.stackTrace]);
}

class FirestoreException extends AppException {
  const FirestoreException(super.message, [super.stackTrace]);
}
```

**Global Error Handler**:
```dart
@riverpod
class ErrorNotifier extends _$ErrorNotifier {
  @override
  AppException? build() => null;
  
  void handleError(Object error, StackTrace stackTrace) {
    if (error is AppException) {
      state = error;
    } else {
      state = AppException(error.toString(), stackTrace);
    }
    
    // Log to analytics
    ref.read(analyticsProvider).logError(error, stackTrace);
    
    // Show user-friendly message
    ref.read(snackbarProvider).showError(state!.message);
  }
}
```

---

## Backend Architecture

### Firebase Cloud Functions

**Function Structure**:
```
functions/
├── src/
│   ├── index.ts              # Function exports
│   ├── triggers/             # Firestore triggers
│   │   ├── onTodoCreated.ts
│   │   ├── onTodoAssigned.ts
│   │   └── onRedemptionRequested.ts
│   ├── scheduled/            # Scheduled functions
│   │   ├── cleanupOldData.ts
│   │   └── sendDigests.ts
│   ├── api/                  # HTTP endpoints
│   │   └── webhooks.ts
│   ├── services/             # Business logic
│   │   ├── email.service.ts
│   │   ├── notifications.service.ts
│   │   └── analytics.service.ts
│   └── utils/
│       ├── validation.ts
│       └── helpers.ts
└── package.json
```

**Example Function: Email Notification**:
```typescript
export const onTodoAssigned = functions.firestore
  .document('lists/{listId}/todos/{todoId}')
  .onUpdate(async (change, context) => {
    const before = change.before.data();
    const after = change.after.data();
    
    // Check if assignees changed
    const newAssignees = after.assignedTo.filter(
      (id: string) => !before.assignedTo.includes(id)
    );
    
    if (newAssignees.length === 0) return;
    
    const { listId, todoId } = context.params;
    
    // Get list and user details
    const list = await admin.firestore()
      .collection('lists')
      .doc(listId)
      .get();
    
    // Send emails to new assignees
    for (const userId of newAssignees) {
      const user = await admin.firestore()
        .collection('users')
        .doc(userId)
        .get();
      
      const userData = user.data();
      if (!userData?.email) continue;
      
      // Check notification settings
      const notifyByEmail = list.data()
        ?.collaborators[userId]
        ?.notificationSettings
        ?.email ?? true;
      
      if (!notifyByEmail) continue;
      
      // Send email
      await emailService.sendAssignmentEmail({
        to: userData.email,
        todoTitle: after.title,
        listName: list.data()?.name,
        deepLink: `https://faiseur.app/lists/${listId}/todos/${todoId}`,
      });
    }
  });
```

---

## Security Architecture

### Authentication Flow

```
1. User enters email/password
2. Client calls Firebase Auth
3. Firebase returns ID token + refresh token
4. Client stores tokens securely
5. All API calls include ID token in header
6. Firebase verifies token
7. Firestore security rules check permissions
```

### Data Encryption

- **In Transit**: HTTPS/TLS 1.3
- **At Rest**: Firebase handles encryption
- **Sensitive Data**: Encrypt before storing (if needed)

### Security Best Practices

1. **Never trust client input**: Validate in security rules and Cloud Functions
2. **Principle of least privilege**: Grant minimum necessary permissions
3. **Rate limiting**: Implement in Cloud Functions
4. **Audit logging**: Track sensitive operations
5. **Regular security reviews**: Review rules and code

---

## Deployment Architecture

### Environments

**Development**:
- Local Firebase emulators
- Dev Firebase project
- Debug builds

**Staging**:
- Staging Firebase project
- Pre-release builds
- Beta testers

**Production**:
- Production Firebase project
- Release builds
- Public users

### CI/CD Pipeline (GitHub Actions)

```yaml
# .github/workflows/ci.yml
name: CI

on: [push, pull_request]

jobs:
  test:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test
      
  build-web:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter build web --release
      - uses: FirebaseExtended/action-hosting-deploy@v0
        with:
          repoToken: ${{ secrets.GITHUB_TOKEN }}
          firebaseServiceAccount: ${{ secrets.FIREBASE_SERVICE_ACCOUNT }}
          channelId: live
          projectId: faiseur-prod
          
  build-ios:
    needs: test
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter build ios --release --no-codesign
```

### Versioning Strategy

**Semantic Versioning**: MAJOR.MINOR.PATCH+BUILD

- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes
- **BUILD**: Build number (auto-incremented)

Example: `1.2.3+42`

---

## Development Workflow

### Git Workflow

**Branch Strategy**:
- `main`: Production-ready code
- `develop`: Integration branch
- `feature/*`: New features
- `bugfix/*`: Bug fixes
- `release/*`: Release preparation

**Commit Convention**:
```
<type>(<scope>): <subject>

<body>

<footer>
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

### Code Review Process

1. Create feature branch
2. Implement changes
3. Write tests
4. Run linter and tests locally
5. Create pull request
6. Automated checks run
7. Peer review
8. Address feedback
9. Merge to develop

---

## Testing Strategy

### Test Pyramid

```
        /\
       /  \  E2E Tests (5%)
      /____\
     /      \
    / Widget \ Integration Tests (20%)
   /  Tests  \
  /__________\
 /            \
/  Unit Tests  \ (75%)
/________________\
```

### Testing Levels

**1. Unit Tests**:
- Test individual functions, classes
- Mock dependencies
- Fast execution
- High coverage target: >80%

**2. Widget Tests**:
- Test individual widgets
- Mock providers
- Verify UI behavior
- Coverage target: >70%

**3. Integration Tests**:
- Test feature workflows
- Real Firebase emulators
- End-to-end scenarios
- Coverage target: >60%

**4. E2E Tests**:
- Test complete user journeys
- Real devices/simulators
- Critical paths only
- Smoke tests for releases

### Test Example

```dart
// Unit test
@GenerateMocks([TodosRepository])
void main() {
  group('CreateTodoUseCase', () {
    late MockTodosRepository repository;
    late CreateTodoUseCase useCase;
    
    setUp(() {
      repository = MockTodosRepository();
      useCase = CreateTodoUseCase(repository);
    });
    
    test('should create todo successfully', () async {
      // Arrange
      final todo = Todo(title: 'Test');
      when(() => repository.createTodo(todo))
        .thenAnswer((_) async => todo);
      
      // Act
      final result = await useCase(todo);
      
      // Assert
      expect(result, equals(todo));
      verify(() => repository.createTodo(todo)).called(1);
    });
  });
}
```

---

## Performance Considerations

### Optimization Strategies

**1. Firestore Query Optimization**:
- Use composite indexes
- Limit query results (pagination)
- Cache frequently accessed data
- Batch reads/writes

**2. Flutter Performance**:
- Const constructors where possible
- Lazy loading of lists
- Image caching and optimization
- Avoid rebuilds with Riverpod

**3. Bundle Size**:
- Code splitting (deferred loading)
- Tree shaking
- Minification
- Asset optimization

### Monitoring

- **Firebase Performance Monitoring**: Track app performance
- **Crashlytics**: Monitor crashes
- **Analytics**: Track user behavior
- **Custom Metrics**: Business-specific KPIs

---

## Scalability Plan

### Current Capacity

- **Firebase Free Tier**: 50K reads/day, 20K writes/day
- **Firestore**: 1 GB storage free
- **Cloud Functions**: 125K invocations/month

### Scaling Strategy

**Phase 1** (0-1K users):
- Firebase free tier sufficient
- Optimize queries
- Monitor usage

**Phase 2** (1K-10K users):
- Upgrade to Blaze plan
- Implement caching layer
- Optimize Cloud Functions

**Phase 3** (10K+ users):
- Consider CDN for static assets
- Implement read replicas
- Optimize most expensive queries
- Consider NoSQL sharding strategies

---

## Approval

**Status:** Draft - Pending Review  
**Next Steps:** Review → Implementation Plan → Development

