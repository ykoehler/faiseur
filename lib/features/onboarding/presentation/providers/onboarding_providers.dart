import 'package:faiseur/features/lists/presentation/providers/lists_providers.dart';
import 'package:faiseur/features/todos/presentation/providers/todos_providers.dart';
import 'package:faiseur/shared/providers/app_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/usecases/create_tutorial_list.dart';

part 'onboarding_providers.g.dart';

/// Provider for the CreateTutorialList use case
@riverpod
CreateTutorialList createTutorialListUseCase(Ref ref) {
  final listsRepository = ref.watch(listsRepositoryProvider);
  final todosRepository = ref.watch(todosRepositoryProvider);
  return CreateTutorialList(listsRepository: listsRepository, todosRepository: todosRepository);
}

/// State class for onboarding
class OnboardingState {
  OnboardingState({
    required this.currentStep,
    required this.totalSteps,
    required this.hasCompletedOnboarding,
    required this.isLoading,
    this.error,
  });

  final int currentStep;
  final int totalSteps;
  final bool hasCompletedOnboarding;
  final bool isLoading;
  final String? error;

  /// Create a copy of this state with optional field changes
  OnboardingState copyWith({
    int? currentStep,
    int? totalSteps,
    bool? hasCompletedOnboarding,
    bool? isLoading,
    String? error,
  }) => OnboardingState(
    currentStep: currentStep ?? this.currentStep,
    totalSteps: totalSteps ?? this.totalSteps,
    hasCompletedOnboarding: hasCompletedOnboarding ?? this.hasCompletedOnboarding,
    isLoading: isLoading ?? this.isLoading,
    error: error,
  );

  /// Check if we're on the first step
  bool get isFirstStep => currentStep == 0;

  /// Check if we're on the last step
  bool get isLastStep => currentStep == totalSteps - 1;

  /// Get progress as a percentage (0-1)
  double get progress => currentStep / totalSteps;
}

/// Notifier provider for onboarding state management
@riverpod
class OnboardingNotifier extends _$OnboardingNotifier {
  @override
  OnboardingState build() =>
      // Initialize with default state
      // User hasn't started onboarding yet, on step 0
      OnboardingState(currentStep: 0, totalSteps: 5, hasCompletedOnboarding: false, isLoading: false);

  /// Move to the next onboarding step
  void nextStep() {
    if (!state.hasCompletedOnboarding && state.currentStep < state.totalSteps) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  /// Move to the previous onboarding step
  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  /// Complete onboarding (called when user reaches the last step)
  Future<void> completeOnboarding(String userId) async {
    try {
      state = state.copyWith(isLoading: true);

      // Create tutorial list for the user using the provider
      final createTutorialList = ref.watch(createTutorialListUseCaseProvider);
      await createTutorialList(ownerId: userId);

      // Mark onboarding as completed in storage
      final storage = await ref.read(localStorageServiceProvider.future);
      await storage.markOnboardingCompleted(userId);

      state = state.copyWith(hasCompletedOnboarding: true, currentStep: state.totalSteps, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Failed to complete onboarding: $e');
    }
  }

  /// Skip the onboarding and mark as completed
  Future<void> skipOnboarding(String userId) async {
    try {
      state = state.copyWith(isLoading: true);

      // Mark onboarding as completed in storage even though user skipped
      final storage = await ref.read(localStorageServiceProvider.future);
      await storage.markOnboardingCompleted(userId);

      state = state.copyWith(hasCompletedOnboarding: true, currentStep: state.totalSteps, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Failed to skip onboarding: $e');
    }
  }

  /// Reset onboarding state to show again
  void reset() {
    state = OnboardingState(currentStep: 0, totalSteps: 5, hasCompletedOnboarding: false, isLoading: false);
  }

  /// Set error message
  void setError(String message) {
    state = state.copyWith(error: message);
  }

  /// Clear error message
  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// Provider that checks if user has completed onboarding
@riverpod
Future<bool> hasCompletedOnboarding(Ref ref, String userId) async {
  if (userId.isEmpty) {
    return true; // Skip onboarding for invalid user
  }

  try {
    final storage = await ref.watch(localStorageServiceProvider.future);
    return storage.hasCompletedOnboarding(userId);
  } catch (e) {
    // If storage fails, assume not completed so user sees onboarding
    return false;
  }
}

/// Current onboarding step
@riverpod
int currentOnboardingStep(Ref ref) => ref.watch(onboardingProvider).currentStep;

/// Onboarding progress as percentage (0-1)
@riverpod
double onboardingProgress(Ref ref) => ref.watch(onboardingProvider).progress;

/// Check if onboarding is completed
@riverpod
bool onboardingCompleted(Ref ref) => ref.watch(onboardingProvider).hasCompletedOnboarding;

/// Check if currently loading onboarding completion
@riverpod
bool onboardingIsLoading(Ref ref) => ref.watch(onboardingProvider).isLoading;

/// Get any error message from onboarding process
@riverpod
String? onboardingError(Ref ref) => ref.watch(onboardingProvider).error;
