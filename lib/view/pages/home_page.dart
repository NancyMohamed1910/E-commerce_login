import 'package:e_commerce/providers/product.providers.dart';
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
      color: const Color(0xffF5F6F8),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadlineWidget(title: 'Caregories'),
            const CategoriesRowHome(),
            const HeadlineWidget(title: 'Latest'),
            if (_isLoading)
              const CircularProgressIndicator()
            else
              CarouselSliderWidget(onchangePage: (index) {
                currentPositon = index;

                setState(() {});
              }),
            ////--------------------
            Consumer<ProductProvider>(builder: (ctx, productValues, _) {
              //    Provider.of<ProductProvider>(context, listen: false)
              //       .getProductImage();

              if (productValues == null) {
                return const CircularProgressIndicator();
              } else if (productValues == '') {
                return const Text('No Data Found');
              } else {
                return SizedBox(
                  height: 140.0,
                  child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      // itemCount: DataSeeder.products.length,
                      itemCount: productValues.getlength(),
                      itemBuilder: (BuildContext context, int index) =>
                          ProductItemWidget(
                            imagePath:
                                '${productValues.getProductImage(index)}' ?? '',
                            // DataSeeder.products[index].imagePath.toString(),
                            //label: DataSeeder.products[index].name.toString(),
                            label:
                                '${productValues.getProductTitle(index)}' ?? '',
                            price: '\$' +
                                    '${productValues.getProductPrice(index)}' ??
                                '',
                            //DataSeeder.products[index].price.toString(),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ProductDetailsPage(
                                          productIndex: index)));
                            },
                          )),
                );
              }
            })

            ///---------------------
          ],
        ),
      ),
    );
  }
}
