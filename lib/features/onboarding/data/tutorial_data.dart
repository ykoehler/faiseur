import 'package:faiseur/features/onboarding/domain/entities/onboarding_step.dart';

/// Tutorial data defining the onboarding steps
///
/// This provides the content for the onboarding flow shown to new users.
/// Shown on first app launch after the user creates an account.
class TutorialData {
  /// List of all onboarding steps in order
  static const List<OnboardingStep> steps = [
    /// Step 1: Welcome
    OnboardingStep(
      id: 'onboarding_1_welcome',
      stepNumber: 1,
      title: 'Welcome to Faiseur',
      description:
          'Stay organized with your personal todo lists. Create, manage, and complete your tasks with ease.',
      iconName: 'tasks',
      actionButtonText: 'Next',
      isLastStep: false,
      secondaryButtonText: 'Skip Tour',
      canSkip: true,
    ),

    /// Step 2: Create Lists
    OnboardingStep(
      id: 'onboarding_2_lists',
      stepNumber: 2,
      title: 'Create Lists',
      description:
          'Organize your todos by creating multiple lists. Perfect for work, personal, shopping, or anything else!',
      iconName: 'list',
      actionButtonText: 'Next',
      isLastStep: false,
      secondaryButtonText: 'Skip Tour',
      canSkip: true,
      tips: [
        'Tap the + button to create a new list',
        'Give your list a meaningful name',
        'You can create unlimited lists',
      ],
    ),

    /// Step 3: Add Todos
    OnboardingStep(
      id: 'onboarding_3_todos',
      stepNumber: 3,
      title: 'Add Todos',
      description:
          'Create todos within each list. Set priorities, due dates, and track your progress.',
      iconName: 'check_circle',
      actionButtonText: 'Next',
      isLastStep: false,
      secondaryButtonText: 'Skip Tour',
      canSkip: true,
      tips: [
        'Add todos to organize your work',
        'Set priorities: Low, Medium, High',
        'Add due dates to stay on track',
        'Mark todos complete with a checkmark',
      ],
    ),

    /// Step 4: Customize
    OnboardingStep(
      id: 'onboarding_4_customize',
      stepNumber: 4,
      title: 'Customize Your Preferences',
      description:
          'Visit Settings to personalize your experience. Choose your theme, adjust notifications, and more.',
      iconName: 'settings',
      actionButtonText: 'Next',
      isLastStep: false,
      secondaryButtonText: 'Skip Tour',
      canSkip: true,
      tips: [
        'Dark mode available in Settings',
        'Control notification preferences',
        'View your account information',
      ],
    ),

    /// Step 5: Get Started (Final Step)
    OnboardingStep(
      id: 'onboarding_5_ready',
      stepNumber: 5,
      title: 'You\'re All Set!',
      description:
          'You\'re ready to start organizing your tasks. Create your first list now and get things done!',
      iconName: 'rocket',
      actionButtonText: 'Get Started',
      isLastStep: true,
      canSkip: false,
      tips: [
        'Tap the Home button to create your first list',
        'Don\'t worry, you can always review tips in Settings',
      ],
    ),
  ];

  /// Get a specific step by its step number
  static OnboardingStep? getStepByNumber(int stepNumber) {
    try {
      return steps.firstWhere((step) => step.stepNumber == stepNumber);
    } catch (e) {
      return null;
    }
  }

  /// Get the total number of steps
  static int getTotalSteps() => steps.length;

  /// Check if a step number is the last step
  static bool isLastStep(int stepNumber) {
    final step = getStepByNumber(stepNumber);
    return step?.isLastStep ?? false;
  }

  /// Get the next step number
  static int? getNextStepNumber(int currentStepNumber) {
    final nextStep = currentStepNumber + 1;
    if (nextStep <= getTotalSteps()) {
      return nextStep;
    }
    return null;
  }
}
