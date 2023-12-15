import 'package:e_commerce/view/pages/master_page.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool obscureText = true;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                        label: Text('Email'),
                        suffixIcon: const Icon(Icons.mail),
                        // fillColor: Colors.red,
                        isDense: true,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: obscureText,
                      controller: passwordController,
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
                        label: const Text('Password'),
                        suffixIcon: InkWell(
                          onTap: () {
                            obscureText = !obscureText;
                            setState(() {});
                          },
                          child: obscureText
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),

                        // fillColor: Colors.red,
                        isDense: true,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
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
                        minimumSize: const Size(300, 60),
                      ),
                      child: Text('Submit'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}








///////////////////////////////////////////////////////
/*
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  //late TextEditingController txtController;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late GlobalKey<FormState>
      formKey; //declaration of global key of type formstate
  late TextEditingController mailController;
  late TextEditingController passwordController;
  //late bool isHide;

  @override
  void initState() {
    formKey = GlobalKey<FormState>(); // create constructor of form key
    mailController = TextEditingController();
    passwordController = TextEditingController();
    //isHide = false;
    super.initState();
  }

  void onPress() async {
    if ((formKey.currentState?.validate() ?? false)) {
      PreferenceSrevice.set(mailController.text, passwordController.text, true);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const MasterPage()));
    }
  }

  @override
  void dispose() {
    mailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFieldWidget(
                          icon: const Icon(LineIcons.user),
                          label: 'USER NAME/EMAIL',
                          controller: mailController,
                          isHide: false,
                        ),
/*const SizedBox(
                          height: 20,
                        ),*/
                        TextFieldWidget(
                          icon: const Icon(LineIcons.lock),
                          label: 'PASSWORD',
                          controller: passwordController,
                          isHide: true,
                        ),
                        /*const SizedBox(
                          height: 50,
                        ),
                        
                        SizedBox(
                          height: 30,
                        ),*/
                        //SignupRow(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            onPress();
          },
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(650, 60),
              backgroundColor: ColorsUtil.buttonColor),
          child: const Text(
            'LOG IN',
            style: TextStyle(color: Color(0xffFFFFFF), fontSize: 12),
          ),
        ),
      ],
    );
  }
}
*/