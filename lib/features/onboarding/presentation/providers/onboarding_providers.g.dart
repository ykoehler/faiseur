// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the CreateTutorialList use case

@ProviderFor(createTutorialListUseCase)
const createTutorialListUseCaseProvider = CreateTutorialListUseCaseProvider._();

/// Provider for the CreateTutorialList use case

final class CreateTutorialListUseCaseProvider
    extends $FunctionalProvider<CreateTutorialList, CreateTutorialList, CreateTutorialList>
    with $Provider<CreateTutorialList> {
  /// Provider for the CreateTutorialList use case
  const CreateTutorialListUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createTutorialListUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createTutorialListUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateTutorialList> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  CreateTutorialList create(Ref ref) {
    return createTutorialListUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateTutorialList value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<CreateTutorialList>(value));
  }
}

String _$createTutorialListUseCaseHash() => r'177e9054105307ff0fb7eb59546c17230e7ba838';

/// Notifier provider for onboarding state management

@ProviderFor(OnboardingNotifier)
const onboardingProvider = OnboardingNotifierProvider._();

/// Notifier provider for onboarding state management
final class OnboardingNotifierProvider extends $NotifierProvider<OnboardingNotifier, OnboardingState> {
  /// Notifier provider for onboarding state management
  const OnboardingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingNotifierHash();

  @$internal
  @override
  OnboardingNotifier create() => OnboardingNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingState value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<OnboardingState>(value));
  }
}

String _$onboardingNotifierHash() => r'2fc7d3f69321829901110ce833a15e98e9ad04d7';

/// Notifier provider for onboarding state management

abstract class _$OnboardingNotifier extends $Notifier<OnboardingState> {
  OnboardingState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<OnboardingState, OnboardingState>;
    final element =
        ref.element
            as $ClassProviderElement<AnyNotifier<OnboardingState, OnboardingState>, OnboardingState, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

/// Provider that checks if user has completed onboarding

@ProviderFor(hasCompletedOnboarding)
const hasCompletedOnboardingProvider = HasCompletedOnboardingProvider._();

/// Provider that checks if user has completed onboarding

final class HasCompletedOnboardingProvider extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  /// Provider that checks if user has completed onboarding
  const HasCompletedOnboardingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasCompletedOnboardingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasCompletedOnboardingHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return hasCompletedOnboarding(ref);
  }
}

String _$hasCompletedOnboardingHash() => r'5d9460c2dea29e57f65775bb91ef0f09dfe6cde6';

/// Current onboarding step

@ProviderFor(currentOnboardingStep)
const currentOnboardingStepProvider = CurrentOnboardingStepProvider._();

/// Current onboarding step

final class CurrentOnboardingStepProvider extends $FunctionalProvider<int, int, int> with $Provider<int> {
  /// Current onboarding step
  const CurrentOnboardingStepProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentOnboardingStepProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentOnboardingStepHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return currentOnboardingStep(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<int>(value));
  }
}

String _$currentOnboardingStepHash() => r'8d7499ebbe0edc2cd3133f20873205cdb4a64372';

/// Onboarding progress as percentage (0-1)

@ProviderFor(onboardingProgress)
const onboardingProgressProvider = OnboardingProgressProvider._();

/// Onboarding progress as percentage (0-1)

final class OnboardingProgressProvider extends $FunctionalProvider<double, double, double> with $Provider<double> {
  /// Onboarding progress as percentage (0-1)
  const OnboardingProgressProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingProgressProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingProgressHash();

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    return onboardingProgress(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<double>(value));
  }
}

String _$onboardingProgressHash() => r'ffc7ea64fbd2607f05098f02ba1752ec6355b78d';

/// Check if onboarding is completed

@ProviderFor(onboardingCompleted)
const onboardingCompletedProvider = OnboardingCompletedProvider._();

/// Check if onboarding is completed

final class OnboardingCompletedProvider extends $FunctionalProvider<bool, bool, bool> with $Provider<bool> {
  /// Check if onboarding is completed
  const OnboardingCompletedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingCompletedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingCompletedHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return onboardingCompleted(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<bool>(value));
  }
}

String _$onboardingCompletedHash() => r'2afd8720418216e6daeae1121be8bf498eb6b881';

/// Check if currently loading onboarding completion

@ProviderFor(onboardingIsLoading)
const onboardingIsLoadingProvider = OnboardingIsLoadingProvider._();

/// Check if currently loading onboarding completion

final class OnboardingIsLoadingProvider extends $FunctionalProvider<bool, bool, bool> with $Provider<bool> {
  /// Check if currently loading onboarding completion
  const OnboardingIsLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingIsLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingIsLoadingHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return onboardingIsLoading(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<bool>(value));
  }
}

String _$onboardingIsLoadingHash() => r'65d3e30c14f2c17252032b5ed0b425333089d4a3';

/// Get any error message from onboarding process

@ProviderFor(onboardingError)
const onboardingErrorProvider = OnboardingErrorProvider._();

/// Get any error message from onboarding process

final class OnboardingErrorProvider extends $FunctionalProvider<String?, String?, String?> with $Provider<String?> {
  /// Get any error message from onboarding process
  const OnboardingErrorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingErrorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingErrorHash();

  @$internal
  @override
  $ProviderElement<String?> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  String? create(Ref ref) {
    return onboardingError(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<String?>(value));
  }
}

String _$onboardingErrorHash() => r'5c1e7c847801921f7f0aafe734a1b504b5384f7a';
