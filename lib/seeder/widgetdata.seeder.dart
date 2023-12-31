import 'package:e_commerce/UI/pages/authentication/forgotpassword_page.dart';
import 'package:e_commerce/UI/pages/authentication/login_page.dart';

import 'package:e_commerce/UI/pages/authentication/signup_page.dart';
import 'package:e_commerce/UI/pages/cart_page.dart';
import 'package:e_commerce/UI/pages/home_page.dart';
import 'package:e_commerce/UI/pages/more_page.dart';

import 'package:e_commerce/UI/pages/profile_page.dart';
import 'package:e_commerce/UI/pages/search_page.dart';

import 'package:flutter/material.dart';

class WidgetData {
  static const List<Widget> myWidget = <Widget>[
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),
    MorePage()
  ];

  static List<Widget> myLoginWidget = <Widget>[
    const SignupPage(),
    const LoginPage(),
    const ForgotPasswordPage()
  ];
}
