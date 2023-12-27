import 'package:e_commerce/view/widgets/listtile.widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({super.key});

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (context1, _) => Container(
          height: 200.h,
          width: 335.w,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  separatorBuilder: (context, _) => Divider(
                      thickness: 2, indent: 10, color: Color(0xff727C8E)),
                  itemCount: 3,
                  itemBuilder: (_, index) => ListtileWidget(
                      leading: Icon(Icons.person),
                      title: Text(
                        'write any text',
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
