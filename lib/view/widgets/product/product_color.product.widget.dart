import 'package:e_commerce/seeder/widgetdata.seeder.dart';
import 'package:flutter/material.dart';

class ProductColorWidget extends StatefulWidget {
  final void Function()? onPressed;
  const ProductColorWidget({super.key, required this.onPressed});

  @override
  State<ProductColorWidget> createState() => _ProductColorWidgetState();
}

class _ProductColorWidgetState extends State<ProductColorWidget> {
  // int index = DataSeeder.products.map((e) => e.id) as int;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
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
          const SizedBox(
            height: 10,
          ),
          ///////////////
          SizedBox(
            height: 42,
            child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: WidgetData.productColors.length,
                //itemCount: DataSeeder.colors.length,
                itemBuilder: (_, index) {
                  return ElevatedButton(
                    onPressed: widget.onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(WidgetData.productColors[index]),
                      elevation: 0,
                      fixedSize: const Size(40, 40),
                      shape: const CircleBorder(),
                    ),
                    child: const Text(''),
                    /* (index == 0)
                        ? Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          )
                        : Text(''),*/
                  );
                }),
          ),
        ],
      ),
    );
  }
}
