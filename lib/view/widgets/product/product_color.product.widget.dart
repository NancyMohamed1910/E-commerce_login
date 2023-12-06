import 'package:e_commerce/seeder/widgetdata.seeder.dart';
import 'package:flutter/material.dart';

class ProductColorWidget extends StatefulWidget {
  void Function()? onPressed;
  ProductColorWidget({super.key, required this.onPressed});

  @override
  State<ProductColorWidget> createState() => _ProductColorWidgetState();
}

class _ProductColorWidgetState extends State<ProductColorWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              'SELECT COLOR',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                color: Color(0xff515c6f),
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ///////////////
          SizedBox(
            height: 42,
            child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: WidgetData.productColors.length,
                itemBuilder: (_, index) {
                  return ElevatedButton(
                    onPressed: widget.onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(WidgetData.productColors[index]),
                      elevation: 0,
                      fixedSize: Size(40, 40),
                      shape: CircleBorder(),
                    ),
                    child: (index == 0)
                        ? Icon(
                            Icons.check,
                            color: Colors.white,
                          )
                        : Text(''),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
