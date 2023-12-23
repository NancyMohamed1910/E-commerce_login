import 'package:flutter/material.dart';

class ProductFooterWidget extends StatefulWidget {
  const ProductFooterWidget(
      {super.key, required this.onPressedCart, required this.onPressedShare});
  final void Function()? onPressedShare;
  final void Function()? onPressedCart;

  @override
  State<ProductFooterWidget> createState() => _ProductFooterWidgetState();
}

class _ProductFooterWidgetState extends State<ProductFooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: widget.onPressedShare,
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                elevation: 0,
                backgroundColor: Colors.white,
                shadowColor: const Color.fromARGB(255, 105, 105, 4),
                fixedSize: const Size(200, 50),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Expanded(
                      flex: 3,
                      child: SizedBox(
                        child: Text(
                          'SHARE THIS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Color(0xff727c8e),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Container(
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
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 15,
              child: ElevatedButton(
                onPressed: widget.onPressedCart,
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  elevation: 0,
                  backgroundColor: const Color(0xffff6969),
                  shadowColor: const Color.fromARGB(255, 105, 105, 4),
                  fixedSize: const Size(200, 50),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Expanded(
                        flex: 3,
                        child: SizedBox(
                          child: Text(
                            'ADD TO CART',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          child: Container(
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
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
