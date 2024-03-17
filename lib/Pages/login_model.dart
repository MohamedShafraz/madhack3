import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? email;
  String? password;
  bool isLoggedIn = false;

  Future<void> login(BuildContext context) async {
    try {
      if (email != null && password != null) {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email!,
          password: password!,
        );
        print('User logged in: ${userCredential.user!.uid}');
        isLoggedIn = true; // Set the isLoggedIn flag to true
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in. Please try again.')),
      );
      print('Failed to sign in: $e');
    }
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }
}
