import 'package:flutter/material.dart';
import 'package:testeam_mobile_application/pages/login_page/widgets/input_label.dart';
import 'package:testeam_mobile_application/theme/theme.dart';

class login_page extends StatelessWidget {
  const login_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          const inputLabel(
            inputIcon: Icons.email,
            inputText: 'Email',
          ),
          const SizedBox(
            height: 20,
          ),
          const inputLabel(
            inputIcon: Icons.lock,
            inputText: 'Password',
          ),
          const SizedBox(
            height: 20,
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
            onPressed: () {
              Navigator.of(context).pushNamed('/home_page');
            },
            child: Text(
              'Confirm',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      ), //Stack
    ); //Scaffold
  }
}
