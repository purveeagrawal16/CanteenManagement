import 'package:canteen/Models/history.dart';
import 'package:canteen/Provider/Bfastpro.dart';
import 'package:canteen/Provider/uidpro.dart';
import 'package:canteen/services/authfunc.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:canteen/services/firestorefunc.dart';
import 'package:canteen/check_out/Qrpage.dart';

class Custombutton extends StatefulWidget {
  const Custombutton({
    super.key,
  });

  @override
  State<Custombutton> createState() => _CustombuttonState();
}

class _CustombuttonState extends State<Custombutton> {
  Razorpay? _razorpay;
  bool a = false;
  String? pid = '';

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print(response.paymentId);

    print('making true');
    setState(() {
      a = true;
      pid = response.paymentId;
    });

    Fluttertoast.showToast(
        msg: "Payment Successful : ${response.paymentId}",
        timeInSecForIosWeb: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print(response.error);
    Fluttertoast.showToast(
        msg: "Error : ${response.code} - ${response.message}",
        timeInSecForIosWeb: 4);
  }

  void handlePaymentWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "External Wallet : ${response.walletName}", timeInSecForIosWeb: 4);
  }
  //
  // @override
  // void initState(){
  //   super.initState();
  //   _razorpay = Razorpay();
  //   _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS,_handlePaymentSuccess);
  //   _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR,_handlePaymentError);
  //   _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET,handlePaymentWallet);
  // }

  // void dispose()
  // {
  //   super.dispose();
  //   _razorpay?.clear();
  // }
  // void makePayment() async{
  //   var options = {
  //     'key' : 'rzp_test_E1gdHglni8KhIe',
  //     'amount' : 20000,
  //     'name' : "Purvee",
  //     'description' : 'iphone 13',
  //     'prefill' : {'contact' : "+919834347948",'email' : "purveeagrawal16@gmail.com"},
  //     "method" : {
  //       "upi" : true,
  //     },
  //
  //   };
  //
  //   try{
  //     _razorpay?.open(options);
  //   }catch(e)
  //   {
  //     debugPrint(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<Bprovider>(
      builder: (context, cart, _) => Consumer<uidprovider>(
        builder: (context, u, _) => a == true
            ? SizedBox(
                height: 60,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    History h = History();
                    h.update_hist(u.uid, pid, cart.bordered());
                    qrdatabase qrd = qrdatabase();
                    qrd.update_qrdata(pid, cart.bordered());
                    fooddata fd1 = fooddata(name: "food",dbname: 'breakfast');
                    fd1.after_pay(cart.bordered());
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return QRPage(
                        pid: pid,
                      );
                    }));

                    print("QR GENERATED");
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text(
                    'Generate QR',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ))
            : SizedBox(
                height: 60,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    print("UID IS : ${u.uid}");
                    Razorpay razorpay = Razorpay();
                    Map<String, dynamic> options = {
                      'uid': u.uid,
                      'key': 'rzp_test_1DP5mmOlF5G5ag',
                      'amount': 100,
                      'name': 'Acme Corp.',
                      'description': 'Fine T-Shirt',
                      'retry': {'enabled': true, 'max_count': 1},
                      'send_sms_hash': true,
                      'prefill': {
                        'contact': '8888888888',
                        'email': 'test@razorpay.com'
                      },
                      'external': {
                        'wallets': ['paytm']
                      }
                    };
                    razorpay.open(options);
                    razorpay.on(
                        Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
                    razorpay.on(
                        Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
                    razorpay.on(
                        Razorpay.EVENT_EXTERNAL_WALLET, handlePaymentWallet);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    'Check Out',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
      ),
    );
  }
}
