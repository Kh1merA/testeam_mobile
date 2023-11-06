import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:testeam_mobile_application/pages/user_page/view/view.dart';
import 'package:testeam_mobile_application/pages/user_page/widgets/profile_row.dart';
import 'package:testeam_mobile_application/theme/theme.dart';
import 'package:testeam_mobile_application/connections/connection.dart';

class user_page extends StatelessWidget {
  User userData;
  user_page({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.background.withOpacity(0.8),
        surfaceTintColor: Colors.transparent,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
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
                  profileRow(
                      inputIcon: Icon(Icons.man), inputText: userData.name),
                  const Divider(
                    color: Colors.black,
                  ),
                  profileRow(
                      inputIcon: Icon(Icons.email), inputText: userData.email),
                  const Divider(
                    color: Colors.black,
                  ),
                  profileRow(
                      inputIcon: Icon(Icons.phone_android),
                      inputText: userData.phone),
                  const Divider(
                    color: Colors.black,
                  ),
                  profileRow(
                      inputIcon: Icon(Icons.domain),
                      inputText: userData.companyName),
                  const Divider(
                    color: Colors.black,
                  ),
                  profileRow(
                      inputIcon: Icon(Icons.account_box),
                      inputText: userData.position),
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  edit_profile(userData: userData)));
                    },
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
