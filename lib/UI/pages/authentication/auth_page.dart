import 'package:e_commerce/seeder/widgetdata.seeder.dart';
import 'package:e_commerce/utils/authenum.util.dart';
import 'package:e_commerce/utils/colors.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthAppPage extends StatefulWidget {
  const AuthAppPage({super.key});

  @override
  State<AuthAppPage> createState() => _AuthAppPageState();
}

class _AuthAppPageState extends State<AuthAppPage> {
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
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (ctx, _) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 150.h,
                child: Container(
                  color: ColorsUtil.background,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            children: AuthPage.values
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: InkWell(
                                        focusColor: const Color(0xffF5F6F8),
                                        highlightColor: const Color(0xffF5F6F8),
                                        hoverColor: const Color(0xffF5F6F8),
                                        splashColor: const Color(0xffF5F6F8),
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
                                                      fontSize: 30.sp,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w700)
                                                  : TextStyle(
                                                      fontSize: 30.sp,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                            SizedBox(width: 30.w),
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList()),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: PageView(
                      controller: pageController,
                      children: WidgetData.myLoginWidget))
            ],
          ),
        ),
      ),
    );
  }
}
