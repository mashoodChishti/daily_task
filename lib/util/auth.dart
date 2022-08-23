// ignore_for_file: unused_local_variable

import 'package:daily_task/util/show_custom_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//Register with email and password
  Future<String> registerwithEmailAndPassword(
      BuildContext context, String _email, String _password) async {
    String message = "";
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: _email, password: _password);
      message = "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
    } catch (e) {
      showCustomDialog(context, 'Error', e.toString());
    }
    return message;
  }

  //SignIn with email and Password
  Future<String> signinwithemailAndpassword(
      BuildContext context, String _email, String _password) async {
    String message = "";
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);

      message = "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        message = 'No user found with given email.';
        // AlertDialog(
        //     title: const Text('Login Failed'),
        //     content: Text(
        //       message,
        //     ));
      } else if (e.code == 'wrong-password') {
        message = 'Incorrect user name or password.';
      } else {
        showCustomDialog(context, 'Error', e.toString());
      }
    }
    return message;
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }
}
