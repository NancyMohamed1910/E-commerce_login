import 'package:e_commerce/UI/pages/messages_page.dart';
import 'package:e_commerce/UI/pages/notification_page.dart';
import 'package:e_commerce/seeder/widgetdata.seeder.dart';

import 'package:e_commerce/UI/widgets/master/bottumNavigationBar.widgets.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/colors.util.dart';

import 'package:cached_network_image/cached_network_image.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({super.key});

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5F6F8),
        appBar: AppBar(
          backgroundColor: const Color(0xffF5F6F8),
          actions: [
            Stack(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const MessagesPage()));
                    },
                    icon: CachedNetworkImage(
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                              child: CircularProgressIndicator(
                                value: progress.progress,
                              ),
                            ),
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/nancy-shop-c87fe.appspot.com/o/products%2FMessages.png?alt=media&token=907fc7d9-0e79-4c03-a9ee-34b5073b4150')),
/*const Positioned(
                    bottom: 6,
                    left: 10,
                    child: Badge(
                       backgroundColor: ColorsUtil.badgeColor,
                      label: const Text(''),
                    )
                    )*/
              ],
            ),
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const NotificationPage()));
                  },
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
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [WidgetData.myWidget[_selectedIndex]],
          ),
        ),
        bottomNavigationBar: BottomNavigationBarWidget(
            itemCount: 5,
            selectedIndex: _selectedIndex,
            onTap: (index) {
              _selectedIndex = index;
              setState(() {});
            }));
  }
}
