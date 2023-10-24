import 'package:flutter/material.dart';
import 'package:testeam_mobile_application/theme/theme.dart';
import 'pages/login_page/view/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: mainTheme,
      home: login_page(),
    );
  }
}
