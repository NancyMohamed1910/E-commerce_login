import 'package:e_commerce/models/products.model.dart';
import 'package:flutter/material.dart';

class ProductReviewsWidget extends StatefulWidget {
  final ProductData productdata;
  const ProductReviewsWidget({super.key, required this.productdata});

  @override
  State<ProductReviewsWidget> createState() => _ProductReviewsWidgetState();
}

class _ProductReviewsWidgetState extends State<ProductReviewsWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Material(
      child: Text(
        'No review yet',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontStyle: FontStyle.normal,
            color: Color(0xff727c8e),
            fontWeight: FontWeight.w300,
            fontSize: 15),
      ),
    ));
  }
}
