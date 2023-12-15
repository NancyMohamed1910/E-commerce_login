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
    return (title);
  }
}
