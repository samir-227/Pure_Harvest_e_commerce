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
    await firestore.collection(path).add(data);
  }
  // Future<Map<String,dynamic>> getData({required String path,required String documentId})async=>
}
