import 'package:e_commerce/providers/authentication.provider.dart';
import 'package:e_commerce/utils/colors.util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  void initState() {
    Provider.of<AuthenticationProvider>(context, listen: false).initProviderF();
    super.initState();
  }

  @override
  void deactivate() {
    Provider.of<AuthenticationProvider>(context, listen: false)
        .disposeProviderF();
    super.deactivate();
  }

//void dispose() {
  //  Provider.of<AuthenticationProvider>(context, listen: false)
  //    .disposeProviderF();
  //super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (context, _) => Scaffold(
          backgroundColor: const Color(0xffF5F6F8),
          body: Consumer<AuthenticationProvider>(
              builder: (context, authProvider, _) {
            return Form(
              key: authProvider.formKeyF,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 35.h,
                        ),
                        Text(
                          'Enter the email address you used to create',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'NeusaNextStd',
                            fontStyle: FontStyle.normal,
                            color: const Color(0xff515C6F),
                            fontWeight: FontWeight.w300,
                            fontSize: 15.sp,
                          ),
                        ),
                        Text(
                          'your account and we will email you a link to',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'NeusaNextStd',
                            fontStyle: FontStyle.normal,
                            color: const Color(0xff515C6F),
                            fontWeight: FontWeight.w300,
                            fontSize: 15.sp,
                          ),
                        ),
                        Text(
                          'reset your password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'NeusaNextStd',
                            fontStyle: FontStyle.normal,
                            color: const Color(0xff515C6F),
                            fontWeight: FontWeight.w300,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Container(
                          width: 325.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(
                                  style: TextStyle(
                                    fontFamily: 'NeusaNextStd',
                                    fontStyle: FontStyle.normal,
                                    color: ColorsUtil.textColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15.sp,
                                  ),
                                  textAlign: TextAlign.left,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: authProvider.emailControllerF,
                                  validator: (value) {
                                    if (value == null || value == '') {
                                      return 'email is required';
                                    }
                                    if (!EmailValidator.validate(value)) {
                                      return 'Enter Valid Email';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    label: Text(
                                      'EMAIL',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'NeusaNextStd',
                                        fontStyle: FontStyle.normal,
                                        color: ColorsUtil.textColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    prefixIcon: Icon(size: 20.0.w, Icons.mail),
                                    isDense: false,
                                    filled: false,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await authProvider.resetPassord(context);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            elevation: 0,
                            backgroundColor: const Color(0xffFF6969),
                            shadowColor: const Color.fromARGB(255, 105, 105, 4),
                            fixedSize: Size(325.w, 50.h),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(
                                    child: Text(
                                      'SEND EMAIL',
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
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(
                                    child: Container(
                                      width: 30.w,
                                      height: 30.h,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: const Icon(
                                        Icons.keyboard_arrow_right,
                                        color: Color(0xffFF6969),
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ]),
                ),
              ),
            );
          })),
    );
  }
}
/////////////////////
 