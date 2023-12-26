import 'package:e_commerce/view/widgets/headline.widgets.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                      height: 35, child: HeadlineWidget(title: 'Cart')),
                  ListView.separated(
                      separatorBuilder: (ctx, index) {
                        return const Divider(
                            thickness: 0,
                            indent: 200,
                            color: Color(0xff727C8E));
                      },
                      //  ListView.builder.(
                      scrollDirection: Axis.vertical,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (ctx, index) {
                        return ListTile(
                          leading: Text('leading$index'),
                          title: Text('title'),
                          subtitle: Text('subtitle'),
                          trailing: Text('trealing'),
                        );
                      }),
                ]),
          ),
          const Divider(thickness: 0, indent: 15, color: Color(0xff727C8E)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Total'),
                  Text('total cost'),
                  Text('free shipping')
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  elevation: 0,
                  backgroundColor: const Color(0xffff6969),
                  shadowColor: const Color.fromARGB(255, 105, 105, 4),
                  fixedSize: const Size(200, 50),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Expanded(
                        flex: 3,
                        child: SizedBox(
                          child: Text(
                            'ADD TO CART',
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
