import 'package:flutter/material.dart';

class ProductSizeWidget extends StatefulWidget {
  final List<dynamic> values;
  final void Function(dynamic) onPressed;

  const ProductSizeWidget(
      {super.key, required this.onPressed, required this.values});

  @override
  State<ProductSizeWidget> createState() => _ProductSizeWidgetState();
}

class _ProductSizeWidgetState extends State<ProductSizeWidget> {
  int? selectedIndex = -1;
  late List<dynamic> values;
  @override
  void initState() {
    values = widget.values;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.values.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: ElevatedButton(
                      onPressed: () {
                        if (selectedIndex == index) {
                          selectedIndex = 0;
                        } else {
                          selectedIndex = index;
                        }
                        widget.onPressed.call(values[selectedIndex ?? 0]);
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        fixedSize: const Size(72, 39),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text(
                        '${values[index]}',
                        //WidgetData.prodctSize[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: selectedIndex == index
                                ? const Color(0xffff6969)
                                : const Color(0xff727c8e),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
