import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  signOut() {
    return _firebaseAuth.signOut();
  }

  Stream<User?> get authState {
    return _firebaseAuth.authStateChanges();
  }

  Future<String> signUpWithMail(
      String mail, String password, String username) async {
    var credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: mail,
      password: password,
    );
    return credential.user!.uid;
  }

  signInWithMail(String mail, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: mail, password: password);
    print("************************GIRIS YAPILDI**************************");
  }
}
