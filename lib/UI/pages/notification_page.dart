import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  final BuildContext context;
  const NotificationPage({super.key, required this.context});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return const Text('notification page');
  }
}
