import 'package:e_commerce/utils/colors.util.dart';
import 'package:flutter/material.dart';

class AppBarEx {
  static PreferredSizeWidget get getAppBar => AppBar(
        toolbarHeight: 70,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Transform.flip(
                  flipX: true,
                  child: Icon(
                    Icons.chat_bubble_outline,
                    color: ColorsUtil.iconColor,
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  left: 10,
                  child: Badge(
                    backgroundColor: ColorsUtil.badgeColor,
                    label: Text('5'),
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
                  bottom: 8,
                  left: 10,
                  child: Badge(
                    backgroundColor: ColorsUtil.badgeColor,
                    label: Text('5'),
                  ))
            ],
          ),
        ],
      );
}
