import 'package:faiseur/features/todos/data/datasources/todos_remote_datasource.dart';
import 'package:faiseur/features/todos/domain/entities/todo.dart';
import 'package:faiseur/features/todos/domain/repositories/todos_repository.dart';

/// Implementation of TodosRepository using remote datasource
class TodosRepositoryImpl implements TodosRepository {
  TodosRepositoryImpl({required TodosRemoteDatasource remoteDatasource})
    : _remoteDatasource = remoteDatasource;

  final TodosRemoteDatasource _remoteDatasource;

  @override
  Future<List<Todo>> getTodos(String listId) async =>
      _remoteDatasource.getTodos(listId);

  @override
  Future<Todo?> getTodo(String listId, String todoId) async =>
      _remoteDatasource.getTodo(listId, todoId);

  @override
  Future<Todo> createTodo({
    required String listId,
    required String title,
    required String createdBy,
    String? description,
    DateTime? dueDate,
    List<String>? assignedTo,
    List<String>? tags,
  }) async {
    final todo = Todo(
      id: '', // Will be set by Firestore
      listId: listId,
      title: title,
      createdBy: createdBy,
      createdAt: DateTime.now(),
      description: description,
      dueDate: dueDate,
      assignedTo: assignedTo ?? [],
      tags: tags ?? [],
    );

    return _remoteDatasource.createTodo(todo);
  }

  @override
  Future<Todo> updateTodo(Todo todo) async =>
      _remoteDatasource.updateTodo(todo);

  @override
  Future<void> deleteTodo(String listId, String todoId) async {
    await _remoteDatasource.deleteTodo(listId, todoId);
  }

  @override
  Stream<List<Todo>> watchTodos(String listId) =>
      _remoteDatasource.watchTodos(listId);

  @override
  Stream<Todo?> watchTodo(String listId, String todoId) =>
      _remoteDatasource.watchTodo(listId, todoId);
}
