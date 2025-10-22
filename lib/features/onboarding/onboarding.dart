/// Onboarding feature - first-time user experience
///
/// This module provides onboarding flow and tutorial system for new users.
/// It includes:
/// - Onboarding page with step-by-step tutorial
/// - Tutorial data with helpful tips
/// - Creating a tutorial list with sample todos
/// - Persistent storage of onboarding completion status
///
/// Export public APIs only
library;

export 'domain/entities/onboarding_step.dart';
export 'domain/usecases/create_tutorial_list.dart';
export 'presentation/pages/onboarding_page.dart';
export 'presentation/providers/onboarding_providers.dart';
