import 'package:e_commerce/UI/widgets/profile/listtile.widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWidget extends StatefulWidget {
  final List<String> icons;
  final List<String> titles;
  const ContainerWidget({super.key, required this.icons, required this.titles});

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (context1, _) => Container(
          // height: 200.h,
          width: 335.w,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  separatorBuilder: (context, _) => const Divider(
                      thickness: 0, indent: 10, color: Color(0xff727C8E)),
                  itemCount: 4,
                  itemBuilder: (_, index) => ListtileWidget(
                      leading: Image.asset(
                          'assets/icons/${widget.icons[index]}'), //Icon(Icons.person),
                      title: Text(
                        widget.titles[index],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: const Color(0xff515c6f),
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                      onPressed: () {}))
            ],
          )),
    );
  }
}
