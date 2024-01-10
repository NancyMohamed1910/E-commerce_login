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
  static List<String> listTileLeading1 = <String>[
    'icon1.png',
    'icon2.png',
    'icon3.png',
    'icon4.png'
  ];
  static List<String> listTileLeading2 = <String>[
    'icon5.png',
    'icon6.png',
    'icon7.png',
    'icon8.png'
  ];
  static List<String> listTileLeading3 = <String>[
    'icon9.png',
    'icon10.png',
    'icon11.png',
    'icon12.png'
  ];
  static List<String> listTileLeading4 = <String>[
    'icon13.png',
    'icon14.png',
    'icon15.png',
    'icon16.png'
  ];
  static List<String> listTileTitles1 = <String>[
    'All My Orders',
    'Pending Shipments',
    'Pending Payments',
    'Finished Orders'
  ];
  static List<String> listTileTitles2 = <String>[
    'Invite Friends',
    'Customer Support',
    'Rate Our App',
    'Make a Suggestion'
  ];
  static List<String> listTileTitles3 = <String>[
    'Shipping Address',
    'Payment Method',
    'Currency',
    'Language'
  ];
  static List<String> listTileTitles4 = <String>[
    'Notification Settings',
    'Privacy Policy',
    'Frequently Asked Questions',
    'Legal Information'
  ];
}
