import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


ValueNotifier<AuthService> authService = ValueNotifier(AuthService());


class AuthService {
 final FirebaseAuth _auth = FirebaseAuth.instance;


 User? get currentUser => _auth.currentUser;


 Stream<User?> get authStateChanges => _auth.authStateChanges();


 // Sign in with email and password
 Future<UserCredential> signIn({
   required String email,
   required String password,})
    async {
   return await _auth.signInWithEmailAndPassword(
     email: email,
     password: password,
   );
 }


 //Create a new user with email and password
 Future<UserCredential> createUser({
   required String email,
   required String password,})
   async {
   return await _auth.createUserWithEmailAndPassword(
     email: email,
     password: password,
   );
 }


 // Sign out
 Future<void> signOut() async {
   await _auth.signOut();
 }


 // Reset password
 Future<void> resetPassword(String email) async {
   await _auth.sendPasswordResetEmail(email: email);
 }


 //updateUserName
 Future<void> updateUserName({
   required String name}) async {
   await currentUser!.updateDisplayName(name);
 }


 //deleteAccount
 Future<void> deleteAccount({
   required String email,
   required String password,
 }) async {
  AuthCredential credential = EmailAuthProvider.credential(
     email: email,
     password: password,
   );
   await currentUser!.reauthenticateWithCredential(credential);
   await currentUser!.delete();
   await _auth.signOut();
 }


 // Get current user
 User? getCurrentUser() {
   return _auth.currentUser;
 }
}
