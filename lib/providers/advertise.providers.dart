import 'package:e_commerce/seeder/data.seeder.dart';
import 'package:flutter/material.dart';

class AdvertiseProvider extends ChangeNotifier {
  //Future<List<String>?> getImagePath() async {
  List<String> getImagePath() {
    Future.delayed(const Duration(seconds: 20));
    //print('hi from advertiseProvider');
    List<String>? imagePath =
        DataSeeder.adverties.map((e) => e.imagePath ?? '').toList();
    // print('-------title:$title');
    notifyListeners();
    return (imagePath);
  }
}
