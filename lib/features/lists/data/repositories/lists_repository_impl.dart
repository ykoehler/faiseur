import 'package:faiseur/features/lists/data/datasources/lists_remote_datasource.dart';
import 'package:faiseur/features/lists/domain/entities/todo_list.dart';
import 'package:faiseur/features/lists/domain/repositories/lists_repository.dart';

/// Implementation of ListsRepository using remote datasource
class ListsRepositoryImpl implements ListsRepository {
  ListsRepositoryImpl({required ListsRemoteDatasource remoteDatasource}) : _remoteDatasource = remoteDatasource;

  final ListsRemoteDatasource _remoteDatasource;

  @override
  Future<List<TodoList>> getUserLists(String userId) async => _remoteDatasource.getUserLists(userId);

  @override
  Future<TodoList?> getList(String listId) async => _remoteDatasource.getList(listId);

  @override
  Future<TodoList> createList({
    required String title,
    required String color,
    required String ownerId,
    String? description,
  }) async {
    final list = TodoList(
      id: '', // Will be set by Firestore
      title: title,
      color: color,
      ownerId: ownerId,
      createdAt: DateTime.now(),
      description: description,
    );

    return _remoteDatasource.createList(list);
  }

  @override
  Future<TodoList> updateList(TodoList list) async => _remoteDatasource.updateList(list);

  @override
  Future<void> deleteList(String listId) async {
    await _remoteDatasource.deleteList(listId);
  }

  @override
  Stream<List<TodoList>> watchUserLists(String userId) => _remoteDatasource.watchUserLists(userId);

  @override
  Stream<TodoList?> watchList(String listId) => _remoteDatasource.watchList(listId);
}
