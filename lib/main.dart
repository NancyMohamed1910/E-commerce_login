//import 'package:e_commerce/view/screens/signUp.dart';
<<<<<<< HEAD
import 'package:e_commerce/providers/category.provider.dart';
import 'package:e_commerce/seeder/data.seeder.dart';
import 'package:e_commerce/view/pages/splash_page.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
=======

import 'package:e_commerce/providers/advertise.providers.dart';
import 'package:e_commerce/providers/category.provider.dart';
import 'package:e_commerce/providers/product.providers.dart';
>>>>>>> 8d4e3443a035508035756a9863385f806628df6d
import 'package:e_commerce/services/preference.services.dart';
import 'package:e_commerce/utils/theme.utils.dart';
import 'package:e_commerce/view/pages/main_page.dart';
import 'package:e_commerce/view/pages/master_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() async {
<<<<<<< HEAD
  // await PreferenceSrevice.init();
  await DataSeeder.loadData;
  WidgetsFlutterBinding.ensureInitialized();

  var prefrenceInstance = await SharedPreferences.getInstance();
  GetIt.I.registerSingleton<SharedPreferences>(prefrenceInstance);

  var result = GetIt.I.allReadySync();

  if (result == true) {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>> prefrences set successfully');
  } else {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Error When Set prefrences');
  }
  runApp(
    MultiProvider(providers: [
      //ChangeNotifierProvider(create: (_) => CategoryProvider()),
      FutureProvider<List<String>?>(
        create: (_) => CategoryProvider().getCategoriesTitles(),
        initialData: null,
        catchError: (_, err) {
          return [];
        },
      )
    ], child: MyApp()),
  );
=======
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
>>>>>>> 8d4e3443a035508035756a9863385f806628df6d
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

/*
  Widget startPage() {
    bool? flag = PreferenceSrevice.prefs?.getBool("isLogin") ?? false;
    if (flag == true) {
      return MasterPage();
    } else {
      //return LoginPage();
      return MainPage();
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nancy Shop',
        theme: ThemeUtils.themeData,
        //home: LoginScreen());
        //home: startPage());
        home: SplashPage());
    //home: MainPage());
  }
}
