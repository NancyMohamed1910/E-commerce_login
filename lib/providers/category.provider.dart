import 'package:e_commerce/seeder/data.seeder.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  /*Future<List<String?>> getTitles() async {
    await Future.delayed(const Duration(seconds: 5));
    List<String?> title =
        DataSeeder.categories.map((e) => e.title ?? '').toList();
    print('-------title:$title');
    notifyListeners();
    return (title);
  }*/
  List<String?> getTitles() {
    List<String?> title =
        DataSeeder.categories.map((e) => e.title ?? '').toList();
    print('-------title:$title');
    notifyListeners();
    return (title);
  }
}
