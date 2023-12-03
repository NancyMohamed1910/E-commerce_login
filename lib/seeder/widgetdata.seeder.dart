import 'package:e_commerce/view/pages/forgotPassword_page.dart';
import 'package:e_commerce/view/pages/home_page.dart';
import 'package:e_commerce/view/pages/login_page.dart';
import 'package:e_commerce/view/pages/signup_page.dart';
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
    Icon(LineIcons.user, size: 150),
    Icon(LineIcons.bars, size: 150)
  ];

  static List<Widget> myLoginWidget = <Widget>[
    SignupPage(),
    LoginPage(),
    ForgotPasswordPage()
  ];

  static const List<Widget> CarouselChild = <Widget>[
    Text('carousel child 1'),
    Text('carousel child 2'),
    Text('carousel child 3'),
    Text('carousel child 4'),
    Text('carousel child 5'),
  ];
}
