import 'package:flutter/material.dart';

class ProductFooterWidget extends StatefulWidget {
  ProductFooterWidget(
      {super.key, required this.onPressedCart, required this.onPressedShare});
  void Function()? onPressedShare;
  void Function()? onPressedCart;

  @override
  State<ProductFooterWidget> createState() => _ProductFooterWidgetState();
}

class _ProductFooterWidgetState extends State<ProductFooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: widget.onPressedShare,
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              elevation: 0,
              backgroundColor: Colors.white,
              shadowColor: Color.fromARGB(255, 105, 105, 4),
              fixedSize: const Size(200, 50),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SHARE THIS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      color: Color(0xff727c8e),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xff727c8e)),
                    child: const Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                ]),
          ),
          SizedBox(
            width: 15,
          ),
          ElevatedButton(
            onPressed: widget.onPressedCart,
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              elevation: 0,
              backgroundColor: Color(0xffff6969),
              shadowColor: Color.fromARGB(255, 105, 105, 4),
              fixedSize: const Size(200, 50),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ADD TO CART',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.red,
                      size: 24.0,
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
    ;
  }
}
