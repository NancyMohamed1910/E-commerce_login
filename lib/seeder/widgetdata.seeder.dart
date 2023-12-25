import 'package:e_commerce/view/pages/authentication/forgotpassword_page.dart';
import 'package:e_commerce/view/pages/authentication/login_page.dart';

import 'package:e_commerce/view/pages/authentication/signup_page.dart';
import 'package:e_commerce/view/pages/home_page.dart';
import 'package:e_commerce/view/pages/profile_page.dart';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class WidgetData {
  static const List<Widget> myWidget = <Widget>[
    HomePage(),
    Icon(
      LineIcons.search,
      size: 150,
    ),
    Icon(LineIcons.shoppingCart, size: 150),
    //Icon(LineIcons.user, size: 150),
    ProfilePage(),
    Icon(LineIcons.bars, size: 150),
  ];

  static List<Widget> myLoginWidget = <Widget>[
    const SignupPage(),
    const LoginPage(),
    const ForgotPasswordPage()
  ];
}
