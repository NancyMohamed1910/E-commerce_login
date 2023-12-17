import 'package:e_commerce/view/pages/login_page.dart';
import 'package:e_commerce/view/pages/main_page.dart';
import 'package:e_commerce/view/pages/master_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    checkUser();
    super.initState();
  }

  void checkUser() async {
    await Future.delayed(const Duration(milliseconds: 500));
    var result = GetIt.I<SharedPreferences>().get('user');
    if (context.mounted) {
      if (result != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => MasterPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => MainPage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator()],
        ),
      ),
    );
  }
}
