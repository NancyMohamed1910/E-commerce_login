import 'package:e_commerce/UI/pages/master_page.dart';
import 'package:e_commerce/UI/widgets/headline.widgets.dart';
import 'package:e_commerce/utils/colors.util.dart';
import 'package:flutter/material.dart';
import 'package:order_tracker/order_tracker.dart';

class OrderTrackerPage extends StatefulWidget {
  const OrderTrackerPage({Key? key}) : super(key: key);

  @override
  State<OrderTrackerPage> createState() => _OrderTrackerPageState();
}

class _OrderTrackerPageState extends State<OrderTrackerPage> {
  ///this TextDto present in a package add data in this dto and set in a list.

  List<TextDto> orderList = [
    TextDto("Your order has been placed", "Fri, 25th Dec '23 - 10:47pm"),
    TextDto("Seller has processed your order", "Sun, 27th Mar '22 - 10:19am"),
    TextDto("Your item has been picked up by courier partner.",
        "Tue, 29th Mar '22 - 5:00pm"),
  ];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", "Tue, 29th Dec '23 - 5:04pm"),
    TextDto("Your item has been received in the nearest hub to you.", null),
  ];

  List<TextDto> outOfDeliveryList = [
    TextDto("Your order is out for delivery", "Thu, 31th Mar '24 - 2:27pm"),
  ];

  List<TextDto> deliveredList = [
    TextDto("Your order has been delivered", "Thu, 31th Mar '24 - 3:58pm"),
  ];

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
                    const HeadlineWidget(title: 'Order Tracker'),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: OrderTracker(
                        status: Status.delivered,
                        activeColor: ColorsUtil.badgeColor,
                        inActiveColor: Colors.grey[300],
                        orderTitleAndDateList: orderList,
                        shippedTitleAndDateList: shippedList,
                        outOfDeliveryTitleAndDateList: outOfDeliveryList,
                        deliveredTitleAndDateList: deliveredList,
                      ),
                    )
                  ])))),
    );
  }
}
