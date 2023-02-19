// ignore_for_file: non_constant_identifier_names, avoid_print, unused_field, unused_import, constant_identifier_names, unnecessary_null_comparison

import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutterprovider/routes/route_name.dart';
import 'package:flutterprovider/services/auth_service.dart';

// enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthViewModel extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  late final String _Uid;
  late final String Email;
  Future<bool> CreateUser(String email, String password) async {
    bool success = false;
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential != null) {
        _Uid = userCredential.user!.uid;
        Email = userCredential.user!.email!;

        return success = true;
      }
    } catch (e) {
      print(e);
    }

    return success;
  }

  Future<bool> signIn(String email, String password) async {
    bool success = false;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (userCredential != null) {
        _Uid = userCredential.user!.uid;
        Email = userCredential.user!.email!;

        return success = true;
      }
    } catch (e) {
      print(e);
    }

    return success;
  }

  void signOut() async {
    await _auth.signOut();
  }
}
