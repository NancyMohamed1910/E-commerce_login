import 'package:flutter/material.dart';

import 'package:e_commerce/view/pages/master_page.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;

  bool obscureText = true;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 667),
      builder: (context, _) => Scaffold(
        backgroundColor: Color(0xffF5F6F8),
        body: Form(
          key: formKey,
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
                        fontStyle: FontStyle.normal,
                        color: Color(0xff515C6F),
                        fontWeight: FontWeight.w300,
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      'your account and we will email you a link to',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        color: Color(0xff515C6F),
                        fontWeight: FontWeight.w300,
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      'reset your password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        color: Color(0xff515C6F),
                        fontWeight: FontWeight.w300,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Container(
                      height: 100.h,
                      width: 325.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
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
                                label: Text('EMAIL'),
                                prefixIcon: const Icon(Icons.mail),
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
                      onPressed: () {
                        if ((formKey.currentState?.validate() ?? false)) {
                          GetIt.I<SharedPreferences>()
                              .setString('user', emailController.text);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => MasterPage()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        elevation: 0,
                        backgroundColor: Color(0xffFF6969),
                        shadowColor: Color.fromARGB(255, 105, 105, 4),
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
                                    fontStyle: FontStyle.normal,
                                    color: Color(0xffFFFFFF),
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
        ),
      ),
    );
  }
}
