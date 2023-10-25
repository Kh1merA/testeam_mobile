import 'package:flutter/material.dart';
import 'package:testeam_mobile_application/pages/login_page/widgets/input_label.dart';
import 'package:testeam_mobile_application/theme/theme.dart';

class password_code extends StatelessWidget {
  const password_code({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/');
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios),
                    Expanded(
                        child: Text(
                      'Back',
                      style: appBarText,
                    ))
                  ],
                ),
              ),
            ),
            leadingWidth: 100,
          ),
          const SizedBox(
            height: 132,
          ),
          Center(
            child: Text(
              'Reset password',
              style: appBarTitleText,
            ),
          ),
          const SizedBox(
            height: 38,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35.0, right: 35.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Enter the verification code that we sent to your email',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const inputLabel(
            inputIcon: Icons.numbers,
            inputText: 'Verification code',
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            padding: const EdgeInsets.only(left: 35.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Send new code',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          TextButton(
            style: flatButtonStyle,
            onPressed: () {
              Navigator.of(context).pushNamed(
                  '/recovery_password/enter_code_password/change_password');
            },
            child: Text(
              'Confirm',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          )
        ],
      ),
    ); //Scaffold
  }
}
