import 'package:cloud_firestore/cloud_firestore.dart';

/// Core Firestore datasource interface providing basic database operations
abstract class FirestoreDatasource {
  /// Returns the Firestore instance
  FirebaseFirestore get firestore;

  /// Gets a document reference for the given path
  DocumentReference<Map<String, dynamic>> doc(String path);

  /// Gets a collection reference for the given path
  CollectionReference<Map<String, dynamic>> collection(String path);

  /// Gets a document snapshot
  Future<DocumentSnapshot<Map<String, dynamic>>> getDoc(String path);

  /// Sets a document with the given data
  Future<void> setDoc(String path, Map<String, dynamic> data, {bool merge = false});

  /// Updates a document with the given data
  Future<void> updateDoc(String path, Map<String, dynamic> data);

  /// Deletes a document
  Future<void> deleteDoc(String path);

  /// Gets a collection snapshot
  Future<QuerySnapshot<Map<String, dynamic>>> getCollection(String path);

  /// Adds a document to a collection
  Future<DocumentReference<Map<String, dynamic>>> addDoc(String collectionPath, Map<String, dynamic> data);

  /// Runs a transaction
  Future<T> runTransaction<T>(Future<T> Function(Transaction transaction) updateFunction);

  /// Creates a query for a collection
  Query<Map<String, dynamic>> query(String collectionPath);

  /// Watches a document for real-time updates
  Stream<DocumentSnapshot<Map<String, dynamic>>> watchDoc(String path);

  /// Watches a collection for real-time updates
  Stream<QuerySnapshot<Map<String, dynamic>>> watchCollection(String path);

  /// Batch operations
  WriteBatch batch();
}
