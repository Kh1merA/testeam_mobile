import 'package:flutter/material.dart';
import 'package:testeam_mobile_application/pages/user_page/widgets/input_profile.dart';
import 'package:testeam_mobile_application/pages/user_page/widgets/profile_row.dart';
import 'package:testeam_mobile_application/theme/theme.dart';
import 'package:testeam_mobile_application/pages/login_page/widgets/input_label.dart';

class edit_user_password extends StatelessWidget {
  const edit_user_password({super.key});

  @override
  Widget build(BuildContext context) {
    late TextEditingController _naPohui = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            child: const Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(children: [
                Row(
                  children: [Icon(Icons.arrow_back_ios), Text('Back')],
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              'Change Password',
              style: profileTitleText,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Type current password',
                            style: textTitle,
                          )
                        ],
                      )),
                  inputProfile(
                    controller: _naPohui,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Type a new password',
                            style: textTitle,
                          )
                        ],
                      )),
                  inputProfile(
                    controller: _naPohui,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Retype new password',
                            style: textTitle,
                          )
                        ],
                      )),
                  inputProfile(
                    controller: _naPohui,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Password requirements:',
                            style: editUserPasswordStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '- At least 8 characters long',
                            style: editUserPasswordStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 320,
                            child: Text(
                              '- Characters from 3 different groups (lowercase,uppercase, numbers, symbols)',
                              style: editUserPasswordStyle,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        style: flatButtonStyle,
                        onPressed: () {},
                        child: Text(
                          'Confirm',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ],
                  )
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
