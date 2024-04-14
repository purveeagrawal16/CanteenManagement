import 'package:flutter/cupertino.dart';
import '../Models/bfcart_item.dart';

class Bprovider extends ChangeNotifier {
  List<Bfcart> _l1 = [];

  int total = 0;
  List<Bfcart> bordered() {
    return _l1;
  }

  void add_cart(Bfcart b1) {
    _l1.add(b1);
    notifyListeners();
  }
}
