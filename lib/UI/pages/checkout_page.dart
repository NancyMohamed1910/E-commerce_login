import 'package:e_commerce/UI/pages/master_page.dart';
import 'package:e_commerce/UI/widgets/headline.widgets.dart';

import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
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
                    const HeadlineWidget(title: 'CheckOut'),
                  ])))),
    );
  }
}
