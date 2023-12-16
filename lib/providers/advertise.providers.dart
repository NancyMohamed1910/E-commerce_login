import 'package:e_commerce/seeder/data.seeder.dart';
import 'package:flutter/material.dart';

class AdvertiseProvider extends ChangeNotifier {
  String? getImagePath(int index) {
    print('hi from getimagepath');
    String? imagePath = DataSeeder.adverties
        .map((e) => e.imagePath ?? '')
        .toList()
        .elementAt(index);
    print('-------title:$imagePath');
    //notifyListeners();
    return (imagePath);
  }
}
