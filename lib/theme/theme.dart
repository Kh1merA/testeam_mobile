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
    labelMedium: TextStyle(
      fontSize: 14,
      fontFamily: "OpenSans",
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  ),
);

TextStyle appBarText = const TextStyle(
  fontSize: 20,
  fontFamily: "OpenSans",
  fontWeight: FontWeight.w400,
  color: Colors.black,
);

TextStyle textTitle = const TextStyle(
  fontSize: 14,
  fontFamily: "OpenSans",
  fontWeight: FontWeight.w600,
  color: Colors.black,
);

TextStyle appBarTitleText = const TextStyle(
  fontFamily: "OpenSans",
  fontSize: 46,
  fontWeight: FontWeight.w700,
  color: Color.fromRGBO(73, 66, 228, 1),
);

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  backgroundColor: const Color.fromRGBO(73, 66, 228, 1),
  minimumSize: const Size(160, 50),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(18)),
  ),
);

final ButtonStyle blackFlatButtonStyle = TextButton.styleFrom(
  backgroundColor: Color.fromARGB(255, 0, 0, 0),
  minimumSize: const Size(160, 50),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(18)),
  ),
);

TextStyle profileTitleText = const TextStyle(
  fontSize: 20,
  fontFamily: "OpenSans",
  fontWeight: FontWeight.w700,
  color: Colors.black,
);

IconThemeData iconProfileTheme =
    IconThemeData(size: 30.0, color: Color.fromRGBO(73, 66, 228, 1));
