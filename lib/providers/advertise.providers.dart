import 'package:e_commerce/seeder/data.seeder.dart';
import 'package:flutter/material.dart';

class AdvertiseProvider extends ChangeNotifier {
  DataSeeder? advertiseData;
  ProductProvider() {
    advertiseData = DataSeeder();
  }
}
