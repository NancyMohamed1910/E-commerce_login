import 'package:e_commerce/seeder/data.seeder.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  ///-------------------
  String? getProductImage(int index) {
    return (DataSeeder.products
        .map((e) => e.imagePath ?? '')
        .toList()
        .elementAt(index));
  }

  //----------------------
  String? getProductTitle(int index) {
    return (DataSeeder.products
        .map((e) => e.name ?? '')
        .toList()
        .elementAt(index));
  }

//---------------------
  double? getProductPrice(int index) {
    return (DataSeeder.products
        .map((e) => e.price ?? 0)
        .toList()
        .elementAt(index));
  }

//---------------------

//---------------------
  int getlength() {
    //print('hi from getlength');
    return (DataSeeder.products.map((e) => e.imagePath ?? '').toList().length);
  }
}
