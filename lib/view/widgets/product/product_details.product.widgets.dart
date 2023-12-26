import 'package:e_commerce/models/categories.model.dart';
import 'package:e_commerce/models/products.model.dart';
import 'package:flutter/material.dart';

class ProudcDetailsWidget extends StatefulWidget {
  final ProductData productdata;
  const ProudcDetailsWidget({super.key, required this.productdata});

  @override
  State<ProudcDetailsWidget> createState() => _ProudcDetailsWidgetState();
}

class _ProudcDetailsWidgetState extends State<ProudcDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'BRAND',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff515c6f),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontStyle: FontStyle.normal),
                  ),
                  Text(
                    widget.productdata.brand.toString(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color(0xff515c6f),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontStyle: FontStyle.normal),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'SKU',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff515c6f),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontStyle: FontStyle.normal),
                  ),
                  Text(
                    widget.productdata.sku.toString(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color(0xff515c6f),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontStyle: FontStyle.normal),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          //////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'CONDITION',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff515c6f),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontStyle: FontStyle.normal),
                  ),
                  Text(
                    widget.productdata.condition.toString(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color(0xff515c6f),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontStyle: FontStyle.normal),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'MATERIAL',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff515c6f),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontStyle: FontStyle.normal),
                  ),
                  Text(
                    widget.productdata.material.toString(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color(0xff515c6f),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontStyle: FontStyle.normal),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          /////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'CATEGORY',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff515c6f),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontStyle: FontStyle.normal),
                  ),
                  Text(
                    (widget.productdata.category as CategoryData)
                        .title
                        .toString(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color(0xff515c6f),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontStyle: FontStyle.normal),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'FITTING',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff515c6f),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontStyle: FontStyle.normal),
                  ),
                  Text(
                    widget.productdata.fitting.toString(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Color(0xff515c6f),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontStyle: FontStyle.normal),
                  )
                ],
              )
            ],
          )
          /////
        ],
      ),
    );
  }
}
