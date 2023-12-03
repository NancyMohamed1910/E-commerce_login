import 'package:e_commerce/seeder/data.seeder.dart';
import 'package:e_commerce/seeder/widgetdata.seeder.dart';
import 'package:e_commerce/view/widgets/carouselSlider.widgets.dart';

import 'package:e_commerce/view/widgets/headline.widgets.dart';
import 'package:e_commerce/view/widgets/home/categories_row.home.widget.dart';
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

  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        HeadlineWidget(title: 'Caregories'),
        SizedBox(
          height: 20,
        ),
        CarouselSliderWidget(
            items: DataSeeder.adverties.map((e) => e.toString()).toList()),

        // CategoriesRowHome(),

        /* if (_isLoading)
          CircularProgressIndicator()
        else
          ...DataSeeder.products.map((e) => Text(e.name ?? 'No name')).toList()
      */
      ],
    ));
  }
}
