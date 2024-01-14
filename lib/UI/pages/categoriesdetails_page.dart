import 'package:e_commerce/UI/pages/master_page.dart';
import 'package:e_commerce/UI/widgets/headline.widgets.dart';
import 'package:e_commerce/models/categories.model.dart';
import 'package:e_commerce/providers/categories.providers.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryDetailsPage extends StatefulWidget {
  CategoryData categoryData;

  CategoryDetailsPage({super.key, required this.categoryData});

  @override
  State<CategoryDetailsPage> createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color(0xffF5F6F8),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 280),
                    child: IconButton(
                        onPressed: () {
                          // Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const MasterPage()));
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 30,
                          color: Color(0xffFF6969),
                        )),
                  ),
                  const HeadlineWidget(title: 'All Categories'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        ////////
                        child: Consumer<CategoryProvider>(
                            builder: (context, catValues, _) {
                          return FutureBuilder(
                              future: catValues.getCategories(context),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.hasError) {
                                    return const Text('Error while get data');
                                  } else if (snapshot.hasData) {
                                    return SizedBox(
                                      child: ListView.builder(
                                          physics:
                                              const ClampingScrollPhysics(),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: snapshot.data?.length,
                                          itemBuilder: (ctx, index) {
                                            //  return Text(
                                            //    '${snapshot.data?.map((e) => e.title).toList().elementAt(index)}');
                                            return Column(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    widget.categoryData =
                                                        snapshot.data?[index]
                                                            as CategoryData;
                                                    print(
                                                        '=====widgetcategorydata${widget.categoryData.title}');
                                                    setState(() {});
                                                    //  Navigator.pushReplacement(context,
                                                    //    MaterialPageRoute(builder: (_) => CategoryDetailsPage()));
                                                  },
                                                  child: Container(
                                                    height: 75,
                                                    width: 75,
                                                    decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Color(snapshot
                                                                      .data
                                                                      ?.map((e) =>
                                                                          e.shadowColor ??
                                                                          0)
                                                                      .toList()
                                                                      .elementAt(
                                                                          index)
                                                                  as int),
                                                              offset:
                                                                  const Offset(
                                                                      0, 10),
                                                              blurRadius: 5,
                                                              spreadRadius: 2)
                                                        ],
                                                        gradient: LinearGradient(
                                                            begin: Alignment
                                                                .topRight,
                                                            end: Alignment
                                                                .bottomLeft,
                                                            colors: snapshot
                                                                    .data?[index]
                                                                    .colors
                                                                    ?.map((e) =>
                                                                        Color(e))
                                                                    .toList()
                                                                as List<Color>),
                                                        shape: BoxShape.circle),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 10,
                                                      ),
                                                      child: Center(
                                                        child:
                                                            CachedNetworkImage(
                                                          alignment:
                                                              Alignment.center,
                                                          progressIndicatorBuilder:
                                                              (context, url,
                                                                      progress) =>
                                                                  Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              value: progress
                                                                  .progress,
                                                            ),
                                                          ),
                                                          imageUrl: (snapshot
                                                                      .data
                                                                      ?.map((e) =>
                                                                          e.image ??
                                                                          '')
                                                                      .toList()
                                                                  as List<
                                                                      String>)
                                                              .elementAt(index),
                                                          height: 50,
                                                          width: 50,
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                //   const SizedBox(
                                                //    height: 10,
                                                //),
                                                Text(
                                                  '${snapshot.data?[index].title}',
                                                  style: const TextStyle(
                                                    fontFamily: 'NeusaNextStd',
                                                    fontStyle: FontStyle.normal,
                                                    color: Color(0xff515c6f),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                )
                                              ],
                                            );
                                          }),
                                    );
                                  } else {
                                    return const Text('No data found');
                                  }
                                } else {
                                  return Text(
                                      'Connection State: ${snapshot.connectionState}');
                                }
                              });
                        }),
                        ////////
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          //  height: 952,
                          child: ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  widget.categoryData.subcategory?.length,
                              itemBuilder: (ctx, index) {
                                return Column(
                                  children: [
                                    Text(
                                        '${widget.categoryData.subcategory?.keys.toList().elementAt(index)}'),
                                    ListView.builder(
                                      physics: const ClampingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: widget
                                          .categoryData.subcategory?.values
                                          .map((e) => e.toList())
                                          .length,
                                      itemBuilder: (ctx, index) => Container(
                                        color: Colors.amber,
                                        child: Text(
                                            '${widget.categoryData.subcategory?.values.toList().elementAt(index)}'),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
