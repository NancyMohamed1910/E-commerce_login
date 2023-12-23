import 'package:e_commerce/providers/authentication.provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  void initState() {
    Provider.of<AuthenticationProvider>(context, listen: false).initProvider();

    super.initState();
  }

  @override
  void dispose() {
    Provider.of<AuthenticationProvider>(context, listen: false)
        .disposeProvider();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      builder: (context, _) => Scaffold(
          backgroundColor: const Color(0xffF5F6F8),
          body: Consumer<AuthenticationProvider>(
              builder: (context, authProvider, _) {
            return Form(
              key: authProvider.formKey,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 35.h,
                        ),
                        Container(
                          height: 300.h,
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
                                  controller: authProvider.emailController,
                                  validator: (value) {
                                    if (value == null || value == '') {
                                      return 'email is required';
                                    }
                                    if (!EmailValidator.validate(value)) {
                                      return 'Enter Valid Email';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    label: Text('EMAIL'),
                                    prefixIcon: Icon(Icons.mail),
                                    isDense: false,
                                    filled: false,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                                const Divider(
                                    thickness: 2, color: Color(0xffF5F6F8)),
                                TextFormField(
                                  keyboardType: TextInputType.name,
                                  controller: authProvider.userController,
                                  validator: (value) {
                                    if (value == null || value == '') {
                                      return 'Name is required';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    label: Text('USER NAME'),
                                    prefixIcon: Icon(Icons.person),
                                    isDense: false,
                                    filled: false,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                                const Divider(
                                    thickness: 2, color: Color(0xffF5F6F8)),
                                TextFormField(
                                  obscureText: authProvider.obscureText,
                                  controller: authProvider.passwordController,
                                  validator: (value) {
                                    if (value == null || value == '') {
                                      return 'password is required';
                                    }
                                    if (value.length < 8) {
                                      return 'Password length must be 8';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    label: const Text('PASSWORD'),
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        authProvider.toggleObscureText();
                                      },
                                      child: authProvider.obscureText
                                          ? const Icon(Icons.visibility_off)
                                          : const Icon(Icons.visibility),
                                    ),
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
                            await authProvider.signUp(context);
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
                                      'SIGN UP',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
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
                        SizedBox(
                          height: 60.h,
                        ),
                        Text(
                          'By creating an account, you agree to our ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: const Color(0xff515C6F),
                            fontWeight: FontWeight.w300,
                            fontSize: 12.sp,
                          ),
                        ),
                        Wrap(children: [
                          Text(
                            'Terms of Service ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: const Color(0xffFF6969),
                              fontWeight: FontWeight.w300,
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            'and ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: const Color(0xff515C6F),
                              fontWeight: FontWeight.w300,
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            'Privacy Policy ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              color: const Color(0xffFF6969),
                              fontWeight: FontWeight.w300,
                              fontSize: 12.sp,
                            ),
                          ),
                        ])
                      ]),
                ),
              ),
            );
          })),
    );
  }
}
