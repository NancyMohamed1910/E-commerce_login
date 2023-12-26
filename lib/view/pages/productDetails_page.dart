import 'package:e_commerce/models/products.model.dart';
import 'package:e_commerce/view/widgets/product/Product_footer.product.widgets.dart';
import 'package:e_commerce/view/widgets/product/Product_header.product.dart';

import 'package:e_commerce/view/widgets/product/product_data.product.widgets.dart';

import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({
    super.key,
    required this.productdata,
  });
  final ProductData? productdata;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xffF5F6F8),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProductHeaderWidget(productdata: widget.productdata),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                ((widget.productdata ?? [] as ProductData).imagePath ?? '')
                    .toString(),

                //DataSeeder.products[widget.productIndex].imagePath.toString(),
                width: 220,
                height: 202,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              ProductDataWidget(
                  productdata: (widget.productdata ?? [] as ProductData)),
              const Divider(
                thickness: 0,
                indent: 15,
                color: Color(0xff727C8E),
              ),
              const SizedBox(
                height: 10,
              ),
              ProductFooterWidget(
                onPressedShare: () {},
                onPressedCart: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
