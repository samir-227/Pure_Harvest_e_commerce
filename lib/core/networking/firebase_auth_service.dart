import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math show Random;
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/networking/auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
// Open/Closed Principle applied in this class. I can extend FirebaseAuthService by adding new methods like signInWithApple without changing existing logic.

// singleton responsibility pattern applied in this class. FirebaseAuthService is responsible only for authentication logic and not for any other business logic or handling ui & create only one instance of signIn methods.
class FirebaseAuthService implements AuthService {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;

  FirebaseAuthService({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    FacebookAuth? facebookAuth,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn(),
        _facebookAuth = facebookAuth ?? FacebookAuth.instance;

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  bool isLoggedIn() => _firebaseAuth.currentUser != null;

  @override
  Future<void> sendEmailVerification() async {
    final user = _firebaseAuth.currentUser;
    if (user != null && !user.emailVerified) {
      try {
        await user.sendEmailVerification();
      } catch (e) {
        log("Failed to send email verification: $e");
        throw CustomException(message: "فشل إرسال رسالة التحقق.");
      }
    }
  }

  @override
  Future<User> signUpWithEmail(String email, String password) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseAuthException(e);
    }
  }

  @override
  Future<User> signInWithEmail(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseAuthException(e);
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      log("Reset password failed: $e");
      throw CustomException(message: "فشل في إرسال رابط إعادة التعيين.");
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      log("Sign out failed: $e");
      throw CustomException(message: "فشل تسجيل الخروج.");
    }
  }

  @override
  Future<User> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw CustomException(message: "لم يتم إتمام تسجيل الدخول بـ Google.");
      }
      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return userCredential.user!;
    } catch (e) {
      log("Google sign-in failed: $e");
      throw CustomException(message: "فشل تسجيل الدخول بـ Google.");
    }
  }

  @override
  Future<User> signInWithFacebook() async {
    final rawNonce = _generateNonce();
    final nonce = _sha256ofString(rawNonce);

    try {
      final loginResult = await _facebookAuth.login();

      if (loginResult.accessToken == null) {
        throw CustomException(message: "فشل تسجيل الدخول بـ Facebook.");
      }

      OAuthCredential credential;

      if (Platform.isIOS) {
        final token = loginResult.accessToken!;
        credential = FacebookAuthProvider.credential(token.tokenString);
      } else {
        credential = FacebookAuthProvider.credential(
          loginResult.accessToken!.tokenString,
        );
      }

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return userCredential.user!;
    } catch (e) {
      log("Facebook sign-in failed: $e");
      throw CustomException(message: "فشل تسجيل الدخول بـ Facebook.");
    }
  }

  /// Helper functions
  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  CustomException _handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return CustomException(message: 'الرقم السري ضعيف جداً.');
      case 'email-already-in-use':
        return CustomException(message: 'البريد الالكتروني مستخدم بالفعل.');
      case 'network-request-failed':
        return CustomException(message: 'تاكد من اتصالك بالانترنت.');
      case 'invalid-email':
        return CustomException(message: 'البريد الكتروني غير صحيح.');
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return CustomException(
            message: 'الرقم السري او البريد الالكتروني غير صحيح.');
      default:
        return CustomException(
            message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }
}
// class FirebaseService {
//   /// Listens for changes in the authentication state of the user.
//   /// Logs whether the user is signed in or signed out.
//   static Future<void> firebaseUserState() async {
//     // Listen to authentication state changes.
//     FirebaseAuth.instance.authStateChanges().listen((User? user) {
//       if (user == null) {
//         // Log when the user is signed out.
//         log('User is currently signed out!');
//       } else {
//         // Log when the user is signed in.
//         log('User is signed in!');
//       }
//     });
//   }

//   bool isLoggedIn() => FirebaseAuth.instance.currentUser != null;

//   static Future<void> sendEmailVerification() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user != null && !user.emailVerified) {
//       await user.sendEmailVerification();
//     }
//   }

//   // Method to create a new user with email and password
//   Future<User> createUserWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       // Attempt to create a new user with the provided email and password
//       final credential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       return credential.user!;
//     } on FirebaseAuthException catch (e) {
//       // Handle Firebase authentication exceptions
//       log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
//       if (e.code == 'weak-password') {
//         throw CustomException(message: 'الرقم السري ضعيف جداً.');
//       } else if (e.code == 'email-already-in-use') {
//         throw CustomException(message: 'البريد الالكتروني مستخدم بالفعل.');
//       } else if (e.code == 'network-request-failed') {
//         throw CustomException(message: 'تاكد من اتصالك بالانترنت.');
//       } else if (e.code == 'invalid-email') {
//         throw CustomException(message: 'البريد الكتروني غير صحيح.');
//       } else {
//         throw CustomException(
//             message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
//       }
//     } catch (e) {
//       log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}");
//       throw CustomException(
//           message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
//     }
//   }

//    Future resetPassword(String email) async {
   
//       await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
   
//   }

//   // Method to sign in a user with email and password
//   Future<User> signInWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       // Attempt to sign in the user with the provided email and password
//       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       return credential.user!;
//     } on FirebaseAuthException catch (e) {
//       log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
//       // Handle Firebase authentication exceptions
//       if (e.code == 'user-not-found') {
//         throw CustomException(
//             message: 'الرقم السري او البريد الالكتروني غير صحيح.');
//       } else if (e.code == 'wrong-password') {
//         throw CustomException(
//             message: 'الرقم السري او البريد الالكتروني غير صحيح.');
//       } else if (e.code == 'invalid-credential') {
//         throw CustomException(
//             message: 'الرقم السري او البريد الالكتروني غير صحيح.');
//       } else if (e.code == 'network-request-failed') {
//         throw CustomException(message: 'تاكد من اتصالك بالانترنت.');
//       } else {
//         throw CustomException(
//             message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
//       }
//     } catch (e) {
//       log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}");
//       throw CustomException(
//           message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
//     }
//   }

//   // Method to sign out the current user
//   Future<void> signOut() async {
//     // Sign out the current user
//     await FirebaseAuth.instance.signOut();
//   }

//   // Method to sign in a user with Google
//   Future<User> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//       final GoogleSignInAuthentication? googleAuth =
//           await googleUser?.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );

//       return (await FirebaseAuth.instance.signInWithCredential(credential))
//           .user!;
//     } on Exception catch (e) {
//       log("Exception in FirebaseAuthService.signInWithGoogle: ${e.toString()}");
//       throw CustomException(
//           message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
//     }
//   }

//   String generateNonce([int length = 32]) {
//     const charset =
//         '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
//     final random = math.Random.secure();
//     return List.generate(length, (_) => charset[random.nextInt(charset.length)])
//         .join();
//   }

//   /// Returns the sha256 hash of [input] in hex notation.
//   String sha256ofString(String input) {
//     final bytes = utf8.encode(input);
//     final digest = sha256.convert(bytes);
//     return digest.toString();
//   }

  // Future<User> signInWithFacebook() async {
  //   final rawNonce = generateNonce();
  //   final nonce = sha256ofString(rawNonce);
  //   final LoginResult loginResult =
  //       await FacebookAuth.instance.login(nonce: nonce);
  //   OAuthCredential facebookAuthCredential;

  //   if (Platform.isIOS) {
  //     switch (loginResult.accessToken!.type) {
  //       case AccessTokenType.classic:
  //         final token = loginResult.accessToken as ClassicToken;
  //         facebookAuthCredential = FacebookAuthProvider.credential(
  //           token.authenticationToken!,
  //         );
  //         break;
  //       case AccessTokenType.limited:
  //         final token = loginResult.accessToken as LimitedToken;
  //         facebookAuthCredential = OAuthCredential(
  //           providerId: 'facebook.com',
  //           signInMethod: 'oauth',
  //           idToken: token.tokenString,
  //           rawNonce: rawNonce,
  //         );
  //         break;
  //     }
  //   } else {
  //     facebookAuthCredential = FacebookAuthProvider.credential(
  //       loginResult.accessToken!.tokenString,
  //     );
  //   }

  //   return (await FirebaseAuth.instance
  //           .signInWithCredential(facebookAuthCredential))
  //       .user!;
  // }
// }
