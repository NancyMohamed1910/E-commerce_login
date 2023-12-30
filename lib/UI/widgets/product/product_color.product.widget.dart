import 'package:flutter/material.dart';

class ProductColorWidget extends StatefulWidget {
  final List<int> colors;
  final void Function(Color) onPressed;
  const ProductColorWidget(
      {super.key, required this.onPressed, required this.colors});

  @override
  State<ProductColorWidget> createState() => _ProductColorWidgetState();
}

class _ProductColorWidgetState extends State<ProductColorWidget> {
  int selectedIndex = -1;
  late List<Color> colors;
  @override
  void initState() {
    colors = widget.colors.map((e) => Color(e)).toList();
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
            height: 42,
            child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.colors.length,
                itemBuilder: (_, index) {
                  return ElevatedButton(
                    onPressed: () {
                      if (selectedIndex == index) {
                        selectedIndex = 0;
                      } else {
                        selectedIndex = index;
                      }
                      widget.onPressed.call(colors[selectedIndex]);
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors[index],
                      //Colors.red, //Color(WidgetData.productColors[index]),
                      elevation: 0,
                      fixedSize: const Size(40, 40),
                      shape: const CircleBorder(),
                    ),
                    child: Center(
                      child: selectedIndex == index
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
