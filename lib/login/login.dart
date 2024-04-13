import 'package:canteen/Provider/uidpro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/authfunc.dart';
import '../home/homepage.dart';
import '../login/signup.dart';

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final auth_function _authn = auth_function();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Consumer<uidprovider>(
      builder: (context, value, _) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text("PICT Canteen"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 110.0),
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 100,
                      /*decoration: BoxDecoration(
            						color: Colors.red,
            						borderRadius: BorderRadius.circular(50.0)),*/
                      child: Image.asset('assets/images/image.jpg'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone number, email or username',
                        hintText: 'Enter valid email id as abc@gmail.com'),
                    validator: (val) => (val!.isEmpty) ? "Enter email" : null,
                    onChanged: (val) {
                      email = val;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter secure password'),
                      validator: (val) => ((val?.length ?? 0) < 6)
                          ? "Password should be greater than 6"
                          : null,
                      onChanged: (val) => setState(() {
                            password = val;
                          })),
                ),
                SizedBox(
                  height: 65,
                  width: 330,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                        child: Text(
                          'Log in ',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 212, 38, 38),
                              fontSize: 20),
                        ),
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return MyHomePage();
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            //! shows that it is not null
                            print(password);
                            dynamic result =
                                await _authn.Signinemail(email, password);
                            print(result.toString());
                            if (result == null) {
                              print('error occured');
                              setState(() {
                                error =
                                    'Could not sign in plss enter valid credentials';
                              });
                            } else {
                              String newud = result.uid;
                              value.set_uid(newud);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return MyHomePage();
                              }));
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: InkWell(
                          onTap: () {
                            print("Forgot");
                          },
                          child: Text(
                            'Forgot password? ',
                            style: TextStyle(
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                decorationColor:
                                    Color.fromARGB(255, 166, 53, 28),
                                color: Color.fromARGB(255, 166, 53, 28)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 135),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignUp();
                              }));
                            },
                            child: Text(
                              'Signup',
                              style: TextStyle(
                                  fontSize: 14,
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      Color.fromARGB(255, 166, 53, 28),
                                  color: Color.fromARGB(255, 166, 53, 28)),
                            )),
                      )
                    ],
                  ),
                )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class OrderHistoryPage extends StatelessWidget {
//   final String userId;
//
//   OrderHistoryPage({required this.userId});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order History'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: Firestore.instance
//             .collection('orders')
//             .where('placed_by', isEqualTo: userId)
//             .orderBy("is_delivered")
//             .orderBy("placed_at", descending: true)
//             .snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasData && snapshot.data!.documents.isNotEmpty) {
//             List<dynamic> orders = snapshot.data!.documents;
//             return ListView.builder(
//               itemCount: orders.length,
//               itemBuilder: (context, int i) {
//                 return GestureDetector(
//                   onTap: () {
//                     // Navigate to order details page
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => OrderDetailsPage(orders[i]),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     child: ListTile(
//                       enabled: !orders[i]['is_delivered'],
//                       title: Text("Order #${(i + 1)}"),
//                       subtitle: Text('Total Amount: ${orders[i]['total'].toString()} INR'),
//                       trailing: Text(
//                           'Status: ${(orders[i]['is_delivered']) ? "Delivered" : "Pending"}'),
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else {
//             return Center(
//               child: Text("No order history found."),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
//
// class OrderDetailsPage extends StatelessWidget {
//   final Map<String, dynamic> orderDetails;
//
//   OrderDetailsPage(this.orderDetails);
//
//   @override
//   Widget build(BuildContext context) {
//     // Implement your order details page UI here
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order Details'),
//       ),
//       body: Center(
//         child: Text('Order Details Page'),
//       ),
//     );
//   }
// }
