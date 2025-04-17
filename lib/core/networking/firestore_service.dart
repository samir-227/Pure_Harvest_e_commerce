import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/core/networking/data_base_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addUser(
      {required String path, required Map<String, dynamic> data}) async {
    await firestore.collection(path).add(data);
  }
}
