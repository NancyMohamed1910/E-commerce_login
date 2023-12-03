import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget(
      {required this.icon,
      required this.label,
      required this.controller,
      required this.isHide,
      super.key});
  late String label;
  late Widget icon;
  late TextEditingController controller;
  late bool isHide;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isHide,
      validator: (_) {
        if (widget.controller.text.toString() == null ||
            widget.controller.text.toString() == '') {
          return widget.label + ' is required';
        }

        if ((EmailValidator.validate(widget.controller.text) == false) &&
            (widget.label == 'USER NAME/EMAIL')) {
          return 'Enter valid ' + widget.label;
        }
        if ((widget.controller.text.length < 6) &&
            (widget.label == 'PASSWORD')) {
          return widget.label + ' must be 8 ';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.label,
        label: Text(widget.label),
        isDense: true,
        prefixIcon: InkWell(
          onTap: () {
            if (widget.label == 'PASSWORD') {
              widget.isHide = !widget.isHide;
              setState(() {});
            }
          },
          child: checkIcon(widget.label, widget.isHide),
        ),
      ),
    );
  }

  Widget? checkIcon(String label, bool hide) {
    if (label == 'PASSWORD') {
      if (hide == true) {
        return const Icon(LineIcons.lock);
      } else {
        return const Icon(LineIcons.lockOpen);
      }
    } else
      return widget.icon;
  }
}
