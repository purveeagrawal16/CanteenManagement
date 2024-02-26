import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Custombutton extends StatefulWidget {
  const Custombutton({
    super.key,
  });

  @override
  State<Custombutton> createState() => _CustombuttonState();
}

class _CustombuttonState extends State<Custombutton> {

  Razorpay? _razorpay;

  void _handlePaymentSuccess(PaymentSuccessResponse response)
  {
    Fluttertoast.showToast(msg: "Payment Successful : ${response.paymentId}",timeInSecForIosWeb: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response)
  {
    Fluttertoast.showToast(msg: "Error : ${response.code} - ${response.message}",timeInSecForIosWeb: 4);
  }

  void handlePaymentWallet(ExternalWalletResponse response)
  {
    Fluttertoast.showToast(msg: "External Wallet : ${response.walletName}",timeInSecForIosWeb: 4);
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
    return SizedBox(
      height: 60,
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          Razorpay razorpay = Razorpay();
          var options = {
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
          razorpay.on(
              Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
          razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
              _handlePaymentSuccess);
          razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
              handlePaymentWallet);
          razorpay.open(options);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text(
          'Check Out',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
