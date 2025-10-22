// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the TodosRepository singleton instance

@ProviderFor(todosRepository)
const todosRepositoryProvider = TodosRepositoryProvider._();

/// Provider for the TodosRepository singleton instance

final class TodosRepositoryProvider extends $FunctionalProvider<TodosRepository, TodosRepository, TodosRepository>
    with $Provider<TodosRepository> {
  /// Provider for the TodosRepository singleton instance
  const TodosRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todosRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todosRepositoryHash();

  @$internal
  @override
  $ProviderElement<TodosRepository> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  TodosRepository create(Ref ref) {
    return todosRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TodosRepository value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<TodosRepository>(value));
  }
}

String _$todosRepositoryHash() => r'057e4bed221a213a6805464ae9e7d8c373011e43';

/// Provider for GetTodos use case

@ProviderFor(getTodosUseCase)
const getTodosUseCaseProvider = GetTodosUseCaseProvider._();

/// Provider for GetTodos use case

final class GetTodosUseCaseProvider extends $FunctionalProvider<GetTodos, GetTodos, GetTodos> with $Provider<GetTodos> {
  /// Provider for GetTodos use case
  const GetTodosUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTodosUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTodosUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetTodos> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  GetTodos create(Ref ref) {
    return getTodosUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetTodos value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<GetTodos>(value));
  }
}

String _$getTodosUseCaseHash() => r'ce70c37bdb505cf7a2283b3c5a3792f56eb352dd';

/// Provider for CreateTodo use case

@ProviderFor(createTodoUseCase)
const createTodoUseCaseProvider = CreateTodoUseCaseProvider._();

/// Provider for CreateTodo use case

final class CreateTodoUseCaseProvider extends $FunctionalProvider<CreateTodo, CreateTodo, CreateTodo>
    with $Provider<CreateTodo> {
  /// Provider for CreateTodo use case
  const CreateTodoUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createTodoUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createTodoUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateTodo> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  CreateTodo create(Ref ref) {
    return createTodoUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateTodo value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<CreateTodo>(value));
  }
}

String _$createTodoUseCaseHash() => r'69bf996677e094d7492f730b26c4f53fa4fc2133';

/// Provider for UpdateTodo use case

@ProviderFor(updateTodoUseCase)
const updateTodoUseCaseProvider = UpdateTodoUseCaseProvider._();

/// Provider for UpdateTodo use case

final class UpdateTodoUseCaseProvider extends $FunctionalProvider<UpdateTodo, UpdateTodo, UpdateTodo>
    with $Provider<UpdateTodo> {
  /// Provider for UpdateTodo use case
  const UpdateTodoUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateTodoUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateTodoUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateTodo> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  UpdateTodo create(Ref ref) {
    return updateTodoUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateTodo value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<UpdateTodo>(value));
  }
}

String _$updateTodoUseCaseHash() => r'e4ff3831c943e926ad646fdc8a1d98c4423dc0e8';

/// Provider for DeleteTodo use case

@ProviderFor(deleteTodoUseCase)
const deleteTodoUseCaseProvider = DeleteTodoUseCaseProvider._();

/// Provider for DeleteTodo use case

final class DeleteTodoUseCaseProvider extends $FunctionalProvider<DeleteTodo, DeleteTodo, DeleteTodo>
    with $Provider<DeleteTodo> {
  /// Provider for DeleteTodo use case
  const DeleteTodoUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteTodoUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteTodoUseCaseHash();

  @$internal
  @override
  $ProviderElement<DeleteTodo> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  DeleteTodo create(Ref ref) {
    return deleteTodoUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteTodo value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<DeleteTodo>(value));
  }
}

String _$deleteTodoUseCaseHash() => r'2a1adfc7a0a7fcf42b308d785d3266902efae50f';

/// Stream provider for todos in a list (real-time updates)
///
/// Parameters:
/// - [listId]: ID of the list to watch
///
/// Returns a stream of todos that updates whenever todos change.

@ProviderFor(watchListTodos)
const watchListTodosProvider = WatchListTodosFamily._();

/// Stream provider for todos in a list (real-time updates)
///
/// Parameters:
/// - [listId]: ID of the list to watch
///
/// Returns a stream of todos that updates whenever todos change.

final class WatchListTodosProvider extends $FunctionalProvider<AsyncValue<List<Todo>>, List<Todo>, Stream<List<Todo>>>
    with $FutureModifier<List<Todo>>, $StreamProvider<List<Todo>> {
  /// Stream provider for todos in a list (real-time updates)
  ///
  /// Parameters:
  /// - [listId]: ID of the list to watch
  ///
  /// Returns a stream of todos that updates whenever todos change.
  const WatchListTodosProvider._({required WatchListTodosFamily super.from, required String super.argument})
    : super(
        retry: null,
        name: r'watchListTodosProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchListTodosHash();

  @override
  String toString() {
    return r'watchListTodosProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Todo>> $createElement($ProviderPointer pointer) => $StreamProviderElement(pointer);

  @override
  Stream<List<Todo>> create(Ref ref) {
    final argument = this.argument as String;
    return watchListTodos(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchListTodosProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$watchListTodosHash() => r'a44d8ce1a0b2e028afe1259924fe0d7f91b5706c';

/// Stream provider for todos in a list (real-time updates)
///
/// Parameters:
/// - [listId]: ID of the list to watch
///
/// Returns a stream of todos that updates whenever todos change.

final class WatchListTodosFamily extends $Family with $FunctionalFamilyOverride<Stream<List<Todo>>, String> {
  const WatchListTodosFamily._()
    : super(
        retry: null,
        name: r'watchListTodosProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Stream provider for todos in a list (real-time updates)
  ///
  /// Parameters:
  /// - [listId]: ID of the list to watch
  ///
  /// Returns a stream of todos that updates whenever todos change.

  WatchListTodosProvider call(String listId) => WatchListTodosProvider._(argument: listId, from: this);

  @override
  String toString() => r'watchListTodosProvider';
}

/// Notifier for managing todos state and operations

@ProviderFor(TodosNotifier)
const todosProvider = TodosNotifierFamily._();

/// Notifier for managing todos state and operations
final class TodosNotifierProvider extends $NotifierProvider<TodosNotifier, AsyncValue<List<Todo>>> {
  /// Notifier for managing todos state and operations
  const TodosNotifierProvider._({required TodosNotifierFamily super.from, required String super.argument})
    : super(
        retry: null,
        name: r'todosProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todosNotifierHash();

  @override
  String toString() {
    return r'todosProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TodosNotifier create() => TodosNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Todo>> value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<AsyncValue<List<Todo>>>(value));
  }

  @override
  bool operator ==(Object other) {
    return other is TodosNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$todosNotifierHash() => r'69d34e8eca6f238914dfa4f5e3327826ece91f31';

/// Notifier for managing todos state and operations

final class TodosNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          TodosNotifier,
          AsyncValue<List<Todo>>,
          AsyncValue<List<Todo>>,
          AsyncValue<List<Todo>>,
          String
        > {
  const TodosNotifierFamily._()
    : super(
        retry: null,
        name: r'todosProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Notifier for managing todos state and operations

  TodosNotifierProvider call(String listId) => TodosNotifierProvider._(argument: listId, from: this);

  @override
  String toString() => r'todosProvider';
}

/// Notifier for managing todos state and operations

abstract class _$TodosNotifier extends $Notifier<AsyncValue<List<Todo>>> {
  late final _$args = ref.$arg as String;
  String get listId => _$args;

  AsyncValue<List<Todo>> build(String listId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<List<Todo>>, AsyncValue<List<Todo>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Todo>>, AsyncValue<List<Todo>>>,
              AsyncValue<List<Todo>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
