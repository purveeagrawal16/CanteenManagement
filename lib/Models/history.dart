import 'package:canteen/services/authfunc.dart';
import '../Models/bfcart_item.dart';
// Make sure to import auth_function correctly

class history {
  final String? uid;
  final String? payment_id;
  final List<Bfcart>? cart;

  history({this.uid,this.payment_id,this.cart});

  void func() {
    print("uid is printing.................${this.uid}");
  }

  // Method to get the user_id
}
