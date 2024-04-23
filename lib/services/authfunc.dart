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

  Stream<User?> get get_user {
    //Stream is used as authStateChanges is built in stream method of auth class
    return _auth
        .authStateChanges(); //get keyword is used to create get_user method as _auth is private
    //attribute. authStateChanges() method returns User? i.e. credentials if user sign in or null if user signs out using stream
    //.map() is used to convert User? to Usersignin object
  }

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

  Future signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
