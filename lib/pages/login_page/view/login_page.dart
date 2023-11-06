import 'package:flutter/material.dart';
import 'package:testeam_mobile_application/connections/connection.dart';
import 'package:testeam_mobile_application/pages/login_page/widgets/input_label.dart';
import 'package:testeam_mobile_application/theme/theme.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ValueNotifier<String> requestStatusNotifier = ValueNotifier<String>('');

  AuthRequest auth = new AuthRequest();
  String additionalText = '';

  Future<bool> attemptLogin(email, password) async {
    try {
      final token = await auth.login(email, password);
      if (token != null) {
        print('Успешно вошли! Токен: $token');
        return true;
      } else {
        print('Ошибка входа');
        requestStatusNotifier.value = 'Ошибка входа';
        return false;
      }
    } catch (e) {
      print(e);
      requestStatusNotifier.value = e.toString();
      return false;
    }
  }

  final _authKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
        body: Form(
      key: _authKey,
      child: Column(
        children: [
          const SizedBox(
            height: 132,
          ),
          Container(
            child: Center(
              child: Text(
                'Login',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          const SizedBox(
            height: 56,
          ),
          inputLabel(
            inputIcon: Icons.email,
            inputText: 'Email',
            controller: _emailController,
            requestStatusNotifier: requestStatusNotifier,
            isPassword: false,
          ),
          const SizedBox(
            height: 20,
          ),
          inputLabel(
            inputIcon: Icons.lock,
            inputText: 'Password',
            controller: _passwordController,
            requestStatusNotifier: requestStatusNotifier,
            isPassword: true,
          ),
          const SizedBox(
            height: 10,
          ),
          if (additionalText.isNotEmpty)
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
              child: Text(
                additionalText,
                style: TextStyle(color: Colors.red),
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(right: 35.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/recovery_password');
                },
                child: Text(
                  'Forgot your password?',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 74,
          ),
          TextButton(
            style: flatButtonStyle,
            onPressed: () async {
              if (await attemptLogin(
                  _emailController.text, _passwordController.text)) {
                Navigator.of(context).pushNamed('/home_page');
              } else {
                switch (requestStatusNotifier.value) {
                  case '400':
                    setState(() {
                      additionalText = 'Field validation error';
                    });
                    break;
                  case '404':
                    setState(() {
                      additionalText =
                          'User email is not registered in the system';
                    });
                    break;
                  case '422':
                    setState(() {
                      additionalText =
                          'One or more fields were passed incorrectly. Field validation error';
                    });
                    break;
                  default:
                    setState(() {
                      additionalText = '';
                    });
                    break;
                }
              }
            },
            child: Text(
              'Confirm',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      ),
    )
        //Stack
        ); //Scaffold
  }
}
