import 'package:e_commerce/seeder/data.seeder.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  DataSeeder? productData;
  ProductProvider() {
    productData = DataSeeder();
  }
}
