import 'package:flutter/material.dart';
import 'package:e_commerce/seeder/widgetdata.seeder.dart';

class ProductSizeWidget extends StatefulWidget {
  ProductSizeWidget({super.key, required this.onPressed});
  void Function()? onPressed;

  @override
  State<ProductSizeWidget> createState() => _ProductSizeWidgetState();
}

class _ProductSizeWidgetState extends State<ProductSizeWidget> {
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
              'SELECT SIZE (US)',
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
            height: 15,
          ),
          ///////////////
          SizedBox(
            height: 40,
            child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: WidgetData.productColors.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: ElevatedButton(
                      onPressed: widget.onPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        fixedSize: const Size(72, 39),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text(
                        WidgetData.prodctSize[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Color(0xff727C8E),
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
