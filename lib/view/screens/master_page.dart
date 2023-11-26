import 'package:e_commerce/dataseeder/widget.dataseeder.dart';

import 'package:e_commerce/view/widgets/bottumNavigationBar.widgets.dart';
import 'package:flutter/material.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({super.key});

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: Center(child: WidgetData.myWidget.elementAt(selected)),

      bottomNavigationBar: BottomNavigationBarWidget(selectedIndex: 0),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [WidgetData.myWidget[_selectedIndex]],
      )),
    );
  }
}
