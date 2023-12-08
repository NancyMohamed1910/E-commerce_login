import 'dart:convert';

import 'package:e_commerce/models/adverties.models.dart';
import 'package:e_commerce/models/categories.model.dart';
import 'package:e_commerce/models/products.model.dart';
import 'package:flutter/services.dart';

class DataSeeder {
  static Map _data = {};
  static List<ProductData> products = [];
  static List<CategoryData> categories = [];
  static List<AdvertiesData> adverties = [];
  static void loadData() async {
    await Future.delayed(const Duration(seconds: 5));
    var response = await rootBundle.loadString(
        cache: true,
        'assets/data/data.json'); //load data from json file as String
    _data = jsonDecode(response);
    products = (_data['products'] as List)
        .map((e) => ProductData.fromJson(e))
        .toList();
    categories = (_data['categories'] as List)
        .map((e) => CategoryData.fromJson(e))
        .toList();
    adverties = (_data['advertise'] as List)
        .map((e) => AdvertiesData.fromJson(e))
        .toList();
    print('----------products----------: $products');
    print('-----------categories--------------:$categories');
    print('----------------adverties-------:$adverties');
  }
}
