//import 'package:e_commerce/view/screens/signUp.dart';

import 'package:e_commerce/services/preference.services.dart';
import 'package:e_commerce/view/screens/homePage.dart';
import 'package:e_commerce/view/screens/logIn.dart';
import 'package:flutter/material.dart';

void main() async {
  //await PreferenceServices.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    PreferenceServices.init();
    super.initState();
  }

  Widget startPage() {
    bool flag = PreferenceServices.prefs?.getBool("isLogin") ?? false;
    if (flag == true)
      return HomePage();
    else
      return LoginScreen();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'E-Commerce',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //home: LoginScreen());
        home: startPage());
  }
}
