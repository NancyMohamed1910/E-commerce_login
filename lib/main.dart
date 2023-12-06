//import 'package:e_commerce/view/screens/signUp.dart';

import 'package:e_commerce/services/preference.services.dart';
import 'package:e_commerce/utils/theme.utils.dart';
import 'package:e_commerce/view/pages/main_page.dart';
import 'package:e_commerce/view/pages/master_page.dart';

import 'package:flutter/material.dart';

void main() async {
  await PreferenceSrevice.init();
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
    //PreferenceServices.init();
    super.initState();
  }

  Widget startPage() {
    bool? flag = PreferenceSrevice.prefs?.getBool("isLogin") ?? false;
    if (flag == true) {
      return MasterPage();
    } else {
      //return LoginPage();
      return MainPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nancy Shop',
        theme: ThemeUtils.themeData,
        //home: LoginScreen());
        home: startPage());
    //home: MainPage());
  }
}
