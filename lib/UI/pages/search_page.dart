import 'package:flutter/material.dart';
import 'package:e_commerce/UI/widgets/headline.widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 667),
        builder: (context1, _) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                color: const Color(0xffF5F6F8),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HeadlineWidget(title: 'Search'),
                  ],
                ),
              ),
            ));
  }
}
