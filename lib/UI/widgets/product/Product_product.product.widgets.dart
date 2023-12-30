import 'package:e_commerce/models/products.model.dart';
import 'package:e_commerce/providers/cart.providers.dart';
import 'package:e_commerce/UI/widgets/product/product_color.product.widget.dart';
import 'package:e_commerce/UI/widgets/product/product_size.product.widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductProductWidget extends StatefulWidget {
  final ProductData productdata;
  const ProductProductWidget({super.key, required this.productdata});

  @override
  State<ProductProductWidget> createState() => _ProductProductWidgetState();
}

class _ProductProductWidgetState extends State<ProductProductWidget> {
  @override
  void initState() {
    Provider.of<CartProvider>(context, listen: false).createItemInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...(widget.productdata.variants?.entries.toList().map((e) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'SELECT ${e.key.toUpperCase()}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: const Color(0xff515c6f).withOpacity(0.502),
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                    if (e.key == 'color')
                      ProductColorWidget(
                        colors: List<int>.from(e.value),
                        onPressed: (color) {
                          Provider.of<CartProvider>(context, listen: false)
                              .cartItem
                              ?.selectedVarints ??= {};

                          Provider.of<CartProvider>(context, listen: false)
                              .cartItem
                              ?.selectedVarints?[e.key] = color.value;
                        },
                      )
                    else
                      ProductSizeWidget(
                        onPressed: (value) {
                          Provider.of<CartProvider>(context, listen: false)
                              .cartItem
                              ?.selectedVarints ??= {};

                          Provider.of<CartProvider>(context, listen: false)
                              .cartItem
                              ?.selectedVarints?[e.key] = value;
                        },
                        values: List<dynamic>.from(e.value),
                      ),
                  ],
                );
              }) ??
              [SizedBox.fromSize()]),
        ],
      ),
    );
  }
}
