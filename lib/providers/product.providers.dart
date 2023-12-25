import 'package:e_commerce/models/products.model.dart';
import 'package:e_commerce/utils/collections.Utils.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickalert/quickalert.dart';

class ProductProvider {
  Future<List<ProductData>?> getProducts(BuildContext context,
      {int? limit}) async {
    try {
      QuerySnapshot<Map<String, dynamic>>? result;
      if (limit != null) {
        result = await FirebaseFirestore.instance
            .collection(CollectionsUtils.product.name)
            .limit(limit)
            .get();
      } else {
        result = await FirebaseFirestore.instance
            .collection(CollectionsUtils.product.name)
            .get();
      }

      if (result.docs.isNotEmpty) {
        var productsList = List<ProductData>.from(
                result.docs.map((e) => ProductData.fromJson(e.data(), e.id)))
            .toList();

        return productsList;
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
