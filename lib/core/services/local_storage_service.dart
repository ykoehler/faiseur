import 'package:shared_preferences/shared_preferences.dart';

/// Service for managing local persistent storage using SharedPreferences
///
/// Provides methods for storing and retrieving user preferences,
/// including onboarding completion status.
class LocalStorageService {
  /// SharedPreferences instance
  late final SharedPreferences _prefs;

  /// Key for storing onboarding completion status
  static const String _onboardingCompletedKey = 'onboarding_completed';

  /// Key for storing the user ID of who completed onboarding
  /// This allows us to reset onboarding if user signs out and signs back in
  static const String _onboardingUserIdKey = 'onboarding_user_id';

  /// Initialize the service
  /// Must be called before using this service
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Check if user has completed onboarding
  ///
  /// Returns true if the onboarding has been marked as complete
  /// for the current user
  bool hasCompletedOnboarding(String? userId) {
    if (userId == null || userId.isEmpty) {
      return false;
    }

    // Check if onboarding was completed for this specific user
    final storedUserId = _prefs.getString(_onboardingUserIdKey);
    if (storedUserId != userId) {
      // Different user - they haven't completed onboarding yet
      return false;
    }

    return _prefs.getBool(_onboardingCompletedKey) ?? false;
  }

  /// Mark onboarding as completed for a user
  ///
  /// Parameters:
  /// - [userId]: The ID of the user completing onboarding
  Future<void> markOnboardingCompleted(String userId) async {
    if (userId.isEmpty) {
      throw ArgumentError('userId cannot be empty');
    }

    await _prefs.setString(_onboardingUserIdKey, userId);
    await _prefs.setBool(_onboardingCompletedKey, true);
  }

  /// Reset onboarding status (used when user signs out or wants to see tutorial again)
  Future<void> resetOnboarding() async {
    await _prefs.remove(_onboardingCompletedKey);
    await _prefs.remove(_onboardingUserIdKey);
  }

  /// Clear all stored data (nuclear option)
  Future<void> clearAll() async {
    await _prefs.clear();
  }
}
