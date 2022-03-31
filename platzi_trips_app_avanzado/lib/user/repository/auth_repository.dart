
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_auth_api.dart';

class AuthRepository {

  final _firebaseAuthAPI_ = FirebaseAuthAPI();

  Future<UserCredential> signInFirebase() => _firebaseAuthAPI_.signIn();

  signOut() => _firebaseAuthAPI_.signOut();

}