import 'package:e_commerce/view/widgets/container.widgets.dart';
import 'package:e_commerce/view/widgets/headline.widgets.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 100.h,
                        width: 100.w,
                        //color: Colors.grey,
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
                            imageUrl:
                                'https://firebasestorage.googleapis.com/v0/b/nancy-shop-c87fe.appspot.com/o/nan.png?alt=media&token=8c051655-4ba2-4480-afbe-df8763df4ffd',
                            width: 75.w,
                            height: 69.h,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          HeadlineWidget(title: 'Nancy Mohamed'),
                          Text(
                            'nancy@gmail.com',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: const Color(0xff515C6F),
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'EDET PROFILE',
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
                        height: 20.h,
                      ),
                    ],
                  ),
                  ContainerWidget(),
                  SizedBox(
                    height: 20.h,
                  ),
                  ContainerWidget(),
                ],
              ),
            ));
  }
}
