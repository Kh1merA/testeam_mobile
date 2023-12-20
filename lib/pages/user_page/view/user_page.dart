import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testeam_mobile_application/pages/home_page/view/home_page.dart';
import 'package:testeam_mobile_application/pages/user_page/view/view.dart';
import 'package:testeam_mobile_application/pages/user_page/widgets/profile_row.dart';
import 'package:testeam_mobile_application/theme/theme.dart';
import 'package:testeam_mobile_application/connections/connection.dart';

class user_page extends StatefulWidget {
  const user_page({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<user_page> {
  late User userData;

  @override
  void initState() {
    super.initState();
    userData = User(
      name: 'Default Name',
      email: 'default@email.com',
      phone: '123456789',
      companyName: 'Default Company',
      position: 'Default Position',
      token: 'default_token',
    );
    _loadUser();
  }

  _loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString('user');
    print('User String: $userString');
    if (userString != null && userString.isNotEmpty) {
      setState(() {
        userData = User.fromJson(json.decode(userString));
      });
    } else {
      setState(() {
        userData = User(
          name: 'Default Name',
          email: 'default@email.com',
          phone: '123456789',
          companyName: 'Default Company',
          position: 'Default Position',
          token: 'default_token',
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed('/home_page');
          },
        ),
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
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/company_page');
                      },
                      child: profileRow(
                          inputIcon: Icon(Icons.domain),
                          inputText: userData.companyName),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  profileRow(
                      inputIcon: Icon(Icons.account_box),
                      inputText: userData.position),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    style: flatButtonStyle,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => edit_profile()));
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
    );
  }
}
