import 'package:faiseur/features/auth/presentation/providers/auth_providers.dart';
import 'package:faiseur/features/lists/data/providers/lists_data_providers.dart';
import 'package:faiseur/features/lists/data/repositories/lists_repository_impl.dart';
import 'package:faiseur/features/lists/domain/entities/todo_list.dart';
import 'package:faiseur/features/lists/domain/repositories/lists_repository.dart';
import 'package:faiseur/features/lists/domain/usecases/usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lists_providers.g.dart';

// ============================================================================
// REPOSITORY PROVIDERS
// ============================================================================

/// Provider for the ListsRepository singleton instance
@riverpod
ListsRepository listsRepository(Ref ref) => ListsRepositoryImpl(
  remoteDatasource: ref.watch(listsRemoteDatasourceProvider),
);

// ============================================================================
// USE CASE PROVIDERS
// ============================================================================

/// Provider for GetUserLists use case
@riverpod
GetUserLists getUserListsUseCase(Ref ref) =>
    GetUserLists(repository: ref.watch(listsRepositoryProvider));

/// Provider for CreateList use case
@riverpod
CreateList createListUseCase(Ref ref) =>
    CreateList(repository: ref.watch(listsRepositoryProvider));

/// Provider for UpdateList use case
@riverpod
UpdateList updateListUseCase(Ref ref) =>
    UpdateList(repository: ref.watch(listsRepositoryProvider));

/// Provider for DeleteList use case
@riverpod
DeleteList deleteListUseCase(Ref ref) =>
    DeleteList(repository: ref.watch(listsRepositoryProvider));

// ============================================================================
// STREAM PROVIDERS FOR REAL-TIME DATA
// ============================================================================

/// Stream provider for user's lists (real-time updates)
///
/// Returns a stream of lists that updates whenever lists change.
/// Only provides data when user is authenticated.
@riverpod
Stream<List<TodoList>> userLists(Ref ref) {
  final authState = ref.watch(authProvider);

  return authState
      .whenData((user) {
        if (user == null) {
          return Stream.value(<TodoList>[]);
        }
        return ref.watch(getUserListsUseCaseProvider).watch(user.id);
      })
      .maybeWhen(orElse: () => Stream.value(<TodoList>[]));
}

// ============================================================================
// NOTIFIER FOR STATE MANAGEMENT
// ============================================================================

/// Notifier for managing lists state and operations
@riverpod
class ListsNotifier extends _$ListsNotifier {
  @override
  AsyncValue<List<TodoList>> build() => ref
      .watch(userListsProvider)
      .when(
        data: AsyncValue.data,
        loading: AsyncValue<List<TodoList>>.loading,
        error: AsyncValue<List<TodoList>>.error,
      );

  /// Creates a new list with the given parameters
  Future<TodoList?> createList({
    required String title,
    required String color,
    String? description,
  }) async {
    final authState = ref.read(authProvider);

    if (authState case AsyncData(value: final user?)) {
      try {
        final useCase = ref.read(createListUseCaseProvider);
        final params = CreateListParams(
          title: title,
          color: color,
          ownerId: user.id,
          description: description,
        );
        return await useCase.call(params);
      } catch (e) {
        throw Exception('Failed to create list: $e');
      }
    } else {
      throw Exception('User must be authenticated to create a list');
    }
  }

  /// Updates an existing list
  Future<TodoList?> updateList(TodoList list) async {
    try {
      final useCase = ref.read(updateListUseCaseProvider);
      return await useCase.call(list);
    } catch (e) {
      throw Exception('Failed to update list: $e');
    }
  }

  /// Deletes a list by ID
  Future<void> deleteList(String listId) async {
    try {
      final useCase = ref.read(deleteListUseCaseProvider);
      await useCase.call(listId);
    } catch (e) {
      throw Exception('Failed to delete list: $e');
    }
  }

  /// Refreshes the list of user's lists
  Future<void> refresh() async {
    ref.invalidate(userListsProvider);
  }
}
