import 'package:flutter/material.dart';
import 'package:testeam_mobile_application/pages/login_page/widgets/input_label.dart';
import 'package:testeam_mobile_application/theme/theme.dart';

class change_password extends StatelessWidget {
  const change_password({super.key});

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
                'At least 8 characters, 1 uppercase, numbers and special characters',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const inputLabel(
            inputIcon: Icons.lock,
            inputText: 'New password',
          ),
          const SizedBox(
            height: 14,
          ),
          const inputLabel(
            inputIcon: Icons.lock,
            inputText: 'Confirm password',
          ),
          const SizedBox(
            height: 40,
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
          )
        ],
      ),
    ); //Scaffold
  }
}
