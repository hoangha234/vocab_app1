import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.brown,
    appBarTheme: const AppBarTheme(color: Colors.brown),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.brown),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey,
    scaffoldBackgroundColor: const Color.fromARGB(255, 71, 48, 48),
    appBarTheme: const AppBarTheme(color: Color.fromARGB(221, 49, 13, 13)),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.brown),
  );
}