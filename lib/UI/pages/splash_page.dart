import 'package:e_commerce/UI/pages/authentication/auth_page.dart';
import 'package:e_commerce/UI/pages/master_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const AuthAppPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const MasterPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator()],
        ),
      ),
    );
  }
}
