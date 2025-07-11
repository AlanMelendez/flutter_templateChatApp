import 'package:flutter/material.dart';



  const Color _customColor = Color(0xFF6200EE);

  const List<Color> _customColorPalette = [
    _customColor,
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.orange,
  ];

class AppTheme{

  final int selectedColor;
  AppTheme({  this.selectedColor = 0}): assert(selectedColor >= 0 && selectedColor <= _customColorPalette.length - 1, 'Colors must be between 0 and 5');

  ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _customColorPalette[selectedColor],
      // brightness: Brightness.dark, // Default brightness
    );
  }
  ThemeData  get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.blue,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
        bodySmall: TextStyle(color: Colors.black),
      ),
    );
  }
  ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.blue,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
      ),
    );
  }



}