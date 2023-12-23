import 'package:e_commerce/view/widgets/home/category_item_row.home.widget.dart';
import 'package:flutter/material.dart';

class CategoriesRowHome extends StatefulWidget {
  List<String> titles;
  CategoriesRowHome({super.key, required this.titles});

  @override
  State<CategoriesRowHome> createState() => _CategoriesRowHomeState();
}

class _CategoriesRowHomeState extends State<CategoriesRowHome> {
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: CategoryItemRowWidget(
                gradientColors: [
                  Color(0xffffa554),
                  Color(0xfffe6953),
                ],
                imagePath: 'assets/images/clothes.png',
                shadowColor: Color(0xfffee0e1),
                title: widget.titles.elementAt(0),
              ),
            ),
            Expanded(
                flex: 1,
                child: SizedBox(
                  width: 20,
                  child: CategoryItemRowWidget(
                      gradientColors: [
                        Color(0xff56f1f9),
                        Color(0xff69b9fe),
                      ],
                      imagePath: 'assets/images/beauty.png',
                      shadowColor: Color(0xffe1efff),
                      title: widget.titles.elementAt(1)),
                )),
            Expanded(
                flex: 1,
                child: SizedBox(
                  width: 20,
                  child: CategoryItemRowWidget(
                      gradientColors: [
                        Color.fromARGB(255, 111, 121, 102),
                        Color(0xff42c441),
                      ],
                      imagePath: 'assets/images/shoes.png',
                      shadowColor: Color(0xffd1f6db),
                      title: widget.titles.elementAt(2)),
                )),
            Expanded(
                flex: 1,
                child: SizedBox(
                  width: 20,
                  child: CategoryItemRowWidget(
                    gradientColors: [
                      Colors.white,
                      Colors.white,
                    ],
                    iconWidget: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 30,
                      color: Colors.red,
                    ),
                    shadowColor: Color(0xfff2f5f9),
                    title: 'See All',
                  ),
                ))
          ],
        ));
  }
}
