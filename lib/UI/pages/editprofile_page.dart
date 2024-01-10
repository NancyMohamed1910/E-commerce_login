import 'package:e_commerce/UI/pages/master_page.dart';

import 'package:e_commerce/UI/widgets/headline.widgets.dart';

import 'package:e_commerce/providers/userprofile.providers.dart';
import 'package:e_commerce/utils/colors.util.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    super.key,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  void initState() {
    Provider.of<UsersProvider>(context, listen: false).initProvider();

    super.initState();
  }

  @override
  void deactivate() {
    Provider.of<UsersProvider>(context, listen: false).disposeProvider();

    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 667),
        builder: (context, _) =>
            Consumer<UsersProvider>(builder: (context, userProvider, _) {
              Provider.of<UsersProvider>(context, listen: false)
                  .toDispalyUserProfile();

              return Scaffold(
                  backgroundColor: const Color(0xffF5F6F8),
                  body: SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            const HeadlineWidget(title: 'Edit Profile'),
                            SingleChildScrollView(
                              child: Center(
                                child: Form(
                                  key: userProvider.formKey,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 35.h,
                                        ),
                                        Container(
                                          width: 325.w,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8.r)),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              // crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                TextFormField(
                                                  autocorrect: true,
                                                  autofocus: true,
                                                  style: TextStyle(
                                                    fontFamily: 'NeusaNextStd',
                                                    fontStyle: FontStyle.normal,
                                                    color: ColorsUtil.textColor,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 15.sp,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                  controller: userProvider
                                                      .nameController,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value == '') {
                                                      return 'Name is required';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                    label: Text(
                                                      'NAME',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'NeusaNextStd',
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color: ColorsUtil
                                                            .textColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                    prefixIcon: Icon(
                                                        size: 20.0.w,
                                                        Icons.person),
                                                    isDense: false,
                                                    filled: false,
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                  ),
                                                ),
                                                const Divider(
                                                    thickness: 2,
                                                    color: Color(0xffF5F6F8)),
                                                TextFormField(
                                                  style: TextStyle(
                                                    fontFamily: 'NeusaNextStd',
                                                    fontStyle: FontStyle.normal,
                                                    color: ColorsUtil.textColor,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 15.sp,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                  controller: userProvider
                                                      .addressController,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value == '') {
                                                      return 'address is required';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                    label: Text(
                                                      'ADDRESS',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'NeusaNextStd',
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color: ColorsUtil
                                                            .textColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                    prefixIcon: Icon(
                                                        size: 20.0.w,
                                                        Icons.home),
                                                    isDense: false,
                                                    filled: false,
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                  ),
                                                ),
                                                const Divider(
                                                    thickness: 2,
                                                    color: Color(0xffF5F6F8)),
                                                TextFormField(
                                                  style: TextStyle(
                                                    fontFamily: 'NeusaNextStd',
                                                    fontStyle: FontStyle.normal,
                                                    color: ColorsUtil.textColor,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 15.sp,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                  controller: userProvider
                                                      .ageController,
                                                  decoration: InputDecoration(
                                                    label: Text(
                                                      'AGE',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'NeusaNextStd',
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color: ColorsUtil
                                                            .textColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                    prefixIcon: Icon(
                                                        size: 20.0.w,
                                                        Icons.person_2),
                                                    isDense: false,
                                                    filled: false,
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                  ),
                                                ),
                                                const Divider(
                                                    thickness: 2,
                                                    color: Color(0xffF5F6F8)),
                                                TextFormField(
                                                  style: TextStyle(
                                                    fontFamily: 'NeusaNextStd',
                                                    fontStyle: FontStyle.normal,
                                                    color: ColorsUtil.textColor,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 15.sp,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                  controller: userProvider
                                                      .phoneController,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value == '') {
                                                      return 'Phone is required';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                    label: Text(
                                                      'PHONE',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'NeusaNextStd',
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color: ColorsUtil
                                                            .textColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                    prefixIcon: Icon(
                                                        size: 20.0.w,
                                                        Icons.phone),
                                                    isDense: false,
                                                    filled: false,
                                                    border: InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                  ),
                                                ),
                                              ]),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            userProvider
                                                .onSaveEditedData(context);
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        const MasterPage()));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: const StadiumBorder(),
                                            elevation: 0,
                                            backgroundColor:
                                                const Color(0xffFF6969),
                                            shadowColor: const Color.fromARGB(
                                                255, 105, 105, 4),
                                            fixedSize: Size(325.w, 50.h),
                                          ),
                                          child: Text(
                                            'SAVE',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'NeusaNextStd',
                                              fontStyle: FontStyle.normal,
                                              color: const Color(0xffFFFFFF),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 60.h,
                                        ),
                                      ]),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
            }));
  }
}
