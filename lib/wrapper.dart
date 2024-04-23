import 'package:canteen/login/login.dart';
import 'package:canteen/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:canteen/services/authfunc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    print(user);
    if (user == null) {
      return LoginDemo();
    } else {
      return MyHomePage();
    }
  }
}
