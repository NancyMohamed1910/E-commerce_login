import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/dataseeder/widget.dataseeder.dart';
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
        CarouselSlider(
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
        )
      ],
    ));
  }
}
