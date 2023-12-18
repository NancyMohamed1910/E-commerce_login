import 'package:flutter/material.dart';

class ProductItemWidget extends StatefulWidget {
  String imagePath;
  String label;
  String price;
  void Function()? onPressed;
  ProductItemWidget(
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
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Image.asset(
                  widget.imagePath,
                  // productValues.elementAt(0),
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
