import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int dotIndex = 0;
  void getdotIndex(int index) {
    dotIndex = index;
    notifyListeners();
  }
}
