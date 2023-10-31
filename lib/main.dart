import 'package:flutter/material.dart';
import 'package:testeam_mobile_application/pages/home_page/view/home_page.dart';
import 'package:testeam_mobile_application/pages/user_page/view/user_page.dart';
import 'package:testeam_mobile_application/router/router.dart';
import 'package:testeam_mobile_application/theme/theme.dart';
import 'pages/login_page/view/view.dart';
import 'pages/recovery_password/view/view.dart';

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
      initialRoute: '/',
      routes: routes,
    );
  }
}
