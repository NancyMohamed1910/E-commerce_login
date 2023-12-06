import 'package:flutter/material.dart';

class RowButtonWidgets extends StatefulWidget {
  const RowButtonWidgets({super.key});

  @override
  State<RowButtonWidgets> createState() => _RowButtonWidgetsState();
}

class _RowButtonWidgetsState extends State<RowButtonWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                elevation: 0,
                backgroundColor: Colors.white,
                fixedSize: const Size(110, 30),
              ),
              child: Text(
                'Products',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff727c8e),
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              )),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                elevation: 0,
                backgroundColor: Colors.white,
                fixedSize: const Size(110, 30),
              ),
              child: Text(
                'Details',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff727c8e),
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              )),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                elevation: 0,
                backgroundColor: Colors.white,
                fixedSize: const Size(110, 30),
              ),
              child: Text(
                'Reviews',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff727c8e),
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              )),
        ],
      ),
    );
  }
}
