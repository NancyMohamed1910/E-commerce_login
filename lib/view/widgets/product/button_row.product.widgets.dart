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
      padding: const EdgeInsets.only(
        left: 15,
        top: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              child: ElevatedButton(
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
                      fontSize: 14,
                    ),
                  )),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
                width: 10,
                child: ElevatedButton(
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
                        fontSize: 14,
                      ),
                    ))),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 10,
              child: ElevatedButton(
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
                      fontSize: 14,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
