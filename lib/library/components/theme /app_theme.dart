import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.green;

  static final lightTheme = ThemeData.light().copyWith(
    //Primary Color
    primaryColor: Colors.indigo[600],
    colorScheme: const ColorScheme.light(primary: primary),
    //AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      elevation: 10,
    ),

    //TextButtonTheme
    textButtonTheme:
        TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),

    //FloatinActionButtonTheme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 20,
    ),

    //ElevatedButtonTheme
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),

    //
    inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primary),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(20))),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(20)))),
  );

  static final darkTheme = ThemeData.dark().copyWith(

      //Primary Color
      primaryColor: Colors.indigo[600],

      //AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: primary,
        elevation: 10,
      ),
      //TextButtonTheme
      textButtonTheme:
          TextButtonThemeData(style: TextButton.styleFrom(primary: primary)));
}
