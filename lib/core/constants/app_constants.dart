/// Application-wide constants used throughout Faiseur.
///
/// This file centralizes all constant values to ensure consistency
/// and make them easy to modify across the application.
library;

/// Network and API constants
class NetworkConstants {
  NetworkConstants._(); // Private constructor to prevent instantiation

  /// Default timeout duration for network requests
  static const Duration requestTimeout = Duration(seconds: 30);

  /// Default timeout duration for Firebase operations
  static const Duration firebaseTimeout = Duration(seconds: 60);

  /// Maximum retries for failed network requests
  static const int maxRetries = 3;

  /// Retry delay multiplier (exponential backoff)
  static const double retryDelayMultiplier = 2;
}

/// Firestore database constants
class FirestoreConstants {
  FirestoreConstants._();

  /// Firestore collection names
  static const String usersCollection = 'users';
  static const String listsCollection = 'lists';
  static const String todosCollection = 'todos';
  static const String templatesCollection = 'templates';
  static const String rewardsCollection = 'rewards';
  static const String redemptionsCollection = 'redemptions';
  static const String commentsCollection = 'comments';
  static const String activityCollection = 'activity';

  /// Firestore batch operation limits
  static const int batchWriteLimit = 500;
  static const int batchReadLimit = 1000;

  /// Index name constants
  static const String userListsIndex = 'users_lists_index';
  static const String listTodosIndex = 'lists_todos_index';
}

/// Validation constants
class ValidationConstants {
  ValidationConstants._();

  /// Username constraints
  static const int minUsernameLength = 3;
  static const int maxUsernameLength = 32;
  static const String usernamePattern = r'^[a-zA-Z0-9_-]+$';

  /// List name constraints
  static const int minListNameLength = 1;
  static const int maxListNameLength = 128;

  /// Todo title constraints
  static const int minTodoTitleLength = 1;
  static const int maxTodoTitleLength = 500;

  /// Todo description constraints
  static const int maxTodoDescriptionLength = 5000;

  /// Email validation pattern
  static const String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  /// Password constraints
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 128;

  // Validation error messages
  static const String requiredField = 'This field is required.';
  static const String invalidEmail = 'Please enter a valid email address.';
  static const String invalidPassword =
      'Password must be at least 8 characters.';
  static const String invalidUsername =
      'Username must be 3-32 characters with only letters, numbers, '
      'underscores, and hyphens.';
}

/// UI and UX constants
class UiConstants {
  UiConstants._();

  /// Default animation durations
  static const Duration shortAnimation = Duration(milliseconds: 150);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);

  /// Pagination constants
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  /// Debounce duration for search input
  static const Duration searchDebounce = Duration(milliseconds: 500);

  /// Auto-save delay for forms
  static const Duration autoSaveDelay = Duration(seconds: 2);

  /// Snackbar display duration
  static const Duration snackbarDuration = Duration(seconds: 4);
}

/// Gamification constants
class GamificationConstants {
  GamificationConstants._();

  /// Default XP values for different actions
  static const int xpForCompletingTodo = 10;
  static const int xpForCreatingTodo = 5;
  static const int xpForCompletingList = 50;
  static const int xpBonus = 2; // Multiplier for high priority todos

  /// Level thresholds
  static const int levelThreshold = 500; // XP needed to reach next level
}

/// Storage constants
class StorageConstants {
  StorageConstants._();

  /// Maximum file upload size (10 MB)
  static const int maxFileUploadSize = 10 * 1024 * 1024;

  /// Supported file types for attachments
  static const List<String> supportedFileTypes = [
    'pdf',
    'doc',
    'docx',
    'xls',
    'xlsx',
    'ppt',
    'pptx',
    'jpg',
    'jpeg',
    'png',
    'gif',
    'txt',
  ];

  /// Profile picture constraints
  static const int maxProfilePictureSize = 2 * 1024 * 1024; // 2 MB
  static const List<String> profilePictureTypes = ['jpg', 'jpeg', 'png', 'gif'];
}

/// Cache constants
class CacheConstants {
  CacheConstants._();

  /// Default cache duration for user data
  static const Duration userDataCacheDuration = Duration(hours: 24);

  /// Cache duration for lists
  static const Duration listsCacheDuration = Duration(hours: 1);

  /// Cache duration for todos
  static const Duration todosCacheDuration = Duration(minutes: 30);

  /// Cache duration for user presence data
  static const Duration presenceCacheDuration = Duration(minutes: 5);
}

/// Error and exception messages
class ErrorMessages {
  ErrorMessages._();

  /// Network error messages
  static const String networkError =
      'Network error occurred. Please try again.';
  static const String timeoutError = 'Request timed out. Please try again.';
  static const String serverError =
      'Server error occurred. Please try again later.';

  /// Authentication error messages
  static const String authenticationFailed = 'Authentication failed.';
  static const String invalidCredentials = 'Invalid email or password.';
  static const String userNotFound = 'User not found.';
  static const String userAlreadyExists = 'User already exists.';
  static const String passwordResetFailed = 'Password reset failed.';

  /// Validation error messages
  static const String invalidEmail = 'Please enter a valid email address.';
  static const String invalidPassword =
      'Password must be at least 8 characters.';
  static const String invalidUsername =
      'Username must be 3-32 characters with only letters, numbers, '
      'underscores, and hyphens.';
  static const String requiredField = 'This field is required.';

  /// Firestore error messages
  static const String firestoreError = 'Database error occurred.';
  static const String documentNotFound = 'Document not found.';
  static const String permissionDenied =
      'You do not have permission to perform this action.';

  /// Generic error messages
  static const String unknownError = 'An unknown error occurred.';
  static const String operationFailed = 'Operation failed. Please try again.';
  static const String operationCancelled = 'Operation was cancelled.';
}

/// Firebase emulator configuration
class FirebaseEmulatorConstants {
  FirebaseEmulatorConstants._();

  /// Emulator host and ports
  static const String emulatorHost = 'localhost';
  static const int authEmulatorPort = 9099;
  static const int firestoreEmulatorPort = 8080;
  static const int storageEmulatorPort = 9199;

  /// Enable/disable emulator by default in development
  static const bool enableEmulatorByDefault = true;
}

/// Feature flags for gradual rollout
class FeatureFlags {
  FeatureFlags._();

  /// Enable gamification system
  static const bool gamificationEnabled = true;

  /// Enable collaboration features
  static const bool collaborationEnabled = true;

  /// Enable multiple view types
  static const bool multipleViewsEnabled = true;

  /// Enable email notifications
  static const bool emailNotificationsEnabled = true;

  /// Enable push notifications
  static const bool pushNotificationsEnabled = false; // Can be enabled later
}
