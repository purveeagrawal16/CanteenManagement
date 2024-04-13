import 'package:canteen/Provider/Bfastpro.dart';
import 'package:canteen/Provider/uidpro.dart';
import 'package:canteen/services/authfunc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
//Initialising Bindings before firebase app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Bprovider()),
        ChangeNotifierProvider(create: (context) => uidprovider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: LoginDemo(),
      ),
    );
  }
}
