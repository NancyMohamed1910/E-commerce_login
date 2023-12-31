import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselSliderWidget extends StatefulWidget {
  final List<String> items;
  final void Function(int index) onchangePage;
  const CarouselSliderWidget(
      {required this.onchangePage, required this.items, super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (context, _) => SizedBox(
        width: 325.w,
        height: 184.h,
        child: CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, _) {
              widget.onchangePage.call(index);
            },
            height: 184.h,
            //aspectRatio: 16.w / 9.h,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
          items: widget.items.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Stack(children: [
                      CachedNetworkImage(
                          progressIndicatorBuilder: (context, url, progress) =>
                              Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                ),
                              ),
                          imageUrl: i,
                          height: 184.h,
                          // width: 325,
                          width: double.infinity,
                          fit: BoxFit.fill),
                      Positioned(
                          left: 26.w,
                          top: 15.h,
                          child: Text(
                            ' For all your summer\n clothing\n needs',
                            textAlign: TextAlign.left,
                            maxLines: 3,
                            style: TextStyle(
                                fontFamily: 'NeusaNextStd',
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w300),
                          )),

                      ////--------------------------------------------------
                      Positioned(
                        top: 90.h,
                        left: 26.w,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            elevation: 0,
                            backgroundColor: Colors.white,
                            shadowColor: const Color.fromARGB(255, 105, 105, 4),
                            fixedSize: Size(121.w, 39.h),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    'SEE MORE',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'NeusaNextStd',
                                      fontStyle: FontStyle.normal,
                                      color: const Color(0xff727c8e),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  // ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 30.w,
                                    height: 30.h,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffff6969),
                                    ),
                                    child: Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      )
                      /////----------------------------------------------
                    ]));
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
