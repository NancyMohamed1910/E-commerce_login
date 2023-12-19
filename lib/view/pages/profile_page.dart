import 'package:e_commerce/providers/authentication.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            Provider.of<AuthenticationProvider>(context, listen: false)
                .onLogout(context);
          },
          child: Text('Logout')),
    );
  }
}
