import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.white,
              shadowColor: const Color(0xffE7EAF0),
              fixedSize: const Size(101, 135)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                  imageUrl: widget.imagePath,
                  width: 75,
                  height: 70,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  widget.label,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 10,
                      color: Color(0xff515c6f),
                      fontStyle: FontStyle.normal),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  widget.price,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Color(0xff515c6f),
                      fontStyle: FontStyle.normal),
                ),
              ),
            ],
          ),
        ));
    //////////
  }
}
