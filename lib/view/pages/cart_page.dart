import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/view/widgets/headline.widgets.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const HeadlineWidget(title: 'Cart'),
                ListView.separated(
                    separatorBuilder: (ctx, index) {
                      return const Divider(
                          thickness: 0, indent: 50, color: Color(0xff727C8E));
                    },
                    scrollDirection: Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (ctx, index) {
                      return ListTile(
                          leading: Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: CachedNetworkImage(
                                progressIndicatorBuilder:
                                    (context, url, progress) => Center(
                                  child: CircularProgressIndicator(
                                    value: progress.progress,
                                  ),
                                ),
                                imageUrl:
                                    'https://firebasestorage.googleapis.com/v0/b/nancy-shop-c87fe.appspot.com/o/products%2Fwomen_shoes.png?alt=media&token=76ba682f-0820-4255-871d-28ab85f71b64',
                                width: 75,
                                height: 69,
                              ),
                            ),
                          ),
                          title: Column(children: [
                            Text(
                              'Faux Sued Ankle Boots',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                color: const Color(0xff515C6F),
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '7, Hot Pink',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                color: const Color(0xff515c6f),
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '\$49.99',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                color: const Color(0xffFF6969),
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            )
                          ]),
                          subtitle: Row(
                            children: [],
                          ));
                    }),
              ]),
          const Divider(thickness: 2, indent: 10, color: Color(0xff727C8E)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'TOTAL',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      color: const Color(0xff515c6f),
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    '\$81.57',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      color: const Color(0xff515c6f),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Free Domestic Shipping',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      color: const Color(0xff727c8e),
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  elevation: 0,
                  backgroundColor: const Color(0xffff6969),
                  shadowColor: const Color.fromARGB(255, 105, 105, 4),
                  fixedSize: const Size(180, 50),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Expanded(
                        flex: 3,
                        child: SizedBox(
                          child: Text(
                            'CHECKOUT',
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.red,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
