import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/dataseeder/widget.dataseeder.dart';
import 'package:e_commerce/view/widgets/carouselSlider.widgets.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/view/widgets/dotsIndicator.widgets.dart';
import 'package:e_commerce/view/widgets/headline.widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPositon = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        HeadlineWidget(title: 'Caregories'),
        CarouselSliderWidget(
            onchangePage: (index) {
              currentPositon = index;
              print('index: ${index}');
              setState(() {});
            },
            widget: WidgetData.CarouselChild),
        DotsIndicatorWidget(
            dotsCount: WidgetData.CarouselChild.length,
            positionIndex: currentPositon)
      ],
    ));
  }
}
