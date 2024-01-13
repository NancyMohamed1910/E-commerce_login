import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/user.models.dart';
import 'package:e_commerce/utils/collections.utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class UsersProvider extends ChangeNotifier {
  List<UsersData>? userProfile;
  String? docid;
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
          .where('email', isEqualTo: user.email)
          .get();

      if (result.docs.isNotEmpty) {
        userProfile = List<UsersData>.from(
            result.docs.map((e) => UsersData.fromjson(e.data(), e.id)));

        docid = fixString(userProfile?.map((e) => e.userid).toString());
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

  void toDispalyUserProfile() {
    if (userProfile != null) {
      nameController.text =
          fixString(userProfile!.map((e) => e.name).toString()) as String;
      addressController.text =
          fixString(userProfile!.map((e) => e.address).toString()) as String;
      ageController.text =
          fixString(userProfile!.map((e) => e.age).toString()) as String;
      phoneController.text =
          fixString(userProfile!.map((e) => e.phone).toString()) as String;
    } else {
      nameController.text = '';
      addressController.text = '';
      ageController.text = '';
      phoneController.text = '';
    }
  }

  Future<void> onSaveEditedData(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    try {
      if (user != null) {
        CollectionReference ref =
            FirebaseFirestore.instance.collection(CollectionsUtils.users.name);
        await ref.doc(docid).update({'name': nameController.text});
        await ref.doc(docid).update({'address': addressController.text});
        await ref.doc(docid).update({'age': ageController.text});
        await ref.doc(docid).update({'phone': phoneController.text});
        if (!context.mounted) return;
        Navigator.pop(context);

        await QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            title: 'Data saved Successfully');
      }
    } catch (e) {
      if (!context.mounted) return;
      Navigator.pop(context);

      await QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Error when save: $e');
    }
  }
}
