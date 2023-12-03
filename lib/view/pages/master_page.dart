import 'dart:convert';

import 'package:e_commerce/seeder/data.seeder.dart';
import 'package:e_commerce/seeder/widgetdata.seeder.dart';
import 'package:e_commerce/models/categories.model.dart';
import 'package:e_commerce/models/products.model.dart';
import 'package:e_commerce/view/widgets/AppBar_EX.widgets.dart';
import 'package:e_commerce/view/widgets/bottumNavigationBar.widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({super.key});

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    DataSeeder.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarEx.getAppBar,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [WidgetData.myWidget[_selectedIndex]],
        )),
        bottomNavigationBar: BottomNavigationBarWidget(
            itemCount: 5,
            selectedIndex: _selectedIndex,
            onTap: (index) {
              _selectedIndex = index;
              setState(() {});
            }));
  }
}
