//import 'package:e_commerce/view/screens/signUp.dart';

import 'package:e_commerce/providers/advertise.providers.dart';
import 'package:e_commerce/providers/category.provider.dart';
import 'package:e_commerce/providers/product.providers.dart';
import 'package:e_commerce/services/preference.services.dart';
import 'package:e_commerce/utils/theme.utils.dart';
import 'package:e_commerce/view/pages/main_page.dart';
import 'package:e_commerce/view/pages/master_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() async {
  await PreferenceSrevice.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ProductProvider()),
    ChangeNotifierProvider(create: (_) => CategoryProvider()),
    /*FutureProvider<List<String>?>(
      create: (_) => CategoryProvider().getTitle(),
      initialData: null,
      catchError: (_, err) {
        return [];
      },
    ),*/
    ChangeNotifierProvider(create: (_) => AdvertiseProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
