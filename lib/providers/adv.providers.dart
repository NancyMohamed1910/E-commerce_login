import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/adverties.models.dart';
import 'package:e_commerce/models/categories.model.dart';
import 'package:e_commerce/utils/collections.Utils.dart';
import 'package:flutter/foundation.dart';

class AdvProvider extends ChangeNotifier {
  List<AdvertiesData>? adList;
  List<CategoryData>? catList;
  // void initHomeProvider() async {
  //  await getCategory();
  //  await getAdvertise();
  // }

  Future<void> getAdvertise() async {
    QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
        .instance
        .collection(CollectionsUtils.ads.name)
        .get();
    adList = List<AdvertiesData>.from(
        result.docs.map((e) => AdvertiesData.fromJson(e.data(), e.id)));
    //  print('================adlist===$adList');
    notifyListeners();
  }

  /* Future<void> getCategory() async {
    QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
        .instance
        .collection(CollectionsUtils.categoires.name)
        .get();
    catList = List<CategoryData>.from(
        result.docs.map((e) => CategoryData.fromJson(e.data(), e.id)));
    // print('=========catList=====$catList');
    notifyListeners();
  }*/
}
