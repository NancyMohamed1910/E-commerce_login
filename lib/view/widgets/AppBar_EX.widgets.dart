import 'package:e_commerce/utils/colors.util.dart';
import 'package:flutter/material.dart';

class AppBarEx {
  static PreferredSizeWidget get getAppBar => AppBar(
        backgroundColor: const Color(0xffF5F6F8),
        //toolbarHeight: 49,
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/Messages.png')),
              Positioned(
                  bottom: 6,
                  left: 10,
                  child: Badge(
                    backgroundColor: ColorsUtil.badgeColor,
                    label: const Text('5'),
                  ))
            ],
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_outlined,
                  color: ColorsUtil.iconColor,
                ),
              ),
              Positioned(
                  bottom: 6,
                  left: 10,
                  child: Badge(
                    backgroundColor: ColorsUtil.badgeColor,
                    label: const Text('3'),
                  ))
            ],
          ),
        ],
      );
}
