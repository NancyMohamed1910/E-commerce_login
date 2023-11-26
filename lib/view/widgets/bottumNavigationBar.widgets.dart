import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  late int selectedIndex;
  BottomNavigationBarWidget({super.key, required this.selectedIndex});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  void initState() {
    // var selectedIndex = 0;

    super.initState();
  }

  void onItemSelected(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  var _selectedIndex = 0;
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _selectedIndex = index;
          setState(() {});
        },
        type: BottomNavigationBarType.shifting,
        selectedIconTheme: IconThemeData(size: 35),
        unselectedIconTheme: IconThemeData(size: 20),
        //type:BottomNavigationBarType.fixed,
        //  backgroundColor: Colors.blue, //with type shiffted not work
        //onTap: onItemSelected,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'categories',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'cart',
            backgroundColor: Colors.blue,
          ),
        ]);
  }
}
