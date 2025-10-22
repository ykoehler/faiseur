// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for the ListsRepository singleton instance

@ProviderFor(listsRepository)
const listsRepositoryProvider = ListsRepositoryProvider._();

/// Provider for the ListsRepository singleton instance

final class ListsRepositoryProvider extends $FunctionalProvider<ListsRepository, ListsRepository, ListsRepository>
    with $Provider<ListsRepository> {
  /// Provider for the ListsRepository singleton instance
  const ListsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ListsRepository> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  ListsRepository create(Ref ref) {
    return listsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListsRepository value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<ListsRepository>(value));
  }
}

String _$listsRepositoryHash() => r'e6829754e41029ec7decf821a82c9d30fd184ff6';

/// Provider for GetUserLists use case

@ProviderFor(getUserListsUseCase)
const getUserListsUseCaseProvider = GetUserListsUseCaseProvider._();

/// Provider for GetUserLists use case

final class GetUserListsUseCaseProvider extends $FunctionalProvider<GetUserLists, GetUserLists, GetUserLists>
    with $Provider<GetUserLists> {
  /// Provider for GetUserLists use case
  const GetUserListsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUserListsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUserListsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetUserLists> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  GetUserLists create(Ref ref) {
    return getUserListsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetUserLists value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<GetUserLists>(value));
  }
}

String _$getUserListsUseCaseHash() => r'1b943083ff5ceb6f653ad224c36c7798de75f055';

/// Provider for CreateList use case

@ProviderFor(createListUseCase)
const createListUseCaseProvider = CreateListUseCaseProvider._();

/// Provider for CreateList use case

final class CreateListUseCaseProvider extends $FunctionalProvider<CreateList, CreateList, CreateList>
    with $Provider<CreateList> {
  /// Provider for CreateList use case
  const CreateListUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createListUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createListUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateList> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  CreateList create(Ref ref) {
    return createListUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateList value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<CreateList>(value));
  }
}

String _$createListUseCaseHash() => r'1b875b66fdfc8696bcfdf10016a578022c178e9d';

/// Provider for UpdateList use case

@ProviderFor(updateListUseCase)
const updateListUseCaseProvider = UpdateListUseCaseProvider._();

/// Provider for UpdateList use case

final class UpdateListUseCaseProvider extends $FunctionalProvider<UpdateList, UpdateList, UpdateList>
    with $Provider<UpdateList> {
  /// Provider for UpdateList use case
  const UpdateListUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateListUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateListUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateList> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  UpdateList create(Ref ref) {
    return updateListUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateList value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<UpdateList>(value));
  }
}

String _$updateListUseCaseHash() => r'a9187a99038a3b3b7700d903d145f59e240c5990';

/// Provider for DeleteList use case

@ProviderFor(deleteListUseCase)
const deleteListUseCaseProvider = DeleteListUseCaseProvider._();

/// Provider for DeleteList use case

final class DeleteListUseCaseProvider extends $FunctionalProvider<DeleteList, DeleteList, DeleteList>
    with $Provider<DeleteList> {
  /// Provider for DeleteList use case
  const DeleteListUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteListUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteListUseCaseHash();

  @$internal
  @override
  $ProviderElement<DeleteList> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  DeleteList create(Ref ref) {
    return deleteListUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteList value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<DeleteList>(value));
  }
}

String _$deleteListUseCaseHash() => r'5a54599d8264d85d458630fb52bc2b669342c8f7';

/// Stream provider for user's lists (real-time updates)
///
/// Returns a stream of lists that updates whenever lists change.
/// Only provides data when user is authenticated.

@ProviderFor(userLists)
const userListsProvider = UserListsProvider._();

/// Stream provider for user's lists (real-time updates)
///
/// Returns a stream of lists that updates whenever lists change.
/// Only provides data when user is authenticated.

final class UserListsProvider
    extends $FunctionalProvider<AsyncValue<List<TodoList>>, List<TodoList>, Stream<List<TodoList>>>
    with $FutureModifier<List<TodoList>>, $StreamProvider<List<TodoList>> {
  /// Stream provider for user's lists (real-time updates)
  ///
  /// Returns a stream of lists that updates whenever lists change.
  /// Only provides data when user is authenticated.
  const UserListsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userListsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userListsHash();

  @$internal
  @override
  $StreamProviderElement<List<TodoList>> $createElement($ProviderPointer pointer) => $StreamProviderElement(pointer);

  @override
  Stream<List<TodoList>> create(Ref ref) {
    return userLists(ref);
  }
}

String _$userListsHash() => r'375aaf35cdfcb04d5437ac72fa8b6630012baeba';

/// Notifier for managing lists state and operations

@ProviderFor(ListsNotifier)
const listsProvider = ListsNotifierProvider._();

/// Notifier for managing lists state and operations
final class ListsNotifierProvider extends $NotifierProvider<ListsNotifier, AsyncValue<List<TodoList>>> {
  /// Notifier for managing lists state and operations
  const ListsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listsNotifierHash();

  @$internal
  @override
  ListsNotifier create() => ListsNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<TodoList>> value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<AsyncValue<List<TodoList>>>(value));
  }
}

String _$listsNotifierHash() => r'd222613230bf231b0203fefb7bf338b26067d3a5';

/// Notifier for managing lists state and operations

abstract class _$ListsNotifier extends $Notifier<AsyncValue<List<TodoList>>> {
  AsyncValue<List<TodoList>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<TodoList>>, AsyncValue<List<TodoList>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<TodoList>>, AsyncValue<List<TodoList>>>,
              AsyncValue<List<TodoList>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
