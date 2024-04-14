import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class uidprovider extends ChangeNotifier {
  String? uid;

  void set_uid(String u) {
    uid = u;
    print("changed in provider ${uid}");
    notifyListeners();
  }
}
