import 'package:flutter/material.dart';
class AppTheme {
  static ThemeData light = ThemeData(
    primaryColor: Color.fromARGB(255, 8, 227, 103),
    colorScheme: ColorScheme.light(
      primary: Colors.green.shade400,
      secondary: Colors.amber
    ),
  );
   static ThemeData dark = ThemeData(
    primaryColor: Colors.orange,
    colorScheme: ColorScheme.dark(
      primary: Colors.orange,
      secondary: Colors.amber
    ),
  );
}