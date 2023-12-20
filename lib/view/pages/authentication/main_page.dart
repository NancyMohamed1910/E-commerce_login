import 'package:e_commerce/providers/authentication.provider.dart';
import 'package:e_commerce/seeder/widgetdata.seeder.dart';
import 'package:e_commerce/utils/Authenum.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var selectedPage = AuthPage.signUp;
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100,
              //width: 367,
              color: Color(0xffF5F6F8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        children: AuthPage.values
                            .map((e) => Padding(
                                  padding: EdgeInsets.all(8),
                                  child: InkWell(
                                    focusColor: Color(0xffF5F6F8),
                                    highlightColor: Color(0xffF5F6F8),
                                    hoverColor: Color(0xffF5F6F8),
                                    splashColor: Color(0xffF5F6F8),
                                    onTap: () {
                                      selectedPage = e;
                                      if (selectedPage == AuthPage.signUp) {
                                        pageController.jumpToPage(0);
                                      } else if (selectedPage ==
                                          AuthPage.logIn) {
                                        pageController.jumpToPage(1);
                                      } else if (selectedPage ==
                                          AuthPage.forgetPassword) {
                                        pageController.jumpToPage(2);
                                      }
                                      setState(() {});
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e.name,
                                          style: selectedPage == e
                                              ? TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700)
                                              : TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(width: 30),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList()),
                  ),
                ],
              ),
            ),
            Expanded(
                child: PageView(
                    controller: pageController,
                    children: WidgetData.myLoginWidget))
          ],
        ),
      ),
    );
  }
}
