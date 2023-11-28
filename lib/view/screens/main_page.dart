import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:e_commerce/dataseeder/widget.dataseeder.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _selectedIndex = 0;
  @override
  /*
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,
          elevation: 0,
          flexibleSpace: AnimatedBottomNavigationBar.builder(
            height: 200,
            onTap: (index) {
              _selectedIndex = index;

              setState(() {});
            },
            backgroundColor: Color.fromARGB(228, 247, 242, 242),
            elevation: 0,
            gapLocation: GapLocation.none,
            notchSmoothness: NotchSmoothness.smoothEdge,
            //leftCornerRadius: 15,
            //rightCornerRadius: 15,
            activeIndex: _selectedIndex,
            itemCount: 3,
            tabBuilder: ((index, isActive) {
              return Row(
                children: [
                  Text(
                    index == 0
                        ? 'Sign up'
                        : index == 1
                            ? 'Log In'
                            : 'Forgot Password',
                    style: TextStyle(
                        color: isActive ? Colors.black : Colors.grey,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )
                ],
              );
            }),
          ),

          ////
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [WidgetData.myLoginWidget[_selectedIndex]],
        )));
  }
*/
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        color: const Color.fromARGB(255, 224, 238, 230),
        //color: Colors.red,
        //color: Color.fromARGB(228, 247, 242, 242),
        //color: Color.fromARGB(226, 248, 245, 245),
        child: Column(children: [
          Expanded(
            flex: 1,
            child: AnimatedBottomNavigationBar.builder(
              height: 200,
              onTap: (index) {
                _selectedIndex = index;

                setState(() {});
              },
              //backgroundColor: Colors.white30,
              backgroundColor: const Color.fromARGB(255, 224, 238, 230),
              //backgroundColor: Color.fromARGB(227, 190, 184, 184),
              elevation: 0,
              gapLocation: GapLocation.none,
              notchSmoothness: NotchSmoothness.smoothEdge,
              //leftCornerRadius: 15,
              //rightCornerRadius: 15,
              activeIndex: _selectedIndex,
              itemCount: 3,
              tabBuilder: ((index, isActive) {
                return Row(
                  children: [
                    Text(
                      index == 0
                          ? 'Sign up'
                          : index == 1
                              ? 'Log In'
                              : 'Forgot Password',
                      style: TextStyle(
                          color: isActive ? Colors.black : Colors.grey,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                );
              }),
            ),
          ),
          Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [WidgetData.myLoginWidget[_selectedIndex]],
              ))
        ]),
      ),
    ));
  }
}
