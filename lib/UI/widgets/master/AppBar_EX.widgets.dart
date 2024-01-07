import 'package:e_commerce/utils/colors.util.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/providers/ui.providers.dart';

class AppBarEx {
  static PreferredSizeWidget get getAppBar => AppBar(
        backgroundColor: const Color(0xffF5F6F8),
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: CachedNetworkImage(
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                            child: CircularProgressIndicator(
                              value: progress.progress,
                            ),
                          ),
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/nancy-shop-c87fe.appspot.com/o/products%2FMessages.png?alt=media&token=907fc7d9-0e79-4c03-a9ee-34b5073b4150')),
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
