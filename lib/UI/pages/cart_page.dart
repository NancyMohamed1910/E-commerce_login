import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/UI/pages/placeorder_page.dart';
import 'package:e_commerce/UI/widgets/headline.widgets.dart';
import 'package:e_commerce/models/cart.models.dart';
import 'package:e_commerce/providers/cart.providers.dart';
import 'package:e_commerce/providers/product.providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Provider.of<CartProvider>(context).cartStream,
        builder: (ctx, aSnapShot) {
          if (aSnapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (aSnapShot.hasError) {
            return const Center(
              child: Text('Error While Getting Data'),
            );
          }

          if (aSnapShot.hasData) {
            var cartdata = Cart.fromJson(
                Map<String, dynamic>.from(aSnapShot.data?.data() ?? {}));
            // print('==============cartdata====$cartdata');
            if (cartdata.items?.isEmpty ?? false) {
              return const Center(
                child: Text(
                  'Cart is Empty',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Color(0xffFF6969),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const HeadlineWidget(title: 'Cart'),
                    ListView.separated(
                        separatorBuilder: (ctx, index) {
                          return const Divider(
                              thickness: 0,
                              indent: 50,
                              color: Color(0xff727C8E));
                        },
                        scrollDirection: Axis.vertical,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cartdata.items?.length ?? 0,
                        itemBuilder: (context, index) {
                          return FutureBuilder(
                              future: Provider.of<ProductProvider>(context)
                                  .getProductById(
                                      productId:
                                          cartdata.items?[index].productId ??
                                              ''),
                              builder: (context, productDate) {
                                if (productDate.hasData) {
                                  if (productDate.data != null) {
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .onAddProductToProductsList(
                                            productDate.data!, cartdata);

                                    Provider.of<CartProvider>(
                                      context,
                                    ).calculateTotalPrice(cartdata);
                                  }
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
                                                (context, url, progress) =>
                                                    Center(
                                              child: CircularProgressIndicator(
                                                value: progress.progress,
                                              ),
                                            ),
                                            imageUrl:
                                                productDate.data?.imagePath ??
                                                    '',
                                            width: 45,
                                            height: 45,
                                          ),
                                        ),
                                      ),
                                      title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              productDate.data?.name ??
                                                  'No name found',
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                color: Color(0xff515C6F),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                              ),
                                            ),
                                            if (cartdata.items?[index]
                                                        .selectedVarints !=
                                                    null &&
                                                cartdata.items?[index]
                                                        .selectedVarints
                                                        ?.containsKey(
                                                            'color') ==
                                                    false)
                                              Row(
                                                children: [
                                                  Text(
                                                    //  variants as String,
                                                    '${cartdata.items?[index].selectedVarints?.keys.map((e) => '$e : ${cartdata.items?[index].selectedVarints?[e]}').toString()}',
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color: Color(0xff515c6f),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            if (cartdata.items?[index]
                                                        .selectedVarints !=
                                                    null &&
                                                cartdata.items?[index]
                                                        .selectedVarints
                                                        ?.containsKey(
                                                            'color') ==
                                                    true)
                                              Row(
                                                children: [
                                                  Text(
                                                    //   variants as String,
                                                    '${cartdata.items?[index].selectedVarints?.keys.map((e) => '$e : ${cartdata.items?[index].selectedVarints?[e]}').toString()}',
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color: Color(0xff515c6f),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            Text(
                                              '\$'
                                              '${productDate.data?.price}',
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.normal,
                                                color: Color(0xffFF6969),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                              ),
                                            )
                                          ]),
                                      subtitle: Row(
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffdcdcdc)),
                                            child: Center(
                                              child: IconButton(
                                                icon: const Icon(
                                                  Icons.remove,
                                                ),
                                                color: Colors.black45,
                                                iconSize: 15.0,
                                                onPressed: () {
                                                  Provider.of<CartProvider>(
                                                          context,
                                                          listen: false)
                                                      .onDecreaseItemQuantityInCart(
                                                          context: context,
                                                          itemId: cartdata
                                                              .items?[index]
                                                              .itemId as String,
                                                          cart: cartdata);
                                                },
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                              '${cartdata.items?[index].quantity} '),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffdcdcdc)),
                                            child: Center(
                                              child: IconButton(
                                                icon: const Icon(Icons.add),
                                                color: Colors.black45,
                                                iconSize: 15.0,
                                                onPressed: () {
                                                  Provider.of<CartProvider>(
                                                          context,
                                                          listen: false)
                                                      .onIncreaseItemQuantityInCart(
                                                          context: context,
                                                          itemId: cartdata
                                                              .items?[index]
                                                              .itemId as String,
                                                          cart: cartdata);
                                                },
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.delete),
                                            color: Colors.black45,
                                            iconSize: 20.0,
                                            onPressed: () {
                                              Provider.of<CartProvider>(context,
                                                      listen: false)
                                                  .onRemoveItemFromCart(
                                                      context: context,
                                                      itemId: cartdata
                                                          .items?[index]
                                                          .itemId as String,
                                                      cart: cartdata);
                                            },
                                          ),
                                        ],
                                      ));
                                } else {
                                  // return const Text('No data found');
                                  return const SizedBox.shrink();
                                }
                              });
                        }),
                    const Divider(
                        thickness: 2, indent: 10, color: Color(0xff727C8E)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'TOTAL',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                color: Color(0xff515c6f),
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                            ValueListenableBuilder(
                                valueListenable: Provider.of<CartProvider>(
                                  context,
                                ).totalNotifier,
                                builder: (context, value, __) {
                                  if (cartdata.items?.isNotEmpty ?? false) {
                                    return Text(
                                      '\$ $value',
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontStyle: FontStyle.normal,
                                        color: Color(0xff515c6f),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    );
                                  } else {
                                    return const Text(
                                      '\$ 0',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        color: Color(0xff515c6f),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    );
                                  }
                                }),
                            const Text(
                              'Free Domestic Shipping',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                color: Color(0xff727c8e),
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const PlaceOrderPage()));
                          },
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

              //////////
            }
          }

          return const SizedBox.shrink();
        });
  }
}

////////////////////////////////////////
/*
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Provider.of<CartProvider>(context).cartStream,
        builder: (ctx, aSnapShot) {
          if (aSnapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (aSnapShot.hasError) {
            return const Center(
              child: Text('Error While Getting Data'),
            );
          }

          if (aSnapShot.hasData) {
            var cartdata = Cart.fromJson(
                Map<String, dynamic>.from(aSnapShot.data?.data() ?? {}));
            // print('==============cartdata====$cartdata');
            if (cartdata.items?.isEmpty ?? false) {
              return const Center(
                child: Text('No Data Found'),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const HeadlineWidget(title: 'Cart'),
                    ListView.separated(
                        separatorBuilder: (ctx, index) {
                          return const Divider(
                              thickness: 0,
                              indent: 50,
                              color: Color(0xff727C8E));
                        },
                        scrollDirection: Axis.vertical,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cartdata.items?.length as int,
                        itemBuilder: (context, index) {
                          return Consumer<ProductProvider>(
                              builder: (context, productValues, _) {
                            return FutureBuilder(
                                future: productValues.getProductById(
                                    productId:
                                        cartdata.items?[index].productId ?? ''),
                                builder: (context, productData) {
                                  if (productData.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  } else if (productData.connectionState ==
                                      ConnectionState.done) {
                                    if (productData.hasError) {
                                      return const Text('Error while get data');
                                    } else if (productData.hasData) {
//return Text('hi nancy');

                                      if (productData.data != null) {
                                        Provider.of<CartProvider>(context,
                                                listen: false)
                                            .onAddProductToProductsList(
                                                productData.data!, cartdata);

                                        Provider.of<CartProvider>(
                                          context,
                                        ).calculateTotalPrice(cartdata);
                                      }
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
                                                    (context, url, progress) =>
                                                        Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    value: progress.progress,
                                                  ),
                                                ),
                                                imageUrl: productData
                                                        .data?.imagePath ??
                                                    '',
                                                width: 45,
                                                height: 45,
                                              ),
                                            ),
                                          ),
                                          title: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  productData.data?.name ??
                                                      'No name found',
                                                  textAlign: TextAlign.left,
                                                  style: const TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    color: Color(0xff515C6F),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                if (cartdata.items?[index]
                                                            .selectedVarints !=
                                                        null &&
                                                    cartdata.items?[index]
                                                            .selectedVarints
                                                            ?.containsKey(
                                                                'color') ==
                                                        false)
                                                  Row(
                                                    children: [
                                                      Text(
                                                        //  variants as String,
                                                        '${cartdata.items?[index].selectedVarints?.keys.map((e) => '$e : ${cartdata.items?[index].selectedVarints?[e]}').toString()}',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: const TextStyle(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          color:
                                                              Color(0xff515c6f),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                if (cartdata.items?[index]
                                                            .selectedVarints !=
                                                        null &&
                                                    cartdata.items?[index]
                                                            .selectedVarints
                                                            ?.containsKey(
                                                                'color') ==
                                                        true)
                                                  Row(
                                                    children: [
                                                      Text(
                                                        //   variants as String,
                                                        '${cartdata.items?[index].selectedVarints?.keys.map((e) => '$e : ${cartdata.items?[index].selectedVarints?[e]}').toString()}',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: const TextStyle(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          color:
                                                              Color(0xff515c6f),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                Text(
                                                  '\$'
                                                  '${productData.data?.price}',
                                                  textAlign: TextAlign.left,
                                                  style: const TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    color: Color(0xffFF6969),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15,
                                                  ),
                                                )
                                              ]),
                                          subtitle: Row(
                                            children: [
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xffdcdcdc)),
                                                child: Center(
                                                  child: IconButton(
                                                    icon: const Icon(
                                                      Icons.remove,
                                                    ),
                                                    color: Colors.black45,
                                                    iconSize: 15.0,
                                                    onPressed: () {
                                                      Provider.of<CartProvider>(
                                                              context,
                                                              listen: false)
                                                          .onDecreaseItemQuantityInCart(
                                                              context: context,
                                                              itemId: cartdata
                                                                  .items?[index]
                                                                  .itemId as String,
                                                              cart: cartdata);
                                                    },
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                  '${cartdata.items?[index].quantity} '),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xffdcdcdc)),
                                                child: Center(
                                                  child: IconButton(
                                                    icon: const Icon(Icons.add),
                                                    color: Colors.black45,
                                                    iconSize: 15.0,
                                                    onPressed: () {
                                                      Provider.of<CartProvider>(
                                                              context,
                                                              listen: false)
                                                          .onIncreaseItemQuantityInCart(
                                                              context: context,
                                                              itemId: cartdata
                                                                  .items?[index]
                                                                  .itemId as String,
                                                              cart: cartdata);
                                                    },
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.delete),
                                                color: Colors.black45,
                                                iconSize: 20.0,
                                                onPressed: () {
                                                  Provider.of<CartProvider>(
                                                          context,
                                                          listen: false)
                                                      .onRemoveItemFromCart(
                                                          context: context,
                                                          itemId: cartdata
                                                              .items?[index]
                                                              .itemId as String,
                                                          cart: cartdata);
                                                },
                                              ),
                                            ],
                                          ));

                                    } else {
                                      return const Text('No data found');
                                    }
                                  } else {
                                    return Text(
                                        'Connection State: ${productData.connectionState}');
                                  }
                                });
                          });
                        }),
                    const Divider(
                        thickness: 2, indent: 10, color: Color(0xff727C8E)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'TOTAL',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                color: Color(0xff515c6f),
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            ),
                            ValueListenableBuilder(
                                valueListenable: Provider.of<CartProvider>(
                                  context,
                                ).totalNotifier,
                                builder: (context, value, __) {
                                  return Text(
                                    '\$ $value',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontStyle: FontStyle.normal,
                                      color: Color(0xff515c6f),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  );
                                }),
                            const Text(
                              'Free Domestic Shipping',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                color: Color(0xff727c8e),
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const CheckoutPage()));
                          },
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

          return const SizedBox.shrink();
        });
  }
}
*/
/////////////////////////////////////////////////////////
