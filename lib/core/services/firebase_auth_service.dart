import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';

class FirebaseService {
  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        CustomException(message: 'The account already exists for that email.');
      } else {
        throw CustomException(
            message: 'Failed to create user, please try again.');
      }
    } catch (e) {
      throw CustomException(
          message: 'Failed to create user, please try again.');
    }

    throw CustomException(message: 'Failed to create user, please try again.');
  }
}
