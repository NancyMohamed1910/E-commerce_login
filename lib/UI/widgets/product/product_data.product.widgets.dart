import 'package:e_commerce/models/products.model.dart';
import 'package:e_commerce/providers/UI.providers.dart';

import 'package:e_commerce/utils/productenum.util.dart';

import 'package:e_commerce/UI/widgets/product/Product_product.product.widgets.dart';
import 'package:e_commerce/UI/widgets/product/product_reviews.product.widgets.dart';
import 'package:e_commerce/UI/widgets/product/product_details.product.widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDataWidget extends StatefulWidget {
  final ProductData? productdata;
  const ProductDataWidget({super.key, required this.productdata});

  @override
  State<ProductDataWidget> createState() => _ProductDataWidgetState();
}

class _ProductDataWidgetState extends State<ProductDataWidget> {
  late PageController pageController;
  var selectedData = ProductDataEnum.product;
  @override
  void initState() {
    pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Column(children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              top: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: ElevatedButton(
                        onPressed: () {
                          selectedData = ProductDataEnum.product;

                          ///  Provider.of<UiProvider>(context, listen: false)
                          //   .getdotIndex(0);
                          setState(() {});
                          pageController.jumpToPage(0);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          elevation: 0,
                          backgroundColor: Colors.white,
                          fixedSize: const Size(110, 30),
                        ),
                        child: Text(
                          'Products',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: selectedData == ProductDataEnum.product
                                ? const Color(0xffFF6969)
                                : const Color(0xff727c8e),
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                      width: 10,
                      child: ElevatedButton(
                          onPressed: () {
                            selectedData = ProductDataEnum.details;
                            // Provider.of<UiProvider>(context, listen: false)
                            //   .getdotIndex(1);
                            setState(() {});
                            pageController.jumpToPage(1);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            elevation: 0,
                            backgroundColor: Colors.white,
                            fixedSize: const Size(110, 30),
                          ),
                          child: Text(
                            'Details',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: selectedData == ProductDataEnum.details
                                  ? const Color(0xffFF6969)
                                  : const Color(0xff727c8e),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ))),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 10,
                    child: ElevatedButton(
                        onPressed: () {
                          selectedData = ProductDataEnum.reviews;
                          // Provider.of<UiProvider>(context, listen: false)
                          //   .getdotIndex(2);
                          setState(() {});
                          pageController.jumpToPage(2);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          elevation: 0,
                          backgroundColor: Colors.white,
                          fixedSize: const Size(110, 30),
                        ),
                        child: Text(
                          'Reviews',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: selectedData == ProductDataEnum.reviews
                                ? const Color(0xffFF6969)
                                : const Color(0xff727c8e),
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          flex: 4,
          child: PageView(controller: pageController, children: [
            ProductProductWidget(
                productdata: widget.productdata as ProductData),
            ProudcDetailsWidget(
              productdata: widget.productdata as ProductData,
            ),
            ProductReviewsWidget(productdata: widget.productdata as ProductData)
          ]),
        )
      ]),
    );
  }
}
