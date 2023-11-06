import 'package:flutter/material.dart';
import 'package:testeam_mobile_application/pages/login_page/widgets/input_label.dart';
import 'package:testeam_mobile_application/theme/theme.dart';

class recovery_password extends StatelessWidget {
  const recovery_password({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    final ValueNotifier<String> requestStatusNotifier =
        ValueNotifier<String>('');
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
                'Enter the email and we\'ll send you a verification code to reset your password',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          inputLabel(
              inputIcon: Icons.email,
              inputText: 'Email',
              controller: _controller,
              requestStatusNotifier: requestStatusNotifier,
              isPassword: false),
          const SizedBox(
            height: 70,
          ),
          TextButton(
            style: flatButtonStyle,
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/recovery_password/enter_code_password');
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
