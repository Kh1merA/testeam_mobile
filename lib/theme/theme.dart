import 'package:flutter/material.dart';

final mainTheme = ThemeData(
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color.fromRGBO(73, 66, 228, 1)),
  useMaterial3: true,
  textTheme: TextTheme(
    titleLarge: TextStyle(
        fontFamily: "OpenSans",
        fontSize: 36,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(73, 66, 228, 1)),
    titleMedium: TextStyle(
        fontFamily: "OpenSans",
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(44, 44, 44, 1)),
    titleSmall: TextStyle(
        fontFamily: "OpenSans",
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(173, 173, 173, 0.5)),
    labelSmall: TextStyle(
        fontFamily: "OpenSans",
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(73, 66, 228, 1)),
    labelLarge: TextStyle(
      fontFamily: "OpenSans",
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
  ),
);
