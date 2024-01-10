import 'package:e_commerce/providers/authentication.provider.dart';
import 'package:e_commerce/utils/colors.util.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/UI/widgets/profile/container.widgets.dart';
import 'package:e_commerce/UI/widgets/headline.widgets.dart';

import 'package:e_commerce/seeder/widgetdata.seeder.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 667),
        builder: (context1, _) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                color: const Color(0xffF5F6F8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HeadlineWidget(title: 'More'),
                    ContainerWidget(
                        icons: WidgetData.listTileLeading3,
                        titles: WidgetData.listTileTitles3),
                    SizedBox(
                      height: 10.h,
                    ),
                    ContainerWidget(
                        icons: WidgetData.listTileLeading4,
                        titles: WidgetData.listTileTitles4),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () {
                        Provider.of<AuthenticationProvider>(context,
                                listen: false)
                            .onLogout(context);
                      },
                      child: Text(
                        'LOG OUT',
                        style: TextStyle(
                          fontFamily: 'NeusaNextStd',
                          fontStyle: FontStyle.normal,
                          color: ColorsUtil.badgeColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 15.sp,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
