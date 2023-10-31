import 'package:flutter/material.dart';
import 'package:testeam_mobile_application/pages/user_page/widgets/profile_row.dart';
import 'package:testeam_mobile_application/theme/theme.dart';

class user_page extends StatelessWidget {
  const user_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 95,
          ),
          Container(
            child: Text(
              'Profile',
              style: profileTitleText,
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const profileRow(
                      inputIcon: Icon(Icons.man), inputText: 'Name'),
                  const Divider(
                    color: Colors.black,
                  ),
                  const profileRow(
                      inputIcon: Icon(Icons.email), inputText: 'Email'),
                  const Divider(
                    color: Colors.black,
                  ),
                  const profileRow(
                      inputIcon: Icon(Icons.phone_android),
                      inputText: 'Phone number'),
                  const Divider(
                    color: Colors.black,
                  ),
                  const profileRow(
                      inputIcon: Icon(Icons.domain), inputText: 'CompanyName'),
                  const Divider(
                    color: Colors.black,
                  ),
                  const profileRow(
                      inputIcon: Icon(Icons.account_box),
                      inputText: 'Position'),
                  const SizedBox(
                    width: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconTheme(
                          data: iconProfileTheme,
                          child: Icon(Icons.compare_arrows)),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Change password',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    style: flatButtonStyle,
                    onPressed: () {},
                    child: Text(
                      'Edit Profile',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //Stack
    ); //Scaffold
  }
}
