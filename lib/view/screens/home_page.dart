import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/dataseeder/widget.dataseeder.dart';
import 'package:e_commerce/view/widgets/carouselSlider.widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CarouselSliderWidget(),
      ],
    ));
  }
}
