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

  static const List productColors = [
    0xffED5199,
    0xffFF8C69,
    0xff67B5F7,
    0xffFFFFFF,
    0xffC9C9C9,
    0xff3E3A3A,
    0xffED5199,
    0xffFF8C69,
    0xff67B5F7,
    0xffFFFFFF,
    0xffC9C9C9,
    0xff3E3A3A
  ];
  static const List<String> prodctSize = [
    "4.5",
    "5",
    "6",
    "7.5",
    "8",
    "8.5",
    "9",
    "9.5",
    "10",
    "10.5",
    "11",
    "11.5"
  ];
}
