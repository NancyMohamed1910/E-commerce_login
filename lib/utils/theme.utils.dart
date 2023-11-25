import 'package:flutter/material.dart';

class ThemeUtils {
  static ThemeData themeData = ThemeData(
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          color: Color.fromARGB(255, 88, 51, 123),
          fontSize: 22,
          fontWeight: FontWeight.w500),
      displayMedium: TextStyle(
          color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w500),
      displaySmall: TextStyle(
          color: Color.fromARGB(255, 123, 51, 51),
          fontSize: 14,
          fontWeight: FontWeight.w200),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.purpleAccent),
    useMaterial3: true,
  );
}
