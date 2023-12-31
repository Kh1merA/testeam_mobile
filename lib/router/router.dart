import 'package:testeam_mobile_application/pages/company_page/view/company_page.dart';
import 'package:testeam_mobile_application/pages/home_page/view/home_page.dart';
import 'package:testeam_mobile_application/pages/login_page/view/view.dart';
import 'package:testeam_mobile_application/pages/recovery_password/view/view.dart';
import 'package:testeam_mobile_application/pages/user_page/view/view.dart';

final routes = {
  '/': (context) => LoginPage(),
  '/recovery_password': (context) => const recovery_password(),
  '/recovery_password/enter_code_password': (context) => password_code(),
  '/recovery_password/enter_code_password/change_password': (context) =>
      change_password(),
  '/company_page': (context) => company_page(),
  '/user_page': (context) => user_page(),
  '/user_page/edit_password': (context) => edit_user_password(),
  '/home_page': (context) => HomePage(),
};
