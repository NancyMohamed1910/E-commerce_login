import 'package:e_commerce/utils/colors.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListtileWidget extends StatefulWidget {
  late Widget title;
  late Widget leading;
  void Function()? onPressed;
  ListtileWidget(
      {super.key,
      required this.leading,
      required this.title,
      required this.onPressed});

  @override
  State<ListtileWidget> createState() => _ListtileWidgetState();
}

class _ListtileWidgetState extends State<ListtileWidget> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (context1, _) => ListTile(
        leading: widget.leading, //Icon(Icons.safety_check), //Text('Icon'),
        title: widget.title,
        titleTextStyle: TextStyle(
          fontFamily: 'NeusaNextStd',
          fontStyle: FontStyle.normal,
          color: const Color.fromRGBO(182, 163, 163, 1),
          fontWeight: FontWeight.normal,
          fontSize: 15.sp,
        ),

        trailing: Container(
          width: 30.w,
          height: 30.h,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xffdcdcdc)),
          child: Center(
            child: IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_right,
              ),
              color: Colors.black45,
              iconSize: 15.0,
              onPressed: widget.onPressed,
            ),
          ),
        ),
      ),
    );
  }
}
