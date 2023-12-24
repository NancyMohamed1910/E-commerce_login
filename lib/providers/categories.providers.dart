import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/categories.model.dart';
import 'package:e_commerce/utils/collections.Utils.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class CategoryProvider {
  Future<List<CategoryData>?> getCategories(BuildContext context,
      {int? limit}) async {
    try {
      QuerySnapshot<Map<String, dynamic>>? result;
      if (limit != null) {
        result = await FirebaseFirestore.instance
            .collection(CollectionsUtils.categoires.name)
            .limit(limit)
            .get();
      } else {
        result = await FirebaseFirestore.instance
            .collection(CollectionsUtils.categoires.name)
            .get();
      }

      if (result.docs.isNotEmpty) {
        var categoriesList = List<CategoryData>.from(
                result.docs.map((e) => CategoryData.fromJson(e.data(), e.id)))
            .toList();
        // print('====categoryList=====$categoriesList');
        return categoriesList;
      } else {
        return [];
      }
    } catch (e) {
      if (!context.mounted) return null;
      await QuickAlert.show(
          context: context, type: QuickAlertType.error, title: e.toString());
      return null;
    }
  }
}
