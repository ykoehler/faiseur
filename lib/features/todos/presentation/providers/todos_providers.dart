import 'package:faiseur/features/auth/presentation/providers/auth_providers.dart';
import 'package:faiseur/features/todos/data/providers/todos_data_providers.dart';
import 'package:faiseur/features/todos/data/repositories/todos_repository_impl.dart';
import 'package:faiseur/features/todos/domain/entities/todo.dart';
import 'package:faiseur/features/todos/domain/repositories/todos_repository.dart';
import 'package:faiseur/features/todos/domain/usecases/usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todos_providers.g.dart';

// ============================================================================
// REPOSITORY PROVIDERS
// ============================================================================

/// Provider for the TodosRepository singleton instance
@riverpod
TodosRepository todosRepository(Ref ref) => TodosRepositoryImpl(
  remoteDatasource: ref.watch(todosRemoteDatasourceProvider),
);

// ============================================================================
// USE CASE PROVIDERS
// ============================================================================

/// Provider for GetTodos use case
@riverpod
GetTodos getTodosUseCase(Ref ref) =>
    GetTodos(ref.watch(todosRepositoryProvider));

/// Provider for CreateTodo use case
@riverpod
CreateTodo createTodoUseCase(Ref ref) =>
    CreateTodo(ref.watch(todosRepositoryProvider));

/// Provider for UpdateTodo use case
@riverpod
UpdateTodo updateTodoUseCase(Ref ref) =>
    UpdateTodo(ref.watch(todosRepositoryProvider));

/// Provider for DeleteTodo use case
@riverpod
DeleteTodo deleteTodoUseCase(Ref ref) =>
    DeleteTodo(ref.watch(todosRepositoryProvider));

// ============================================================================
// STREAM PROVIDERS FOR REAL-TIME DATA
// ============================================================================

/// Stream provider for todos in a list (real-time updates)
///
/// Parameters:
/// - [listId]: ID of the list to watch
///
/// Returns a stream of todos that updates whenever todos change.
@riverpod
Stream<List<Todo>> watchListTodos(Ref ref, String listId) =>
    ref.watch(getTodosUseCaseProvider).watch(listId);

// ============================================================================
// NOTIFIER FOR STATE MANAGEMENT
// ============================================================================

/// Notifier for managing todos state and operations
@riverpod
class TodosNotifier extends _$TodosNotifier {
  /// Current list ID being viewed
  late String _currentListId;

  @override
  AsyncValue<List<Todo>> build(String listId) {
    _currentListId = listId;
    return ref
        .watch(watchListTodosProvider(listId))
        .when(
          data: AsyncValue.data,
          loading: AsyncValue<List<Todo>>.loading,
          error: AsyncValue<List<Todo>>.error,
        );
  }

  /// Creates a new todo with the given parameters
  Future<Todo?> createTodo({
    required String title,
    String? description,
    DateTime? dueDate,
    List<String>? assignedTo,
    List<String>? tags,
  }) async {
    final authState = ref.read(authProvider);

    if (authState case AsyncData(value: final user?)) {
      try {
        final useCase = ref.read(createTodoUseCaseProvider);
        return await useCase.call(
          listId: _currentListId,
          title: title,
          createdBy: user.id,
          description: description,
          dueDate: dueDate,
          assignedTo: assignedTo,
          tags: tags,
        );
      } catch (e) {
        throw Exception('Failed to create todo: $e');
      }
    } else {
      throw Exception('User must be authenticated to create a todo');
    }
  }

  /// Updates an existing todo
  Future<Todo?> updateTodo(Todo todo) async {
    try {
      final useCase = ref.read(updateTodoUseCaseProvider);
      return await useCase.call(todo);
    } catch (e) {
      throw Exception('Failed to update todo: $e');
    }
  }

  /// Deletes a todo by ID
  Future<void> deleteTodo(String todoId) async {
    try {
      final useCase = ref.read(deleteTodoUseCaseProvider);
      await useCase.call(_currentListId, todoId);
    } catch (e) {
      throw Exception('Failed to delete todo: $e');
    }
  }

  /// Refreshes the list of todos
  Future<void> refresh() async {
    ref.invalidate(watchListTodosProvider(_currentListId));
  }
}
