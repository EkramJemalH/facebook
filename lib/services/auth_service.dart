import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // CORRECT constructor for v6.3.0
  final GoogleSignIn _googleSignIn = GoogleSignIn.standard(
    scopes: ['email', 'profile'],
  );

  // Auth State Stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Get Current User
  User? get currentUser => _auth.currentUser;

  // ✅ ADD THIS BACK: Check if user is logged in
  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  // Sign In with Email and Password
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message ?? 'Sign in failed',
      );
    }
  }

  // ✅ ADD THIS BACK: Create Account
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message ?? 'Account creation failed',
      );
    }
  }

  // ✅ ADD THIS BACK: Password Reset
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message ?? 'Password reset failed',
      );
    }
  }

  // Sign In with Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      print('🔄 Starting Google Sign-In...');
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      
      if (googleUser == null) {
        throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in aborted by user',
        );
      }

      print('✅ Got Google user: ${googleUser.email}');
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      print('🎉 Sign-in successful!');
      
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('🔥 Error: ${e.code} - ${e.message}');
      rethrow;
    } catch (e) {
      print('💥 Error: $e');
      throw FirebaseAuthException(
        code: 'GOOGLE_SIGNIN_FAILED',
        message: 'Google sign-in failed: ${e.toString()}',
      );
    }
  }

  // Sign Out
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      print('✅ Signed out');
    } catch (e) {
      throw FirebaseAuthException(
        code: 'SIGNOUT_FAILED',
        message: 'Failed to sign out',
      );
    }
  }
}