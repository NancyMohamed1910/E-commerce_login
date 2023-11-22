import 'package:e_commerce/view/widgets/text_field.widgets.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/view/screens/logIn.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Sign Up',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...List.generate(5, (index) => TextFieldItem(label: 'hi')),
            /*TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),*/
            //--------------
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: GestureDetector(
                onTap: openSignIn,
                child: RichText(
                  text: const TextSpan(
                    text: 'Have an account? ',
                    style: TextStyle(color: Colors.blueGrey),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openSignIn() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }
}
