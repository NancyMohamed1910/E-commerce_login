import 'package:e_commerce/view/pages/signup_page.dart';
import 'package:flutter/material.dart';

class SignupRow extends StatefulWidget {
  const SignupRow({super.key});

  @override
  State<SignupRow> createState() => _SignupRowState();
}

class _SignupRowState extends State<SignupRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Do't have acount?",
            style: TextStyle(
                color: Colors.red, fontSize: 14, fontWeight: FontWeight.w200)),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const SignupPage()));
          },
          style: ElevatedButton.styleFrom(minimumSize: const Size(100, 50)),
          child: const Text('SignUP',
              style: TextStyle(
                  //color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.w200)),
        ),
      ],
    );
  }
}
