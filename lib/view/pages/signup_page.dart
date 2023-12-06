import 'package:e_commerce/view/pages/master_page.dart';
import 'package:e_commerce/view/widgets/text_field.widgets.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late GlobalKey<FormState>
      formKey; //declaration of global key of type formstate
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController mailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    formKey = GlobalKey<FormState>(); // create constructor of form key
    nameController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    mailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    mailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldWidget(
                    icon: const Icon(Icons.person),
                    label: 'Name',
                    controller: nameController,
                    isHide: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    icon: const Icon(Icons.phone),
                    label: 'Phone',
                    controller: phoneController,
                    isHide: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    icon: const Icon(Icons.home),
                    label: 'Address',
                    controller: addressController,
                    isHide: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    icon: const Icon(Icons.mail),
                    label: 'Email',
                    controller: mailController,
                    isHide: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    icon: const Icon(Icons.visibility_off),
                    label: 'Password',
                    controller: passwordController,
                    isHide: true,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if ((formKey.currentState?.validate() ?? false)) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const MasterPage()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 50)),
                    child: const Text('Save'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
