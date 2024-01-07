import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/products.model.dart';
import 'package:e_commerce/providers/cart.providers.dart';

import 'package:e_commerce/UI/widgets/product/Product_header.product.dart';

import 'package:e_commerce/UI/widgets/product/product_data.product.widgets.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    required this.productdata,
  });
  final ProductData productdata;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xffF5F6F8),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              ProductHeaderWidget(productdata: widget.productdata),
              const SizedBox(
                height: 10,
              ),
              CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
                imageUrl: (widget.productdata.imagePath ?? '').toString(),
                width: 220,
                height: 202,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              ProductDataWidget(productdata: widget.productdata),
              const Divider(
                thickness: 0,
                indent: 15,
                color: Color(0xff727C8E),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {},
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
                                      shape: BoxShape.circle,
                                      color: Color(0xff727c8e)),
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
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .cartItem
                              ?.productId = widget.productdata.id;
                          Provider.of<CartProvider>(context, listen: false)
                              .cartItem
                              ?.quantity = 1;
                          Provider.of<CartProvider>(context, listen: false)
                              .cartItem
                              ?.itemId = const Uuid().v4();
                          Provider.of<CartProvider>(context, listen: false)
                              .onAddItemToCart(context: context);
                        },
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
              )
            ],
          ),
        ),
      ),
    );
  }
}