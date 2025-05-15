import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/core/networking/data_base_service.dart';

class FirestoreService implements DatabaseService {

  final FirebaseFirestore _firestore;

  FirestoreService({FirebaseFirestore? firestore})
      : _firestore = firestore ??
            FirebaseFirestore.instance; // Dependency Injection added

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    final collection = _firestore
        .collection(path);

    if (documentId != null) {
      await collection.doc(documentId).set(data);
    } else {
      await collection.add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    try {
      final collection = _firestore.collection(path);

      if (documentId != null) {
        //  Extracted logic for single document fetch to a private helper
        return await _getSingleDocument(collection, documentId);
      } else {
        //  Extracted logic for querying collection to another helper
        return await _getCollectionDocuments(collection, query);
      }
    } catch (e) {
      rethrow; 
    }
  }


  Future<Map<String, dynamic>?> _getSingleDocument(
    CollectionReference<Map<String, dynamic>> collection,
    String documentId,
  ) async {
    final doc = await collection.doc(documentId).get();
    return doc.exists ? doc.data() : null;
  }


  Future<List<Map<String, dynamic>>> _getCollectionDocuments(
    CollectionReference<Map<String, dynamic>> collection,
    Map<String, dynamic>? query,
  ) async {
    Query<Map<String, dynamic>> queryRef = collection;

    if (query != null) {
      if (query.containsKey('orderBy')) {
        queryRef = queryRef.orderBy(
          query['orderBy'],
          descending: query['descending'] ?? false,
        );
      }

      if (query.containsKey('limit')) {
        queryRef = queryRef.limit(query['limit']);
      }
    }

    final snapshot = await queryRef.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<bool> isDataExist({
    required String path,
    String? documentId,
  }) async {
    if (documentId == null) return false; 

    final doc = await _firestore.collection(path).doc(documentId).get();
    return doc.exists;
  }
}
