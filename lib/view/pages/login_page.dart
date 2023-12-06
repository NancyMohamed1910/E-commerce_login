import 'package:e_commerce/services/preference.services.dart';
import 'package:e_commerce/utils/colors.util.dart';
import 'package:e_commerce/view/pages/master_page.dart';
import 'package:e_commerce/view/widgets/text_field.widgets.dart';
import 'package:line_icons/line_icons.dart';

import 'package:flutter/material.dart';

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
