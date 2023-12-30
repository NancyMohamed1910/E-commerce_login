import 'package:e_commerce/utils/colors.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadlineWidget extends StatelessWidget {
  final String title;
  const HeadlineWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (context, _) => Row(
        children: [
          Text(title,
              style: TextStyle(
                  color: ColorsUtil.textColor,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
