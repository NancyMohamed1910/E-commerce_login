import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceServices {
  static SharedPreferences? _prefs;

  /// note we create only one instance ,just only one
  static Future<void> init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      //print('------init pref-----------');
      debugPrint('-----init pref from debug print----');
    } catch (e) {
      //print('>>>>>>error $e');
    }
  }

  static SharedPreferences? get prefs => _prefs;
}
