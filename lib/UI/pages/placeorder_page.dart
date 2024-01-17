import 'package:e_commerce/UI/pages/master_page.dart';
import 'package:e_commerce/UI/pages/ordertracker_page.dart';
import 'package:e_commerce/UI/widgets/headline.widgets.dart';

import 'package:flutter/material.dart';

class PlaceOrderPage extends StatefulWidget {
  const PlaceOrderPage({Key? key}) : super(key: key);

  @override
  State<PlaceOrderPage> createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Container(
            color: const Color(0xffF5F6F8),
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 280),
                    child: IconButton(
                        onPressed: () {
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: const Icon(
                          Icons.check,
                          color: Color(0xffFF6969),
                          size: 50,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                          width: 180,
                          child: HeadlineWidget(title: 'Order Placed!')),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Your order was placed successfully.\n For more details, check All My Orders\n page under Profile tab',
                        style: TextStyle(
                          fontFamily: 'NeusaNextStd',
                          fontStyle: FontStyle.normal,
                          color: Color(0xff515c6f),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      /////
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const OrderTrackerPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          elevation: 0,
                          backgroundColor: const Color(0xffFF6969),
                          shadowColor: const Color.fromARGB(255, 105, 105, 4),
                          fixedSize: const Size(325, 50),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Expanded(
                                flex: 3,
                                child: SizedBox(
                                  child: Text(
                                    'MY ORDERS',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'NeusaNextStd',
                                      fontStyle: FontStyle.normal,
                                      color: Color(0xffFFFFFF),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
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
                                        color: Colors.white),
                                    child: const Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Color(0xffFF6969),
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      /////
                    ],
                  )
                ]))),
      )),
    );
  }
}
