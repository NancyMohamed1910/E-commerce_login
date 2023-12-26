import 'package:e_commerce/models/products.model.dart';
import 'package:e_commerce/view/widgets/product/product_color.product.widget.dart';
import 'package:e_commerce/view/widgets/product/product_size.product.widgets.dart';
import 'package:flutter/material.dart';

class ProductProductWidget extends StatefulWidget {
  final ProductData productdata;
  const ProductProductWidget({super.key, required this.productdata});

  @override
  State<ProductProductWidget> createState() => _ProductProductWidgetState();
}

class _ProductProductWidgetState extends State<ProductProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ProductColorWidget(onPressed: () {}),
        ProductSizeWidget(onPressed: () {})
      ],
    );
  }
}
