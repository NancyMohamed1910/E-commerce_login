import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:e_commerce/utils/colors.util.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

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
      height: 49,
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
            Icon(
              index == 0
                  ? LineIcons.home
                  : index == 1
                      ? LineIcons.search
                      : index == 2
                          ? LineIcons.shoppingCart
                          : index == 3
                              ? LineIcons.user
                              : LineIcons.bars,
              size: 25,
              color:
                  isActive ? ColorsUtil.activeIconColor : ColorsUtil.iconColor,
            ),
            Text(
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
            )
          ],
        );
      }),
    );
  }
}
