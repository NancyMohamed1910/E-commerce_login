import 'package:flutter/material.dart';

class ThemeUtils {
  static ThemeData themeData = ThemeData(
    fontFamily: 'NeusaNextStd',
    textTheme: const TextTheme(
        headlineLarge: TextStyle(
            color: Color(0xff515C6F),
            fontSize: 30,
            fontWeight: FontWeight.bold),
        displayLarge: TextStyle(
            color: Color(0xff515C6F),
            fontSize: 30,
            fontWeight: FontWeight.w100),
        displayMedium: TextStyle(
            color: Color(0xff515C6F),
            fontSize: 12,
            fontWeight: FontWeight.w500)),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
    useMaterial3: true,
  );
}
