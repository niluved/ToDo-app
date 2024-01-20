import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepOrange,
    secondary: Colors.green,
    tertiary: Colors.indigo,
    brightness: Brightness.light,
  ),
  useMaterial3: true,
);

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepOrange,
    secondary: Colors.green,
    tertiary: Colors.indigo,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
);
