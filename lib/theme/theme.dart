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

final ButtonStyle greenMainPageButton = TextButton.styleFrom(
  backgroundColor: Color.fromARGB(255, 68, 227, 160),
  minimumSize: Size(85, 26),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(9)),
  ),
);

final ButtonStyle blackMainPageButton = TextButton.styleFrom(
  backgroundColor: Color.fromARGB(255, 0, 0, 0),
  minimumSize: Size(103, 26),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(9)),
  ),
);

TextStyle mainPageGoToTest = TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 12,
    color: Colors.black,
    fontWeight: FontWeight.bold);

TextStyle profileTitleText = const TextStyle(
  fontSize: 36,
  fontFamily: "OpenSans",
  fontWeight: FontWeight.w700,
  color: Colors.black,
);

IconThemeData iconProfileTheme =
    IconThemeData(size: 30.0, color: Color.fromRGBO(73, 66, 228, 1));

TextStyle editUserPasswordStyle = const TextStyle(
  fontSize: 14,
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.w500,
  color: Color.fromRGBO(173, 173, 173, 1),
);

InputDecoration errorInputDecoration = InputDecoration(
  fillColor: Color.fromRGBO(255, 0, 0, 1),
  filled: true,
  labelStyle: TextStyle(color: Colors.red),
);

TextStyle validatorError = const TextStyle(
  fontSize: 14,
  fontFamily: "OpenSans",
  fontWeight: FontWeight.w700,
  color: Colors.red,
);

TextStyle companyNameTextStyle = const TextStyle(
  fontSize: 20,
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.w800,
  color: Colors.white,
);

TextStyle companyAmountWorkersTextStyle = const TextStyle(
  fontSize: 14,
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.w500,
  color: Colors.white,
);

final TextStyle customDropDownTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 14.0,
);

const double customFieldWidth = 50;
const double customFieldHeight = 30;

final InputDecoration customDropDownInputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.black),
  ),
  labelText: 'Position',
);

TextStyle textSearchFieldStyle = const TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black);

InputDecoration inputSearchDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromRGBO(173, 173, 173, 150),
    ),
    borderRadius: BorderRadius.circular(10.0),
  ),
);

TextStyle textCompanyTextStyle = const TextStyle(
    fontFamily: 'OpenSans', fontSize: 14, color: Color.fromRGBO(30, 30, 30, 1));

TextStyle textCompanyItemsStyle = const TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 14,
    fontWeight: FontWeight.w800,
    color: Color.fromRGBO(30, 30, 30, 1));

TextStyle textQuizTitle = const TextStyle(
    fontFamily: 'OpenSans',
    fontSize: 30,
    color: Color.fromRGBO(73, 66, 228, 1),
    fontWeight: FontWeight.bold);

TextStyle textQuizTextTitle = const TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

TextStyle textQuizTitlePage = const TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 25,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

TextStyle textQuizText = const TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 14,
  color: Colors.black,
);

TextStyle textQuizTextDesc = const TextStyle(
  fontFamily: 'OpenSans',
  fontSize: 14,
  color: Color.fromARGB(148, 0, 0, 0),
);

TextStyle tagNameQuiz = const TextStyle(
  fontFamily: 'OpenSans',
  fontWeight: FontWeight.bold,
  fontSize: 20,
  color: Color.fromRGBO(151, 71, 255, 1),
);

TextStyle quizButtonText = const TextStyle(
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 20);
