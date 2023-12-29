import 'package:e_commerce/models/categories.model.dart';
import 'package:e_commerce/view/widgets/home/category_item_row.home.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesRowHome extends StatelessWidget {
  final List<CategoryData> categories;
  const CategoriesRowHome({required this.categories, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (context, _) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            ...categories.map((category) => Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: CategoryItemRowWidget(
                    categoryData: category,
                  ),
                )),
            CategoryItemRowWidget(
              categoryData: CategoryData()
                ..title = 'See More'
                ..colors = [
                  Colors.white.value,
                  Colors.white.value,
                ]
                ..shadowColor = 0xfff2f5f9,
              iconWidget: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 30.0,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
