import 'package:canteen/Provider/uidpro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class auth_function {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _userid;

  auth_function() {
    print("object created");
  }
  String? get get_uid => _userid;
  //Signin method
  Future<User?> Signinemail(String email, String password) async {
    try {
      UserCredential uc = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = uc.user;
      _userid = user?.uid ?? '';

      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User?> signupemail(String email, String password) async {
    try {
      UserCredential usercred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = usercred.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
