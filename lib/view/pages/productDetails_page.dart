import 'package:e_commerce/seeder/data.seeder.dart';
import 'package:e_commerce/view/widgets/product/Product_footer.product.widgets.dart';

import 'package:e_commerce/view/widgets/product/Product_header.product.dart';
import 'package:e_commerce/view/widgets/product/button_row.product.widgets.dart';
import 'package:e_commerce/view/widgets/product/product_color.product.widget.dart';
import 'package:e_commerce/view/widgets/product/product_size.product.widgets.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.productIndex});
  final int productIndex;

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
              ProductHeaderWidget(productIndex: widget.productIndex),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                DataSeeder.products[widget.productIndex].imagePath.toString(),
                width: 220,
                height: 202,
                fit: BoxFit.cover,
              ),
              const RowButtonWidgets(),
              ProductColorWidget(
                onPressed: () {},
              ),
              ProductSizeWidget(onPressed: () {}),
              const SizedBox(
                height: 5,
              ),
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
