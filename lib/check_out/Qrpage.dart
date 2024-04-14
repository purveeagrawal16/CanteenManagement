import 'dart:async';
import 'dart:convert';
import 'package:canteen/Models/bfcart_item.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../services/firestorefunc.dart';

class QRPage extends StatefulWidget {
  final String? pid;
  String? qrd1 = '';
  QRPage({this.pid});

  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  static Color primaryColor = Color(0xFF222222);
  static Color textInputColor = Color(0xFF404040);
  static Color accentColor = Color(0xFF4c90d2);
  String dataa = '';

  String generateQRData(List<Bfcart> items) {
    String data = "";
    for (var item in items) {
      data += "${item.name}: \$₹{item.price} : ${item.ordval}\n";
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    String qrdataString = '';
    print('outside pid:${widget!.pid}');
    qrdatabase qrd = qrdatabase(pid: widget!.pid);

    Future<String?> fetchQrData(String? pid) async {
      print('PID IS:${pid}');
      List<Map<String, dynamic>> datatemp =
          await qrd.searchDocumentByName(widget!.pid);
      print('Temp data is -->${datatemp}');
      if (datatemp.length != 0) {
        String pidqr = datatemp[0]['pid'];
        qrdataString = json.encode(pidqr);
        print("yes");
      } else {
        print('NO');
      }
      print(qrdataString);
      return qrdataString; // This will print the converted data to the console
    }

    return FutureBuilder<String?>(
        future: fetchQrData(widget!.pid),
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // If the future is still loading, display a loading indicator
            return Text('Waiting');
          } else if (snapshot.hasError) {
            // If an error occurred while fetching the data, display an error message
            return Text('Error: ${snapshot.error}');
          } else {
            return Scaffold(
              backgroundColor: primaryColor,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    QrImageView(
                      data: snapshot?.data ?? "no data",
                      backgroundColor: Colors.white,
                      version: QrVersions.auto,
                      size: 300.0,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Scan the QR code to view items and amounts',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
