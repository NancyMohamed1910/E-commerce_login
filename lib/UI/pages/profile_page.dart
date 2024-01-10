import 'package:e_commerce/UI/pages/editprofile_page.dart';
import 'package:e_commerce/UI/widgets/profile/container.widgets.dart';
import 'package:e_commerce/UI/widgets/headline.widgets.dart';
import 'package:e_commerce/providers/userprofile.providers.dart';
import 'package:e_commerce/seeder/widgetdata.seeder.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                    Consumer<UsersProvider>(builder: (context, uservalues, _) {
                      uservalues.getUserProfile();
                      var name = uservalues.fixString(uservalues.userProfile
                          ?.map((e) => e.name)
                          .toString());

                      var email = uservalues.fixString(uservalues.userProfile
                          ?.map((e) => e.email)
                          .toString());
                      var image = uservalues.fixString(uservalues.userProfile
                          ?.map((e) => e.image)
                          .toString());
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 100.h,
                            //width: 100.w,

                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: Center(
                              child: CachedNetworkImage(
                                progressIndicatorBuilder:
                                    (context, url, progress) => Center(
                                  child: CircularProgressIndicator(
                                    value: progress.progress,
                                  ),
                                ),
                                imageUrl: image.toString(),
                                width: 75.w,
                                height: 69.h,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              HeadlineWidget(title: name.toString()),
                              Text(
                                email.toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  color: const Color(0xff515C6F),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.sp,
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const EditProfilePage()));
                                  },
                                  child: Text(
                                    'EDIT PROFILE',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      color: const Color(0xff727c8e),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                    ),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      );
                    }),
                    ContainerWidget(
                        icons: WidgetData.listTileLeading1,
                        titles: WidgetData.listTileTitles1),
                    SizedBox(
                      height: 10.h,
                    ),
                    ContainerWidget(
                        icons: WidgetData.listTileLeading2,
                        titles: WidgetData.listTileTitles2),
                  ],
                ),
              ),
            ));
  }
}
