import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faiseur/core/data/datasources/firestore_datasource.dart';
import 'package:faiseur/features/todos/data/datasources/todos_remote_datasource.dart';
import 'package:faiseur/features/todos/data/models/todo_model.dart';
import 'package:faiseur/features/todos/domain/entities/todo.dart';

/// Implementation of TodosRemoteDatasource using Firestore
class TodosRemoteDatasourceImpl implements TodosRemoteDatasource {
  TodosRemoteDatasourceImpl({required FirestoreDatasource firestoreDatasource}) : _firestore = firestoreDatasource;

  final FirestoreDatasource _firestore;

  String _getTodosPath(String listId) => 'lists/$listId/todos';

  @override
  Future<List<Todo>> getTodos(String listId) async {
    try {
      final snapshot = await _firestore.getCollection(_getTodosPath(listId));
      final models = snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return TodoModel.fromJson(data);
      }).toList();

      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to get todos: $e');
    }
  }

  @override
  Future<Todo?> getTodo(String listId, String todoId) async {
    try {
      final doc = await _firestore.getDoc('${_getTodosPath(listId)}/$todoId');
      if (!doc.exists) {
        return null;
      }

      final data = doc.data();
      if (data == null) {
        return null;
      }

      data['id'] = doc.id;
      final model = TodoModel.fromJson(data);
      return model.toEntity();
    } catch (e) {
      throw Exception('Failed to get todo: $e');
    }
  }

  @override
  Future<Todo> createTodo(Todo todo) async {
    try {
      final model = todo.toModel();
      final data = model.toJson()..remove('id'); // Remove ID for auto-generation

      final docRef = await _firestore.addDoc(_getTodosPath(todo.listId), data);
      final createdTodo = todo.copyWith(id: docRef.id);
      return createdTodo;
    } catch (e) {
      throw Exception('Failed to create todo: $e');
    }
  }

  @override
  Future<Todo> updateTodo(Todo todo) async {
    try {
      final model = todo.toModel();
      final data = model.toJson()..remove('id'); // Don't update ID
      data['updatedAt'] = FieldValue.serverTimestamp(); // Update timestamp

      await _firestore.updateDoc('${_getTodosPath(todo.listId)}/${todo.id}', data);
      return todo.copyWith(updatedAt: DateTime.now());
    } catch (e) {
      throw Exception('Failed to update todo: $e');
    }
  }

  @override
  Future<void> deleteTodo(String listId, String todoId) async {
    try {
      await _firestore.deleteDoc('${_getTodosPath(listId)}/$todoId');
    } catch (e) {
      throw Exception('Failed to delete todo: $e');
    }
  }

  @override
  Stream<List<Todo>> watchTodos(String listId) => _firestore.watchCollection(_getTodosPath(listId)).map((snapshot) {
    final models = snapshot.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return TodoModel.fromJson(data);
    }).toList();

    return models.map((model) => model.toEntity()).toList();
  });

  @override
  Stream<Todo?> watchTodo(String listId, String todoId) =>
      _firestore.watchDoc('${_getTodosPath(listId)}/$todoId').map((doc) {
        if (!doc.exists) {
          return null;
        }

        final data = doc.data();
        if (data == null) {
          return null;
        }

        data['id'] = doc.id;
        final model = TodoModel.fromJson(data);
        return model.toEntity();
      });
}
