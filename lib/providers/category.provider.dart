<<<<<<< HEAD
import 'package:e_commerce/models/categories.model.dart';
import 'package:e_commerce/seeder/data.seeder.dart';
import 'package:flutter/material.dart';

class CategoryProvider {
  Future<List<String>?> getCategoriesTitles() async {
    await Future.delayed(const Duration(seconds: 15));
    //print('hi from gettitle');
    List<String>? title =
        DataSeeder.categories.map((e) => e.title ?? '').toList();
    // print('-------title:$title');
=======
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
>>>>>>> 8d4e3443a035508035756a9863385f806628df6d
    return (title);
  }
}
