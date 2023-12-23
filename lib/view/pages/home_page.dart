import 'package:e_commerce/models/adverties.models.dart';
import 'package:e_commerce/models/categories.model.dart';
import 'package:e_commerce/providers/home.providers.dart';
import 'package:e_commerce/seeder/data.seeder.dart';
import 'package:e_commerce/view/pages/productDetails_page.dart';
import 'package:e_commerce/view/widgets/carouselSlider.widgets.dart';
import 'package:e_commerce/view/widgets/headline.widgets.dart';
import 'package:e_commerce/view/widgets/home/categories_row.home.widget.dart';
import 'package:e_commerce/view/widgets/home/product_item.home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPositon = 0;

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF5F6F8),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeadlineWidget(title: 'Caregories'),
            Consumer<HomeProvider>(builder: (ctx, homeValues, _) {
              homeValues.getCategory();
              if (homeValues.catList == null) {
                return const CircularProgressIndicator();
              } else if (homeValues.catList == '') {
                return const Text('No Data Found');
              } else {
                return CategoriesRowHome(
                  titles: (homeValues.catList as List<CategoryData>)
                      .map((e) => e.title ?? '')
                      .toList(),
                );
              }
            }),
            const HeadlineWidget(title: 'Latest'),
            Consumer<HomeProvider>(builder: (ctx, homeValues, _) {
              homeValues.getAdvertise();
              if (homeValues.adList == null) {
                return const CircularProgressIndicator();
              } else if (homeValues.adList == '') {
                return const Text('No Data Found');
              } else {
                return CarouselSliderWidget(
                  onchangePage: (index) {
                    currentPositon = index;

                    setState(() {});
                  },
                  items: (homeValues.adList as List<AdvertiesData>)
                      .map((e) => e.imagePath ?? '')
                      .toList(),
                );
              }
            }),
            SizedBox(
              height: 140.0,
              child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: DataSeeder.products.length,
                  itemBuilder: (BuildContext context, int index) =>
                      ProductItemWidget(
                        imagePath:
                            DataSeeder.products[index].imagePath.toString(),
                        label: DataSeeder.products[index].name.toString(),
                        price: '\$' +
                            ' ${DataSeeder.products[index].price.toString()}',
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      ProductDetailsPage(productIndex: index)));
                        },
                      )),
            )
          ],
        ),
      ),
    );
  }
}
