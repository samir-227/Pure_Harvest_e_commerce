import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/core/networking/data_base_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addUser({
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
  Future<Map<String, dynamic>> getData(
      {required String path, required String documentId}) async {
    final doc = await firestore.collection(path).doc(documentId).get();
    return doc.data() as Map<String, dynamic>;
  }
}
