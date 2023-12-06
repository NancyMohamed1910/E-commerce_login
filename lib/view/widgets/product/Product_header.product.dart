import 'package:e_commerce/view/pages/home_page.dart';
import 'package:e_commerce/view/pages/master_page.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/seeder/data.seeder.dart';
import 'package:e_commerce/utils/colors.util.dart';
import 'package:e_commerce/view/widgets/dotinsecatie.widgets.dart';
import 'package:line_icons/line_icons.dart';

class ProductHeaderWidget extends StatefulWidget {
  ProductHeaderWidget({super.key, required this.productIndex});
  int productIndex;

  @override
  State<ProductHeaderWidget> createState() => _ProductHeaderWidgetState();
}

class _ProductHeaderWidgetState extends State<ProductHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const MasterPage()));
              },
              icon: Icon(
                Icons.keyboard_arrow_left,
                size: 30,
                color: const Color(0xffFF6969),
              )),
          Text(
            DataSeeder.products[widget.productIndex].description.toString(),
            style: TextStyle(
                color: Color(0xff515C6F),
                fontWeight: FontWeight.w300,
                fontSize: 15),
          ),
          Stack(
            children: [
              IconButton(onPressed: () {}, icon: Icon(LineIcons.shoppingCart)),
              Positioned(
                  bottom: 6,
                  left: 10,
                  child: Badge(
                    backgroundColor: ColorsUtil.badgeColor,
                    label: const Text('5'),
                  ))
            ],
          ),
        ]),
        /////
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '\$' + DataSeeder.products[widget.productIndex].price.toString(),
              style: TextStyle(
                  color: Color(0xff515C6F),
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 19,
              width: 42,
              decoration: BoxDecoration(
                  color: Color(0xffFF6969),
                  borderRadius: BorderRadius.circular(14)),
              child: Text(
                '* ' +
                    DataSeeder.products[widget.productIndex].review.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        DotsIndicatorWidget(dotsCount: 3, positionIndex: 1)
        //////
      ],
    );
  }
}
