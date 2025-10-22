import 'package:faiseur/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:faiseur/features/auth/domain/entities/user.dart';
import 'package:faiseur/features/auth/domain/repositories/auth_repository.dart';
import 'package:faiseur/features/auth/domain/usecases/usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

/// Provider for the AuthRepository singleton instance
@riverpod
AuthRepository authRepository(Ref ref) => AuthRepositoryImpl();

/// Provider for SignInWithEmailUseCase
@riverpod
SignInWithEmailUseCase signInWithEmailUseCase(Ref ref) => SignInWithEmailUseCase(ref.watch(authRepositoryProvider));

/// Provider for SignUpWithEmailUseCase
@riverpod
SignUpWithEmailUseCase signUpWithEmailUseCase(Ref ref) => SignUpWithEmailUseCase(ref.watch(authRepositoryProvider));

/// Provider for SignOutUseCase
@riverpod
SignOutUseCase signOutUseCase(Ref ref) => SignOutUseCase(ref.watch(authRepositoryProvider));

/// Provider for GetCurrentUserUseCase
@riverpod
GetCurrentUserUseCase getCurrentUserUseCase(Ref ref) => GetCurrentUserUseCase(ref.watch(authRepositoryProvider));

/// Provider for SignInAnonymouslyUseCase
@riverpod
SignInAnonymouslyUseCase signInAnonymouslyUseCase(Ref ref) =>
    SignInAnonymouslyUseCase(ref.watch(authRepositoryProvider));

/// Stream provider for auth state changes
/// Emits the current user whenever auth state changes
@riverpod
Stream<User?> authStateChanges(Ref ref) => ref.watch(authRepositoryProvider).authStateChanges;

/// Future provider for current user
/// Fetches the current user from the repository
@riverpod
Future<User?> currentUser(Ref ref) async => ref.watch(getCurrentUserUseCaseProvider).call();

/// Notifier for auth state management
/// Handles all auth operations and maintains auth state
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AsyncValue<User?> build() {
    // Listen to auth state changes and update local state
    ref.listen(authStateChangesProvider, (previous, next) {
      next.whenData((user) {
        state = AsyncValue.data(user);
      });
    });

    // Initial state: fetch current user
    return const AsyncValue.loading();
  }

  /// Signs in with email and password
  Future<void> signInWithEmail({required String email, required String password}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final user = await ref.read(signInWithEmailUseCaseProvider).call(email: email, password: password);
      return user;
    });
  }

  /// Signs up with email, password, username, and display name
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required String username,
    required String displayName,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final user = await ref
          .read(signUpWithEmailUseCaseProvider)
          .call(email: email, password: password, username: username, displayName: displayName);
      return user;
    });
  }

  /// Signs in anonymously
  Future<void> signInAnonymously() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final user = await ref.read(signInAnonymouslyUseCaseProvider).call();
      return user;
    });
  }

  /// Signs out the current user
  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(signOutUseCaseProvider).call();
      return null;
    });
  }

  /// Refreshes the current user
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ref.read(getCurrentUserUseCaseProvider).call());
  }
}
