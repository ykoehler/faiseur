import 'package:faiseur/features/onboarding/data/tutorial_data.dart';
import 'package:faiseur/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:faiseur/features/onboarding/presentation/widgets/onboarding_step_card.dart';
import 'package:faiseur/shared/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Onboarding page showing a step-by-step tutorial for new users
///
/// Displays each step of the onboarding flow with:
/// - Icon and visual content
/// - Title and description
/// - Tips and hints
/// - Navigation buttons (Previous, Next, Skip)
/// - Progress indicator
class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingState = ref.watch(onboardingProvider);
    final currentStep = onboardingState.currentStep;
    final totalSteps = onboardingState.totalSteps;
    final isLoading = onboardingState.isLoading;
    final error = onboardingState.error;

    // Get the current step data (1-indexed, so add 1 to currentStep)
    final stepData = TutorialData.getStepByNumber(currentStep + 1);

    if (stepData == null) {
      return Scaffold(body: Center(child: Text('Invalid onboarding step: ${currentStep + 1}')));
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Progress indicator
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Step ${currentStep + 1} of $totalSteps', style: Theme.of(context).textTheme.labelMedium),
                      Text(
                        '${((currentStep + 1) / totalSteps * 100).toStringAsFixed(0)}%',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(value: (currentStep + 1) / totalSteps, minHeight: 4),
                  ),
                ],
              ),
            ),

            // Step content
            Expanded(
              child: Stack(
                children: [
                  OnboardingStepCard(
                    step: stepData,
                    onNextPressed: () {
                      _handleNextStep(context, ref, stepData, currentStep, totalSteps);
                    },
                    onSkipPressed: () {
                      _handleSkip(context, ref);
                    },
                    onPreviousPressed: () {
                      ref.read(onboardingProvider.notifier).previousStep();
                    },
                    showPreviousButton: currentStep > 0,
                  ),
                  // Loading overlay
                  if (isLoading)
                    Container(
                      color: Colors.black.withValues(alpha: 0.3),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                ],
              ),
            ),

            // Error message
            if (error != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red[200]!),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.error_outline, color: Colors.red[700]),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(error, style: TextStyle(color: Colors.red[700])),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.red[700]),
                        onPressed: () {
                          ref.read(onboardingProvider.notifier).clearError();
                        },
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// Handle next button press
  void _handleNextStep(BuildContext context, WidgetRef ref, dynamic stepData, int currentStep, int totalSteps) async {
    // Check if this is the last step
    if (currentStep == totalSteps - 1) {
      // Complete onboarding
      final userId = ref.read(currentUserIdFromStateProvider);
      if (userId != null) {
        await ref.read(onboardingProvider.notifier).completeOnboarding(userId);

        // Navigate to lists page
        if (context.mounted) {
          context.go('/lists');
        }
      }
    } else {
      // Go to next step
      ref.read(onboardingProvider.notifier).nextStep();
    }
  }

  /// Handle skip button press
  void _handleSkip(BuildContext context, WidgetRef ref) {
    // Show confirmation dialog
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Skip Tutorial?'),
        content: const Text('You can always view the tutorial again in Settings. Are you sure you want to skip?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () async {
              final userId = ref.read(currentUserIdFromStateProvider);
              if (userId != null) {
                await ref.read(onboardingProvider.notifier).skipOnboarding(userId);
                if (context.mounted) {
                  Navigator.pop(context); // Close dialog
                  context.go('/lists'); // Go to lists
                }
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Skip'),
          ),
        ],
      ),
    );
  }
}
