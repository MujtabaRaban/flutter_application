import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/models/user.dart';
import 'package:user_repository/src/user_repo.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser;
    });
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: myUser.email, password: password);

      myUser = myUser.copyWith(userId: user.user!.uid);

      return myUser;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> setUserData(MyUser myUser) async {
    try {
      await usersCollection
          .doc(myUser.userId)
          .set(myUser.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> setUserEmail(String email) async {
    try {
      await _firebaseAuth.currentUser?.updateEmail(email);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> setUserUser(String userName) async {
    try {
      await _firebaseAuth.currentUser?.updateDisplayName(userName);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getUserProfile() async {
    try {
      User? currentUser = _firebaseAuth.currentUser;

      if (currentUser != null) {
        DocumentSnapshot<Map<String, dynamic>> userDoc =
            await usersCollection.doc(currentUser.uid).get();

        Map<String, dynamic>? userData = userDoc.data();

        if (userData != null) {
          return {
            'name': userData[
                'name'], // assuming 'name' is a field in your user document
            'email': currentUser.email,
          };
        }
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }

    throw Exception('Unable to fetch user profile');
  }
}
