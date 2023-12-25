import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/adverties.models.dart';
import 'package:e_commerce/utils/collections.Utils.dart';
import 'package:flutter/foundation.dart';

class AdvProvider extends ChangeNotifier {
  List<AdvertiesData>? adList;

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
}
