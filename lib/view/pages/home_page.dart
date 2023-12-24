import 'package:e_commerce/models/adverties.models.dart';
import 'package:e_commerce/models/products.model.dart';
import 'package:e_commerce/providers/adv.providers.dart';
import 'package:e_commerce/providers/categories.providers.dart';
import 'package:e_commerce/providers/product.providers.dart';

import 'package:e_commerce/view/pages/productdetails_page.dart';
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
            Consumer<CategoryProvider>(builder: (context, catValues, _) {
              return FutureBuilder(
                  future: catValues.getCategories(context, limit: 3),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return const Text('Error while get data');
                      } else if (snapshot.hasData) {
                        return CategoriesRowHome(
                            categories: snapshot.data ?? []);
                      } else {
                        return const Text('No data found');
                      }
                    } else {
                      return Text(
                          'Connection State: ${snapshot.connectionState}');
                    }
                  });
            }),
            // ,
            const HeadlineWidget(title: 'Latest'),
            Consumer<AdvProvider>(builder: (ctx, advValues, _) {
              advValues.getAdvertise();
              if (advValues.adList == null) {
                return const CircularProgressIndicator();
              } else if (advValues.adList.toString() == '') {
                return const Text('No Data Found');
              } else {
                return CarouselSliderWidget(
                  onchangePage: (index) {
                    currentPositon = index;
                  },
                  items: (advValues.adList as List<AdvertiesData>)
                      .map((e) => e.imagePath ?? '')
                      .toList(),
                );
              }
            }),
            ///////
            Consumer<ProductProvider>(
              builder: (__, productValues, _) {
                return FutureBuilder(
                    future: productValues.getProducts(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        if (snapshot.hasError) {
                          return const Text('Error While Get Data');
                        } else if (snapshot.hasData) {
                          return SizedBox(
                            height: 140.0,
                            child: ListView.builder(
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data?.length,
                                //itemCount: DataSeeder.products.length,
                                itemBuilder: (BuildContext context,
                                        int index) =>
                                    ProductItemWidget(
                                      imagePath:
                                          (snapshot.data as List<ProductData>)
                                              .map((e) => e.imagePath ?? '')
                                              .toList()
                                              .first
                                              //.elementAt()
                                              .toString(),
                                      // imagePath:
                                      //    DataSeeder.products[index].imagePath.toString(),
                                      // label: DataSeeder.products[index].name.toString(),
                                      label:
                                          (snapshot.data as List<ProductData>)
                                              .map((e) => e.name ?? '')
                                              .toList()
                                              .elementAt(index)
                                              .toString(),
                                      price: '\$'
                                          ' ${(snapshot.data as List<ProductData>).map((e) => e.price ?? '').toList().elementAt(index).toString()}',
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    ProductDetailsPage(
                                                        productIndex: index)));
                                      },
                                    )),
                          );
                        } else {
                          return const Text('No Data Found');
                        }
                      } else {
                        return Text(
                            'Connection Statue ${snapshot.connectionState}');
                      }
                    });
              },
            ),

            ///////
            /*
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
                        price: '\$'
                            ' ${DataSeeder.products[index].price.toString()}',
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      ProductDetailsPage(productIndex: index)));
                        },
                      )),
            )*/
          ],
        ),
      ),
    );
  }
}
