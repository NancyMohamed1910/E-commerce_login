import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DotsIndicatorWidget extends StatefulWidget {
  final int dotsCount;
  final int positionIndex;
  const DotsIndicatorWidget(
      {super.key, required this.dotsCount, required this.positionIndex});

  @override
  State<DotsIndicatorWidget> createState() => _DotsIndicatorWidgetState();
}

class _DotsIndicatorWidgetState extends State<DotsIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: widget.dotsCount,
      position: widget.positionIndex,
      decorator: const DotsDecorator(
        color: Color(0xff727C8E), // Inactive color
        activeColor: Colors.black87,
      ),
    );
  }
}
