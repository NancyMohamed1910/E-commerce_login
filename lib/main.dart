//import 'package:e_commerce/view/screens/signUp.dart';
import 'package:e_commerce/providers/advertise.providers.dart';
import 'package:e_commerce/providers/category.provider.dart';
import 'package:e_commerce/providers/product.providers.dart';
import 'package:e_commerce/view/pages/splash_page.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:e_commerce/utils/theme.utils.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var prefrenceInstance = await SharedPreferences.getInstance();
  GetIt.I.registerSingleton<SharedPreferences>(prefrenceInstance);

  var result = GetIt.I.allReadySync();

  if (result == true) {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>> prefrences set successfully');
  } else {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Error When Set prefrences');
  }
  runApp(MultiProvider(providers: [
    FutureProvider<List<String>?>(
      create: (_) => CategoryProvider().getCategoriesTitle(),
      initialData: null,
      catchError: (_, err) {
        return [];
      },
    ),
    ChangeNotifierProvider(create: (_) => ProductProvider()),
    ChangeNotifierProvider(create: (_) => AdvertiseProvider()),
  ], child: const MyApp()));
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nancy Shop',
        theme: ThemeUtils.themeData,
        home: SplashPage());
  }
}
