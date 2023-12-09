import 'package:e_commerce/seeder/data.seeder.dart';
import 'package:e_commerce/view/pages/productDetails_page.dart';

import 'package:e_commerce/view/widgets/carouselSlider.widgets.dart';

import 'package:e_commerce/view/widgets/headline.widgets.dart';
import 'package:e_commerce/view/widgets/home/categories_row.home.widget.dart';
import 'package:e_commerce/view/widgets/home/product_item.home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPositon = 0;
  bool _isLoading = true;
  @override
  void initState() {
    getData();

    super.initState();
  }

  void getData() async {
    await DataSeeder.loadData;
    setState(() {});
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF5F6F8),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadlineWidget(title: 'Caregories'),
            CategoriesRowHome(),
            const HeadlineWidget(title: 'Latest'),
            if (_isLoading)
              const CircularProgressIndicator()
            else
              CarouselSliderWidget(
                  items: [
                    ...DataSeeder.adverties.map((e) => e.imagePath ?? '')
                  ],
                  onchangePage: (index) {
                    currentPositon = index;
                    //print('index: ${index}');
                    setState(() {});
                  }),
            ////--------------------
            SizedBox(
              height: 140.0,
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: DataSeeder.products.length,
                  itemBuilder: (BuildContext context, int index) =>
                      ProductItemWidget(
                        imagePath:
                            DataSeeder.products[index].imagePath.toString(),
                        label: DataSeeder.products[index].name.toString(),
                        price:
                            '\$' + DataSeeder.products[index].price.toString(),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      ProductDetailsPage(productIndex: index)));
                        },
                      )),
            ),

            ///---------------------
          ],
        ),
      ),
    );
  }
}
