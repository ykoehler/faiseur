import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_step.freezed.dart';

/// OnboardingStep domain entity representing a single step in the onboarding flow.
///
/// Each step contains content to educate new users about app features.
@freezed
abstract class OnboardingStep with _$OnboardingStep {
  const factory OnboardingStep({
    /// Unique identifier for the onboarding step
    required String id,

    /// Order of this step in the onboarding sequence
    required int stepNumber,

    /// Title of the onboarding step (displayed at top)
    required String title,

    /// Description/body text of the step
    required String description,

    /// Icon asset path or icon data identifier
    /// Examples: 'assets/icons/list.svg', 'lists', 'todo', 'settings'
    required String iconName,

    /// Optional visual content asset path
    /// Examples: 'assets/illustrations/list_feature.svg'
    String? imageAsset,

    /// Main action button text (e.g., "Next", "Create a List")
    @Default('Next') String actionButtonText,

    /// Whether this is the last step in the onboarding sequence
    @Default(false) bool isLastStep,

    /// Optional secondary button text (e.g., "Skip")
    /// If provided, a secondary button will be shown
    String? secondaryButtonText,

    /// Optional detailed tips or hints
    @Default([]) List<String> tips,

    /// Whether users can skip this step
    @Default(true) bool canSkip,

    /// Optional time in seconds to recommend user spend on this step
    int? recommendedDuration,
  }) = _OnboardingStep;
}
