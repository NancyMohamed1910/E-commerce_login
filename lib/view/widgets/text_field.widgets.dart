import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

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
            (widget.label == 'Email')) {
          return 'Enter valid ' + widget.label;
        }
        if ((widget.controller.text.length < 6) &&
            (widget.label == 'Password')) {
          return widget.label + ' must be 8 ';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.label,
        label: Text(widget.label),
        //fillColor: const Color.fromARGB(255, 238, 233, 233),
        //filled: true,
        filled: false,
        //isDense: true,
        isDense: false,
        //suffixIcon: InkWell(
        prefixIcon: InkWell(
          onTap: () {
            if (widget.label == 'Password') {
              widget.isHide = !widget.isHide;
              setState(() {});
            }
          },
          child: checkIcon(widget.label, widget.isHide),
          /*
              child: widget.isHide
                  ? const Icon(Icons.visibility_off)
                  : widget.icon
*/
        ),
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
      ),
    );
  }

  Widget? checkIcon(String label, bool hide) {
    if (label == 'Password') {
      if (hide == true) {
        return const Icon(Icons.visibility_off);
      } else {
        return const Icon(Icons.visibility);
      }
    } else
      return widget.icon;
  }
}
