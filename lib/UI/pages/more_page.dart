import 'package:e_commerce/providers/authentication.provider.dart';
import 'package:e_commerce/UI/widgets/uplaoadbutton.widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UploadWidget(),
        ElevatedButton(
            onPressed: () {
              Provider.of<AuthenticationProvider>(context, listen: false)
                  .onLogout(context);
            },
            child: const Text('Logout')),
      ],
    );
  }
}
