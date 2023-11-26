import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DotsIndicatorWidget extends StatefulWidget {
  late int dotsCount;
  late int positionIndex;
  DotsIndicatorWidget(
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
      decorator: DotsDecorator(
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
