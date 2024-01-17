import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/providers/authentication.provider.dart';
import 'package:e_commerce/providers/adv.providers.dart';
import 'package:e_commerce/providers/categories.providers.dart';
import 'package:e_commerce/providers/cart.providers.dart';
import 'package:e_commerce/providers/product.providers.dart';
import 'package:e_commerce/UI/pages/splash_page.dart';
import 'package:e_commerce/providers/userprofile.providers.dart';
import 'package:get_it/get_it.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:e_commerce/utils/theme.utils.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  var prefrenceInstance = await SharedPreferences.getInstance();
  GetIt.I.registerSingleton<SharedPreferences>(prefrenceInstance);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
    ChangeNotifierProvider(create: (_) => UsersProvider()),
    Provider(create: (_) => CategoryProvider()),
    ChangeNotifierProvider(create: (_) => AdvProvider()),
    // Provider(create: (_) => ProductProvider()),
    ChangeNotifierProvider(create: (_) => ProductProvider()),
    Provider(create: (_) => CartProvider()),
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Nancy Shop',
          theme: ThemeUtils.themeData,
          home: const SplashPage()),
    );
  }
}
