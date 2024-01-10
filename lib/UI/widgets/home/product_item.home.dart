import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItemWidget extends StatefulWidget {
  final String imagePath;
  final String label;
  final String price;
  final void Function()? onPressed;
  const ProductItemWidget(
      {required this.imagePath,
      required this.label,
      required this.price,
      required this.onPressed,
      super.key});

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, _) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                backgroundColor: Colors.white,
                shadowColor: const Color(0xffE7EAF0),
                fixedSize: Size(101.w, 135.h)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: CachedNetworkImage(
                    progressIndicatorBuilder: (context, url, progress) =>
                        Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                      ),
                    ),
                    imageUrl: widget.imagePath,
                    width: 75.w,
                    height: 70.h,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    widget.label,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 10.sp,
                        color: const Color(0xff515c6f),
                        fontStyle: FontStyle.normal),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    widget.price,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                        color: const Color(0xff515c6f),
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
