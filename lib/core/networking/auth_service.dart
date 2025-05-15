import 'package:firebase_auth/firebase_auth.dart';

// Dependency inversion principle applied in this class by created an AuthService interface, which defines the authentication contract login and signup, FirebaseAuthService implements this interface.
abstract class AuthService {
  Future<User> signUpWithEmail(String email, String password);
  Future<User> signInWithEmail(String email, String password);
  Future<User> signInWithGoogle();
  Future<User> signInWithFacebook();
  Future<void> sendEmailVerification();
  Future<void> resetPassword(String email);
  Future<void> signOut();
  bool isLoggedIn();
  Stream<User?> authStateChanges();
}