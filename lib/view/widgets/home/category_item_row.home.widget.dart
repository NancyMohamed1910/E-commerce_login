import 'package:e_commerce/models/categories.model.dart';
import 'package:e_commerce/utils/colors.util.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemRowWidget extends StatelessWidget {
  final CategoryData categoryData;
  final Widget? iconWidget;
  const CategoryItemRowWidget({
    required this.categoryData,
    this.iconWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (context, _) => Column(
        children: [
          Container(
            height: 75.h,
            width: 75.w,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color(categoryData.shadowColor ?? 0),
                      offset: Offset(0.w, 10.h),
                      blurRadius: 5.r,
                      spreadRadius: 2.r)
                ],
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors:
                        categoryData.colors?.map((e) => Color(e)).toList() ??
                            []),
                shape: BoxShape.circle),
            child: Padding(
              padding:
                  EdgeInsets.only(top: categoryData.image != null ? 10.h : 0.h),
              child: Center(
                child: iconWidget != null
                    ? const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 30,
                        color: Colors.red,
                      )
                    : CachedNetworkImage(
                        alignment: Alignment.center,
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                          ),
                        ),
                        imageUrl: categoryData.image ?? '',
                        height: 50.h,
                        width: 50.w,
                        fit: BoxFit.contain,
                      ),
              ),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Text(
            categoryData.title ?? 'No Title',
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: ColorsUtil.textColor),
          )
        ],
      ),
    );
  }
}
