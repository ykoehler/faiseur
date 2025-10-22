import 'package:faiseur/features/onboarding/domain/entities/onboarding_step.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_step_model.freezed.dart';

/// OnboardingStep data model with conversion capabilities
///
/// Extends the domain entity for Firestore persistence.
@freezed
abstract class OnboardingStepModel with _$OnboardingStepModel {
  const factory OnboardingStepModel({
    required String id,
    required int stepNumber,
    required String title,
    required String description,
    required String iconName,
    String? imageAsset,
    @Default('Next') String actionButtonText,
    @Default(false) bool isLastStep,
    String? secondaryButtonText,
    @Default([]) List<String> tips,
    @Default(true) bool canSkip,
    int? recommendedDuration,
  }) = _OnboardingStepModel;

  const OnboardingStepModel._();

  /// Converts data model to domain entity
  OnboardingStep toDomain() => OnboardingStep(
    id: id,
    stepNumber: stepNumber,
    title: title,
    description: description,
    iconName: iconName,
    imageAsset: imageAsset,
    actionButtonText: actionButtonText,
    isLastStep: isLastStep,
    secondaryButtonText: secondaryButtonText,
    tips: tips,
    canSkip: canSkip,
    recommendedDuration: recommendedDuration,
  );
}

/// Extension to convert domain entity to model
extension OnboardingStepExtension on OnboardingStep {
  /// Converts domain entity to data model
  OnboardingStepModel toModel() => OnboardingStepModel(
    id: id,
    stepNumber: stepNumber,
    title: title,
    description: description,
    iconName: iconName,
    imageAsset: imageAsset,
    actionButtonText: actionButtonText,
    isLastStep: isLastStep,
    secondaryButtonText: secondaryButtonText,
    tips: tips,
    canSkip: canSkip,
    recommendedDuration: recommendedDuration,
  );
}
