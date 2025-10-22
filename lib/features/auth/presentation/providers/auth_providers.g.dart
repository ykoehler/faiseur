// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the AuthRepository singleton instance

@ProviderFor(authRepository)
const authRepositoryProvider = AuthRepositoryProvider._();

/// Provider for the AuthRepository singleton instance

final class AuthRepositoryProvider extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  /// Provider for the AuthRepository singleton instance
  const AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<AuthRepository>(value));
  }
}

String _$authRepositoryHash() => r'a8767550d220ede9bb05149c073a651c4422d5ef';

/// Provider for SignInWithEmailUseCase

@ProviderFor(signInWithEmailUseCase)
const signInWithEmailUseCaseProvider = SignInWithEmailUseCaseProvider._();

/// Provider for SignInWithEmailUseCase

final class SignInWithEmailUseCaseProvider
    extends $FunctionalProvider<SignInWithEmailUseCase, SignInWithEmailUseCase, SignInWithEmailUseCase>
    with $Provider<SignInWithEmailUseCase> {
  /// Provider for SignInWithEmailUseCase
  const SignInWithEmailUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signInWithEmailUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signInWithEmailUseCaseHash();

  @$internal
  @override
  $ProviderElement<SignInWithEmailUseCase> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  SignInWithEmailUseCase create(Ref ref) {
    return signInWithEmailUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignInWithEmailUseCase value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<SignInWithEmailUseCase>(value));
  }
}

String _$signInWithEmailUseCaseHash() => r'4554d6035586722fcff491df1ed2e6f961093df0';

/// Provider for SignUpWithEmailUseCase

@ProviderFor(signUpWithEmailUseCase)
const signUpWithEmailUseCaseProvider = SignUpWithEmailUseCaseProvider._();

/// Provider for SignUpWithEmailUseCase

final class SignUpWithEmailUseCaseProvider
    extends $FunctionalProvider<SignUpWithEmailUseCase, SignUpWithEmailUseCase, SignUpWithEmailUseCase>
    with $Provider<SignUpWithEmailUseCase> {
  /// Provider for SignUpWithEmailUseCase
  const SignUpWithEmailUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signUpWithEmailUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signUpWithEmailUseCaseHash();

  @$internal
  @override
  $ProviderElement<SignUpWithEmailUseCase> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  SignUpWithEmailUseCase create(Ref ref) {
    return signUpWithEmailUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignUpWithEmailUseCase value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<SignUpWithEmailUseCase>(value));
  }
}

String _$signUpWithEmailUseCaseHash() => r'12d4a0a85a909006c9fe40d378af86dcf201578f';

/// Provider for SignOutUseCase

@ProviderFor(signOutUseCase)
const signOutUseCaseProvider = SignOutUseCaseProvider._();

/// Provider for SignOutUseCase

final class SignOutUseCaseProvider extends $FunctionalProvider<SignOutUseCase, SignOutUseCase, SignOutUseCase>
    with $Provider<SignOutUseCase> {
  /// Provider for SignOutUseCase
  const SignOutUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signOutUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signOutUseCaseHash();

  @$internal
  @override
  $ProviderElement<SignOutUseCase> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  SignOutUseCase create(Ref ref) {
    return signOutUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignOutUseCase value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<SignOutUseCase>(value));
  }
}

String _$signOutUseCaseHash() => r'952ce342ca22dc7bb696cc8e5787d2889240ef98';

/// Provider for GetCurrentUserUseCase

@ProviderFor(getCurrentUserUseCase)
const getCurrentUserUseCaseProvider = GetCurrentUserUseCaseProvider._();

/// Provider for GetCurrentUserUseCase

final class GetCurrentUserUseCaseProvider
    extends $FunctionalProvider<GetCurrentUserUseCase, GetCurrentUserUseCase, GetCurrentUserUseCase>
    with $Provider<GetCurrentUserUseCase> {
  /// Provider for GetCurrentUserUseCase
  const GetCurrentUserUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCurrentUserUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCurrentUserUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetCurrentUserUseCase> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  GetCurrentUserUseCase create(Ref ref) {
    return getCurrentUserUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCurrentUserUseCase value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<GetCurrentUserUseCase>(value));
  }
}

String _$getCurrentUserUseCaseHash() => r'4a27d130940e444424e46ed4afad7c5a5c8cf5b2';

/// Provider for SignInAnonymouslyUseCase

@ProviderFor(signInAnonymouslyUseCase)
const signInAnonymouslyUseCaseProvider = SignInAnonymouslyUseCaseProvider._();

/// Provider for SignInAnonymouslyUseCase

final class SignInAnonymouslyUseCaseProvider
    extends $FunctionalProvider<SignInAnonymouslyUseCase, SignInAnonymouslyUseCase, SignInAnonymouslyUseCase>
    with $Provider<SignInAnonymouslyUseCase> {
  /// Provider for SignInAnonymouslyUseCase
  const SignInAnonymouslyUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signInAnonymouslyUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signInAnonymouslyUseCaseHash();

  @$internal
  @override
  $ProviderElement<SignInAnonymouslyUseCase> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  SignInAnonymouslyUseCase create(Ref ref) {
    return signInAnonymouslyUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignInAnonymouslyUseCase value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<SignInAnonymouslyUseCase>(value));
  }
}

String _$signInAnonymouslyUseCaseHash() => r'41dceae4be76518427dce164729a976c9ccbfac6';

/// Stream provider for auth state changes
/// Emits the current user whenever auth state changes

@ProviderFor(authStateChanges)
const authStateChangesProvider = AuthStateChangesProvider._();

/// Stream provider for auth state changes
/// Emits the current user whenever auth state changes

final class AuthStateChangesProvider extends $FunctionalProvider<AsyncValue<User?>, User?, Stream<User?>>
    with $FutureModifier<User?>, $StreamProvider<User?> {
  /// Stream provider for auth state changes
  /// Emits the current user whenever auth state changes
  const AuthStateChangesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authStateChangesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authStateChangesHash();

  @$internal
  @override
  $StreamProviderElement<User?> $createElement($ProviderPointer pointer) => $StreamProviderElement(pointer);

  @override
  Stream<User?> create(Ref ref) {
    return authStateChanges(ref);
  }
}

String _$authStateChangesHash() => r'f95512f3016c4609549bf37ef775d5ac547a7179';

/// Future provider for current user
/// Fetches the current user from the repository

@ProviderFor(currentUser)
const currentUserProvider = CurrentUserProvider._();

/// Future provider for current user
/// Fetches the current user from the repository

final class CurrentUserProvider extends $FunctionalProvider<AsyncValue<User?>, User?, FutureOr<User?>>
    with $FutureModifier<User?>, $FutureProvider<User?> {
  /// Future provider for current user
  /// Fetches the current user from the repository
  const CurrentUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserHash();

  @$internal
  @override
  $FutureProviderElement<User?> $createElement($ProviderPointer pointer) => $FutureProviderElement(pointer);

  @override
  FutureOr<User?> create(Ref ref) {
    return currentUser(ref);
  }
}

String _$currentUserHash() => r'9e8856be05e41215f756ab3c4ab1198a1e4ae83d';

/// Notifier for auth state management
/// Handles all auth operations and maintains auth state

@ProviderFor(AuthNotifier)
const authProvider = AuthNotifierProvider._();

/// Notifier for auth state management
/// Handles all auth operations and maintains auth state
final class AuthNotifierProvider extends $NotifierProvider<AuthNotifier, AsyncValue<User?>> {
  /// Notifier for auth state management
  /// Handles all auth operations and maintains auth state
  const AuthNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authNotifierHash();

  @$internal
  @override
  AuthNotifier create() => AuthNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<User?> value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<AsyncValue<User?>>(value));
  }
}

String _$authNotifierHash() => r'6f8556f33e000b654a67e408d52da4ddc4680b15';

/// Notifier for auth state management
/// Handles all auth operations and maintains auth state

abstract class _$AuthNotifier extends $Notifier<AsyncValue<User?>> {
  AsyncValue<User?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<User?>, AsyncValue<User?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<User?>, AsyncValue<User?>>,
              AsyncValue<User?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
