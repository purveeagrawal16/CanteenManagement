import 'package:flutter/material.dart';
import '../services/authfunc.dart';
import '../home/homepage.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final auth_function _authn = auth_function();
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Container(
                margin: EdgeInsets.only(top: 50, bottom: 40),
                child: const Text(
                  'SignUp',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
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
                        'Register ',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 212, 38, 38),
                            fontSize: 20),
                      ),
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return MyHomePage();
                      onPressed: () async {
                        //   print(password);
                        //   print(email);
                        //   dynamic result =
                        //       await _authn.signupemail(email, password);
                        //   print(result.toString());
                        //   if (result == null) {
                        //     print('error occured');
                        //     setState(() {
                        //       error =
                        //           'Could not sign in plss enter valid credentials';
                        //     });
                        //   } else {
                        //     Navigator.push(context,
                        //         MaterialPageRoute(builder: (context) {
                        //       return MyHomePage();
                        //     }));
                        //   }
                        if (_formkey.currentState!.validate()) {
                          //! shows that it is not null
                          print(password);
                          dynamic result =
                              await _authn.signupemail(email, password);
                          print(result.toString());
                          if (result == null) {
                            print('error occured');
                            setState(() {
                              error =
                                  'Could not sign in plss enter valid credentials';
                            });
                          } else {
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
              const SizedBox(
                height: 50,
              ),
              Container(
                child: Center(
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 62),
                        child: Text('Already have an account?'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 1.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginDemo();
                            }));
                          },
                          child: const Text(
                            'Click here',
                            style: TextStyle(
                                fontSize: 14,
                                decorationColor:
                                    Color.fromARGB(255, 166, 53, 28),
                                decoration: TextDecoration.underline,
                                color: Color.fromARGB(255, 166, 53, 28)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
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
    );
  }
}
