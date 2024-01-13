import 'package:e_commerce/models/products.model.dart';
import 'package:e_commerce/UI/pages/master_page.dart';
import 'package:e_commerce/providers/cart.providers.dart';
import 'package:e_commerce/providers/product.providers.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/colors.util.dart';
import 'package:e_commerce/UI/widgets/product/dotinsecation.widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class ProductHeaderWidget extends StatefulWidget {
  const ProductHeaderWidget({super.key, required this.productdata});
  final ProductData? productdata;

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
              icon: const Icon(
                Icons.keyboard_arrow_left,
                size: 30,
                color: Color(0xffFF6969),
              )),
          Material(
            color: Colors.transparent,
            child: Text(
              ((widget.productdata ?? [] as ProductData).description ?? '')
                  .toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontStyle: FontStyle.normal,
                  color: Color(0xff727c8e),
                  fontWeight: FontWeight.w300,
                  fontSize: 15),
            ),
          ),
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    //  Navigator.pushReplacement(context,
                    //   MaterialPageRoute(builder: (_) => const CartPage()));
                  },
                  icon: const Icon(LineIcons.shoppingCart)),
              Positioned(
                  bottom: 6,
                  left: 10,
                  child: StreamBuilder(
                      stream: Provider.of<CartProvider>(context).cartStream,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.connectionState ==
                                ConnectionState.active ||
                            snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return const Text('Error');
                          } else if (snapshot.hasData) {
                            int quantity = 0;
                            if (snapshot.data?.data()?['items'] != null) {
                              for (Map<String, dynamic> item
                                  in snapshot.data?.data()?['items']) {
                                quantity += (item['quantity'] as int);
                              }

                              return Badge(
                                smallSize: 15,
                                backgroundColor: ColorsUtil.badgeColor,
                                label: Text('$quantity'),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          } else {
                            return const SizedBox.shrink();
                          }
                        } else {
                          return Text('State: ${snapshot.connectionState}');
                        }
                      }))
            ],
          ),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              color: Colors.transparent,
              child: Text(
                '\$${((widget.productdata ?? [] as ProductData).price ?? '').toString()}',
                style: const TextStyle(
                    color: Color(0xff515C6F),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 19,
              width: 42,
              decoration: BoxDecoration(
                  color: const Color(0xffFF6969),
                  borderRadius: BorderRadius.circular(14)),
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    '*${((widget.productdata ?? [] as ProductData).review ?? '').toString()}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Consumer<ProductProvider>(
            builder: (context, uiData, _) => DotsIndicatorWidget(
                dotsCount: 3, positionIndex: uiData.dotIndex))
        //const DotsIndicatorWidget(dotsCount: 3, positionIndex: 0)
      ],
    );
  }
}
