import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faiseur/core/data/datasources/firestore_datasource.dart';

/// Implementation of FirestoreDatasource using Firebase Firestore
class FirestoreDatasourceImpl implements FirestoreDatasource {
  FirestoreDatasourceImpl({FirebaseFirestore? firestore}) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  FirebaseFirestore get firestore => _firestore;

  @override
  DocumentReference<Map<String, dynamic>> doc(String path) => _firestore.doc(path);

  @override
  CollectionReference<Map<String, dynamic>> collection(String path) => _firestore.collection(path);

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getDoc(String path) => _firestore.doc(path).get();

  @override
  Future<void> setDoc(String path, Map<String, dynamic> data, {bool merge = false}) =>
      _firestore.doc(path).set(data, SetOptions(merge: merge));

  @override
  Future<void> updateDoc(String path, Map<String, dynamic> data) => _firestore.doc(path).update(data);

  @override
  Future<void> deleteDoc(String path) => _firestore.doc(path).delete();

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getCollection(String path) => _firestore.collection(path).get();

  @override
  Future<DocumentReference<Map<String, dynamic>>> addDoc(String collectionPath, Map<String, dynamic> data) =>
      _firestore.collection(collectionPath).add(data);

  @override
  Future<T> runTransaction<T>(Future<T> Function(Transaction transaction) updateFunction) =>
      _firestore.runTransaction(updateFunction);

  @override
  Query<Map<String, dynamic>> query(String collectionPath) => _firestore.collection(collectionPath);

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> watchDoc(String path) => _firestore.doc(path).snapshots();

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> watchCollection(String path) => _firestore.collection(path).snapshots();

  @override
  WriteBatch batch() => _firestore.batch();
}
