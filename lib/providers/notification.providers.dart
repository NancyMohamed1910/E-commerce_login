import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/notifications.models.dart';
import 'package:e_commerce/utils/collections.utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class NotificationProvider {
  int count = 0;
  Future<List<NotificationData>?> getNotifications(BuildContext context,
      {int? limit}) async {
    final user = FirebaseAuth.instance.currentUser;
    try {
      QuerySnapshot<Map<String, dynamic>>? result;
      if (limit != null) {
        result = await FirebaseFirestore.instance
            .collection(CollectionsUtils.notifications.name)
            .limit(limit)
            .where('userId', isEqualTo: user?.email)
            //  .orderBy('time', descending: true)
            .get();
      } else {
        result = await FirebaseFirestore.instance
            .collection(CollectionsUtils.notifications.name)
            .where('userId', isEqualTo: user?.email)
            //.orderBy('time', descending: true)
            .get();
      }

      if (result.docs.isNotEmpty) {
        var notificationList = List<NotificationData>.from(result.docs
            .map((e) => NotificationData.fromJson(e.data(), e.id))).toList();
        count = notificationList.length;
        return notificationList;
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
