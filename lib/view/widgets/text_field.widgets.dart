import 'package:e_commerce/dataseeder/titles.dataseeder.dart';
import 'package:flutter/material.dart';

class TextFieldItem extends StatefulWidget {
  String? label;
  // TextEditingController controller;
  TextFieldItem({
    required this.label,
    super.key,
  });

  @override
  State<TextFieldItem> createState() => _TextFieldItemState();
}

class _TextFieldItemState extends State<TextFieldItem> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'label'),
    );
  }
}
