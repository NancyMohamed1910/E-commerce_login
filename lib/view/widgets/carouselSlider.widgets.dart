import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/dataseeder/widget.dataseeder.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        autoPlayAnimationDuration: Duration(milliseconds: 300),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        onPageChanged: (index, _) {
          print('index: ${index}');
        },
        scrollDirection: Axis.horizontal,
      ),
      //items: [1, 2, 3, 4, 5].map((i) {
      items: WidgetData.CarouselChild.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(color: Colors.amber),
//                  child: WidgetData.CarouselChild.first,
              child: i,
              //style: TextStyle(fontSize: 16.0),
            );
          },
        );
      }).toList(),
    );
  }
}
