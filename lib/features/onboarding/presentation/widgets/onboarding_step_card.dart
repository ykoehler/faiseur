import 'package:faiseur/core/theme/colors.dart';
import 'package:faiseur/features/onboarding/domain/entities/onboarding_step.dart';
import 'package:flutter/material.dart';

/// Widget displaying a single onboarding step
///
/// Shows the step's content including icon, title, description,
/// tips, and action buttons.
class OnboardingStepCard extends StatelessWidget {
  const OnboardingStepCard({
    required this.step,
    required this.onNextPressed,
    required this.onSkipPressed,
    required this.onPreviousPressed,
    super.key,
    this.showPreviousButton = false,
  });

  /// The onboarding step to display
  final OnboardingStep step;

  /// Callback when the next/action button is pressed
  final VoidCallback onNextPressed;

  /// Callback when the skip button is pressed
  final VoidCallback onSkipPressed;

  /// Callback when the previous button is pressed
  final VoidCallback onPreviousPressed;

  /// Whether to show the previous button
  final bool showPreviousButton;

  /// Get the icon widget for the step
  Widget _buildIcon() {
    const iconSize = 80.0;
    const primaryColor = LightColors.primary;

    // Map icon names to actual icons
    switch (step.iconName) {
      case 'tasks':
        return const Icon(Icons.assignment, size: iconSize, color: primaryColor);
      case 'list':
        return const Icon(Icons.list, size: iconSize, color: primaryColor);
      case 'check_circle':
        return const Icon(Icons.check_circle, size: iconSize, color: primaryColor);
      case 'settings':
        return const Icon(Icons.settings, size: iconSize, color: primaryColor);
      case 'rocket':
        return const Icon(Icons.rocket_launch, size: iconSize, color: primaryColor);
      default:
        return const Icon(Icons.info, size: iconSize, color: primaryColor);
    }
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: LightColors.primary.withValues(alpha: 0.1), shape: BoxShape.circle),
            child: _buildIcon(),
          ),
          const SizedBox(height: 32),

          // Title
          Text(
            step.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Description
          Text(
            step.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 24),

          // Tips (if available)
          if (step.tips.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tips:', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  ...step.tips.map(
                    (tip) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• ', style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(width: 8),
                          Expanded(child: Text(tip, style: Theme.of(context).textTheme.bodyMedium)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],

          // Action Buttons
          const Spacer(),
          Column(
            children: [
              // Main action button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: onNextPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LightColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(step.actionButtonText, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(height: 12),

              // Secondary buttons row
              Row(
                children: [
                  // Previous button
                  if (showPreviousButton)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: onPreviousPressed,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: const BorderSide(color: LightColors.primary),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text(
                          'Previous',
                          style: TextStyle(color: LightColors.primary, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  if (showPreviousButton) const SizedBox(width: 12),

                  // Skip button
                  if (step.secondaryButtonText != null)
                    Expanded(
                      child: TextButton(
                        onPressed: onSkipPressed,
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(step.secondaryButtonText!, style: const TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
