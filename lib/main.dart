//import 'package:e_commerce/view/screens/signUp.dart';

import 'package:e_commerce/view/screens/logIn.dart';
import 'package:flutter/material.dart';

void main() async {
  //await PreferenceServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'E-Commerce',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginScreen());
  }
}
