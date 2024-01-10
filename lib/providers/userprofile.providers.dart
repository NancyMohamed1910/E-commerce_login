import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/user.models.dart';
import 'package:e_commerce/utils/collections.utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UsersProvider extends ChangeNotifier {
  List<UsersData>? userProfile;
  late GlobalKey<FormState> formKey;
  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController ageController;
  late TextEditingController phoneController;
  void initProvider() {
    formKey = GlobalKey<FormState>();
    nameController = TextEditingController();
    addressController = TextEditingController();
    ageController = TextEditingController();
    phoneController = TextEditingController();
  }

  void disposeProvider() {
    nameController.dispose();
    addressController.dispose();
    ageController.dispose();
    phoneController.dispose();
  }

  Future<void> getUserProfile() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      QuerySnapshot<Map<String, dynamic>> result = await FirebaseFirestore
          .instance
          .collection(CollectionsUtils.users.name)
          .where('userid', isEqualTo: user.uid)
          .get();
      if (result.docs.isNotEmpty) {
        userProfile = List<UsersData>.from(
            result.docs.map((e) => UsersData.fromjson(e.data(), e.id)));
      } else {
        userProfile = [];
      }
    }
    notifyListeners();
  }

  String? fixString(String? str) {
    if (str == null) {
      return null;
    } else {
      int length = str.length;
      return str.substring(1, length - 1);
    }
  }
}
