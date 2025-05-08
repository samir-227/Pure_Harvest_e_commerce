import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/core/networking/data_base_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      final result = firestore.collection(path).doc(documentId).get();
      return await result;
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          data.orderBy(query['orderBy'], descending: query['descending']);
        }
        if (query['limit'] != null) {
          data.limit(query['limit']);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> isDataExist({required String path, String? documentId}) async {
    final doc = await firestore.collection(path).doc(documentId).get();
    return doc.exists;
  }
}
