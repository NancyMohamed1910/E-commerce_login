import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:e_commerce/providers/cart.providers.dart';
import 'package:e_commerce/utils/colors.util.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int selectedIndex;
  final int itemCount;
  final void Function(int index) onTap;

  const BottomNavigationBarWidget(
      {super.key,
      required this.selectedIndex,
      required this.itemCount,
      required this.onTap});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      height: 55,
      onTap: (index) {
        widget.onTap.call(index);
      },
      backgroundColor: Colors.black.withOpacity(.002),
      elevation: 0,
      gapLocation: GapLocation.none,
      notchSmoothness: NotchSmoothness.smoothEdge,
      leftCornerRadius: 15,
      rightCornerRadius: 15,
      activeIndex: widget.selectedIndex,
      itemCount: widget.itemCount,
      tabBuilder: ((index, isActive) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                flex: 2,
                child: IconButton(
                    onPressed: () {
                      widget.onTap.call(index);
                    },
                    icon: getIcon(index, isActive))),
            Expanded(
              flex: 1,
              child: Text(
                index == 0
                    ? 'Home'
                    : index == 1
                        ? 'Search'
                        : index == 2
                            ? 'cart'
                            : index == 3
                                ? 'Profile'
                                : 'More',
                style: TextStyle(
                  color: isActive
                      ? ColorsUtil.activeIconColor
                      : ColorsUtil.iconColor,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget getIcon(int index, bool isActive) {
    if (index == 0) {
      return Icon(
        LineIcons.home,
        size: 25,
        color: isActive ? ColorsUtil.activeIconColor : ColorsUtil.iconColor,
      );
    } else if (index == 1) {
      return Icon(
        LineIcons.search,
        size: 25,
        color: isActive ? ColorsUtil.activeIconColor : ColorsUtil.iconColor,
      );
    } else if (index == 2) {
      return Row(
        children: [
          //////
          StreamBuilder(
              stream: Provider.of<CartProvider>(context).cartStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
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
                    return const SizedBox(
                      width: 10,
                    );
                  }
                } else {
                  return const SizedBox(
                    width: 10,
                  );
                }
              }),

          Icon(
            LineIcons.shoppingCart,
            size: 25,
            color: isActive ? ColorsUtil.activeIconColor : ColorsUtil.iconColor,
          )
        ],
      );
    } else if (index == 3) {
      return Icon(
        LineIcons.user,
        size: 25,
        color: isActive ? ColorsUtil.activeIconColor : ColorsUtil.iconColor,
      );
    } else {
      return Icon(
        LineIcons.bars,
        size: 25,
        color: isActive ? ColorsUtil.activeIconColor : ColorsUtil.iconColor,
      );
    }
  }
}
