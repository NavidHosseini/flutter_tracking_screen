import 'package:flutter/material.dart';

class Themes {
  static final themelight = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF00a693),
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme(
      primary: Color(0xFF00a693),
      onPrimary: Colors.black,
      primaryVariant: Color(0xFF00a693),
      background: Color(0xFF00a693),
      onBackground: Colors.black,
      secondary: Color(0xFF00a693),
      onSecondary: Colors.white,
      secondaryVariant: Color(0xFF00a693),
      error: Colors.black,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
      brightness: Brightness.light,
    ),
    // Define the default font family.
    // fontFamily: 'Sans',
    //   textTheme: const TextTheme(
    //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    // ),
  );

  static final themedark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF00a693),
    backgroundColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    // colorScheme: const ColorScheme(
    //   primary: Color(0xFF00a693),
    //   onPrimary: Colors.black,
    //   primaryVariant: Color(0xFF00a693),
    //   background: Color(0xFF00a693),
    //   onBackground: Colors.black,
    //   secondary: Color(0xFF00a693),
    //   onSecondary: Colors.white,
    //   secondaryVariant: Color(0xFF00a693),
    //   error: Colors.black,
    //   onError: Colors.white,
    //   surface: Colors.white,
    //   onSurface: Colors.black,
    //   brightness: Brightness.light,
    // ),
    // Define the default font family.
    fontFamily: 'Sans',
    //   textTheme: const TextTheme(
    //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    // ),
  );
}
