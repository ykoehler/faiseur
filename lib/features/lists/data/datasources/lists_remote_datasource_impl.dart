import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faiseur/core/data/datasources/firestore_datasource.dart';
import 'package:faiseur/features/lists/data/datasources/lists_remote_datasource.dart';
import 'package:faiseur/features/lists/data/models/todo_list_model.dart';
import 'package:faiseur/features/lists/domain/entities/todo_list.dart';

/// Implementation of ListsRemoteDatasource using Firestore
class ListsRemoteDatasourceImpl implements ListsRemoteDatasource {
  ListsRemoteDatasourceImpl({required FirestoreDatasource firestoreDatasource}) : _firestore = firestoreDatasource;

  final FirestoreDatasource _firestore;

  static const String _listsCollection = 'lists';

  @override
  Future<List<TodoList>> getUserLists(String userId) async {
    try {
      // Query lists where user is owner or collaborator
      final ownerListsQuery = _firestore.query(_listsCollection).where('ownerId', isEqualTo: userId);
      final ownerListsSnapshot = await ownerListsQuery.get();

      final collaboratorListsQuery = _firestore
          .query(_listsCollection)
          .where('collaborators.$userId', isNotEqualTo: null);
      final collaboratorListsSnapshot = await collaboratorListsQuery.get();

      // Combine and deduplicate results
      final allDocs = [...ownerListsSnapshot.docs, ...collaboratorListsSnapshot.docs];
      final uniqueDocs = <String, QueryDocumentSnapshot<Map<String, dynamic>>>{};

      for (final doc in allDocs) {
        uniqueDocs[doc.id] = doc;
      }

      final models = uniqueDocs.values.map((doc) {
        final data = doc.data();
        data['id'] = doc.id; // Ensure ID is set
        return todoListModelFromJson(data);
      }).toList();

      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to get user lists: $e');
    }
  }

  @override
  Future<TodoList?> getList(String listId) async {
    try {
      final doc = await _firestore.getDoc('$_listsCollection/$listId');
      if (!doc.exists) {
        return null;
      }

      final data = doc.data();
      if (data == null) {
        return null;
      }

      data['id'] = doc.id;
      final model = todoListModelFromJson(data);
      return model.toEntity();
    } catch (e) {
      throw Exception('Failed to get list: $e');
    }
  }

  @override
  Future<TodoList> createList(TodoList list) async {
    try {
      final model = list.toModel();
      final data = todoListModelToJson(model)..remove('id'); // Remove ID for auto-generation

      final docRef = await _firestore.addDoc(_listsCollection, data);
      final createdList = list.copyWith(id: docRef.id);
      return createdList;
    } catch (e) {
      throw Exception('Failed to create list: $e');
    }
  }

  @override
  Future<TodoList> updateList(TodoList list) async {
    try {
      final model = list.toModel();
      final data = todoListModelToJson(model)..remove('id'); // Don't update ID
      data['updatedAt'] = FieldValue.serverTimestamp(); // Update timestamp

      await _firestore.updateDoc('$_listsCollection/${list.id}', data);
      return list.copyWith(updatedAt: DateTime.now());
    } catch (e) {
      throw Exception('Failed to update list: $e');
    }
  }

  @override
  Future<void> deleteList(String listId) async {
    try {
      await _firestore.deleteDoc('$_listsCollection/$listId');
    } catch (e) {
      throw Exception('Failed to delete list: $e');
    }
  }

  @override
  Stream<List<TodoList>> watchUserLists(String userId) => _firestore.watchCollection(_listsCollection).map((snapshot) {
    final docs = snapshot.docs.where((doc) {
      final data = doc.data();
      final isOwner = data['ownerId'] == userId;
      final isCollaborator = (data['collaborators'] as Map<String, dynamic>?)?[userId] != null;
      return isOwner || isCollaborator;
    });

    final models = docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return todoListModelFromJson(data);
    }).toList();

    return models.map((model) => model.toEntity()).toList();
  });

  @override
  Stream<TodoList?> watchList(String listId) => _firestore.watchDoc('$_listsCollection/$listId').map((doc) {
    if (!doc.exists) {
      return null;
    }

    final data = doc.data();
    if (data == null) {
      return null;
    }

    data['id'] = doc.id;
    final model = todoListModelFromJson(data);
    return model.toEntity();
  });
}
