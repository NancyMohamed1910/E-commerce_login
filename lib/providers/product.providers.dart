import 'package:e_commerce/models/products.model.dart';
import 'package:e_commerce/utils/collections.utils.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickalert/quickalert.dart';

class ProductProvider extends ChangeNotifier {
  int dotIndex = 0;
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

  Future<ProductData?> getProductById({required String productId}) async {
    try {
      DocumentSnapshot<Map<String, dynamic>>? result;
      result = await FirebaseFirestore.instance
          .collection(CollectionsUtils.product.name)
          .doc(productId)
          .get();

      if (result.exists) {
        return ProductData.fromJson(result.data() ?? {}, result.id);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  void getdotIndex(int index) {
    dotIndex = index;
    notifyListeners();
  }
}
