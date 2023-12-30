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
    return const Text('Product Reviews');
  }
}
