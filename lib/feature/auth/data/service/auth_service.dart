import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  bool _isInitialized = false;

  Future<void> _ensureInitialized() async {
    if (!_isInitialized) {
      await _googleSignIn.initialize();
      _isInitialized = true;
    } else {
      'Failed to initialize google sign in ';
    }
  }

  Future<User?> signInWithGoogle() async {
    await _ensureInitialized();

    final GoogleSignInAccount account = await _googleSignIn.authenticate();

    // v7: .authentication provides the idToken synchronously
    final authDetails = account.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: authDetails.idToken,
    );

    final userCredential = await _auth.signInWithCredential(credential);
    return userCredential.user;
  }

  Future<void> signInWithEmail({
    required String emailAddress,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on Exception catch (e) {
      throw Exception("Error : $e");
    }
  }

  Future<GoogleSignInAccount?> attemptSilentSignIn() async {
    await _ensureInitialized();

    try {
      // attemptLightweightAuthentication can return Future or immediate result
      final result = _googleSignIn.attemptLightweightAuthentication();

      // Handle both sync and async returns
      if (result is Future<GoogleSignInAccount?>) {
        return await result;
      } else {
        return result as GoogleSignInAccount?;
      }
    } catch (error) {
      print('Silent sign-in failed: $error');
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
