import 'package:e_commerce/UI/pages/master_page.dart';
import 'package:e_commerce/UI/widgets/headline.widgets.dart';
import 'package:e_commerce/providers/notification.providers.dart';
import 'package:e_commerce/utils/colors.util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color(0xffF5F6F8),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                  const HeadlineWidget(title: 'Notifications'),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<NotificationProvider>(
                      builder: (context, notValues, _) {
                    return FutureBuilder(
                        future: notValues.getNotifications(context),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasError) {
                              return const Text('Error while get data');
                            } else if (snapshot.hasData) {
                              return ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  separatorBuilder: (context, _) =>
                                      const Divider(
                                          thickness: 0,
                                          indent: 10,
                                          color: Color(0xff727C8E)),
                                  itemCount: snapshot.data?.length ?? 1,
                                  itemBuilder: (_, index) {
                                    if (snapshot.data?.isNotEmpty ?? false) {
                                      return ListTile(
                                        leading: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xffdcdcdc)),
                                          child: Center(
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.notifications,
                                              ),
                                              color: ColorsUtil.badgeColor,
                                              iconSize: 15.0,
                                              onPressed: () {},
                                            ),
                                          ),
                                        ),
                                        title: Row(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                '${snapshot.data?[index].description}',
                                                style: const TextStyle(
                                                  fontFamily: 'NeusaNextStd',
                                                  fontStyle: FontStyle.normal,
                                                  color: Color(0xff515c6f),
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                '${snapshot.data?[index].time}',
                                                style: const TextStyle(
                                                  fontFamily: 'NeusaNextStd',
                                                  fontStyle: FontStyle.normal,
                                                  color: Color(0xff515c6f),
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return const Text('No Notifications');
                                    }
                                  });
                            } else {
                              return const Text('No data found');
                            }
                          } else {
                            return Text(
                                'Connection State: ${snapshot.connectionState}');
                          }
                        });
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
