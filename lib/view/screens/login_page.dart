import 'package:e_commerce/services/preference.services.dart';
import 'package:e_commerce/utils/colors.util.dart';
import 'package:e_commerce/view/screens/home_page.dart';
import 'package:e_commerce/view/screens/master_page.dart';
import 'package:e_commerce/view/widgets/AppBar_EX.widgets.dart';

import 'package:e_commerce/view/widgets/headline.widgets.dart';
import 'package:e_commerce/view/widgets/signup.widgets.dart';
import 'package:e_commerce/view/widgets/text_field.widgets.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
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
          margin: EdgeInsets.all(30),
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
                          icon: const Icon(Icons.mail),
                          label: 'USER NAME/EMAIL',
                          controller: mailController,
                          isHide: false,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                          icon: const Icon(Icons.visibility_off),
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
            //print(mailController.text);
            //    print(passwordController.text);
            if ((formKey.currentState?.validate() ?? false)) {
              //    print('hi from login button');

              await PreferenceSrevice.set(
                  mailController.text, passwordController.text, true);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => MasterPage()));
            }
          },
          child: Text(
            'LOG IN',
            style: TextStyle(color: Color(0xffFFFFFF), fontSize: 12),
          ),
          style: ElevatedButton.styleFrom(
              minimumSize: Size(650, 60),
              backgroundColor: ColorsUtil.buttonColor),
        ),
      ],
    );
  }
}
