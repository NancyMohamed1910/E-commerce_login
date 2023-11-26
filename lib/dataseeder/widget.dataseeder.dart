import 'package:e_commerce/view/screens/home_page.dart';
import 'package:flutter/material.dart';

class WidgetData {
  static const List<Widget> myWidget = <Widget>[
    /*Icon(
      Icons.home,
      size: 150,
    ),*/
    HomePage(),
    Icon(
      Icons.category,
      size: 150,
    ),
    Icon(Icons.person, size: 150),
    Icon(Icons.shopping_cart, size: 150)
  ];
}
