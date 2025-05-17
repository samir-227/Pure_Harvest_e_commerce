import 'package:firebase_auth/firebase_auth.dart';
// Open/Closed Principle applied in this class. I can extend AuthService by adding new methods like signInWithApple without changing existing logic.

// singleton responsibility pattern applied in this class. AuthService is responsible only for authentication logic and not for any other business logic or handling ui & create only one instance of signIn methods.
// Dependency inversion principle applied in this class by created an AuthService interface, which defines the authentication contract login and signup, FirebaseAuthService implements this interface.
abstract class AuthService {
  Future<User> signUpWithEmail(String email, String password);
  Future<User> signInWithEmail(String email, String password);
  Future<User> signInWithGoogle();
  Future<User> signInWithFacebook();
  Future<void> sendEmailVerification();
  Future<void> resetPassword(String email);
  Future<void> signOut();
  Future<void> deleteUser();
  bool isLoggedIn();
  Stream<User?> authStateChanges();
}