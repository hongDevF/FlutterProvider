// ignore_for_file: unrelated_type_equality_checks, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterprovider/routes/route_name.dart';

class AuthService {
  final auth = FirebaseAuth.instance;
  // final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  // User? _UserFromFirebase(auth.User? user){
  //   if(user == null){
  //     return null,
  //   }
  // }
  Stream<User?>? getUser(User? user, BuildContext context) {
    if (user == null) {
      return null;
    } else {}
    return null;
    // return user;
  }

  Future<void> signIn(
      BuildContext context, String email, String password) async {
    final user =
        auth.signInWithEmailAndPassword(email: email, password: password);
    if (auth.currentUser == user) {
      Navigator.pushNamed(context, '/');
    } else {
      Navigator.pushNamed(context, '/login');
    }
  }

  Future<void> signUp(String email, String password) async {
    auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  signOut() {
    auth.signOut();
  }
}
