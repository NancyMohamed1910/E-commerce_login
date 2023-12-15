import 'package:e_commerce/seeder/data.seeder.dart';
import 'package:flutter/material.dart';

class AdvertiseProvider {
  Future<List<String>?> getImagePath() async {
    await Future.delayed(const Duration(seconds: 15));
    print('hi from getimagepath');
    List<String>? imagePath =
        DataSeeder.adverties.map((e) => e.imagePath ?? '').toList();
    print('-------title:$imagePath');
    //notifyListeners();
    return (imagePath);
  }
}
