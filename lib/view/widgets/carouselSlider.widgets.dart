import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatefulWidget {
  final List<String> items;
  final void Function(int index) onchangePage;
  const CarouselSliderWidget(
      {required this.items, required this.onchangePage, super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int currentPosition = 0;

  CarouselOptions get options => CarouselOptions(
        onPageChanged: (index, _) {
          widget.onchangePage.call(index);
        },
        height: 150,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CarouselSlider(
          options: options,
          items: widget.items.map((i) {
            return Builder(
              builder: (BuildContext context) {
                //print(widget.items);
                return Container(
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Stack(children: [
                      Image.asset(i,
                          height: 184,
                          // width: 325,
                          width: double.infinity,
                          fit: BoxFit.fill),
                      const Positioned(
                          left: 40,
                          top: 15,
                          child: Text(
                            'For all your summer\r clothing needs',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          )),
                      ////--------------------------------------------------
                      Positioned(
                        top: 70,
                        left: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            elevation: 0,
                            backgroundColor: Colors.white,
                            shadowColor: Color.fromARGB(255, 105, 105, 4),
                            fixedSize: const Size(121, 39),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(
                                    child: Text(
                                      'SEE MORE',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        color: Color(0xff727c8e),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffff6969),
                                      ),
                                      child: const Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      )
                      /////----------------------------------------------
                    ]));
              },
            );
          }).toList(),
        ),
        /* DotsIndicator(
          dotsCount: 5,
          position: currentPosition,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        )*/
      ],
    );
  }
}
