import 'package:flutter/material.dart';
import 'package:testeam_mobile_application/pages/user_page/widgets/input_profile.dart';
import 'package:testeam_mobile_application/pages/user_page/widgets/profile_row.dart';
import 'package:testeam_mobile_application/theme/theme.dart';
import 'package:testeam_mobile_application/pages/login_page/widgets/input_label.dart';

class edit_profile extends StatelessWidget {
  const edit_profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 85,
          ),
          Container(
            child: Text(
              'Edit Profile',
              style: profileTitleText,
            ),
          ),
          const SizedBox(
            height: 16,
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
                            'First name',
                            style: textTitle,
                          )
                        ],
                      )),
                  inputProfile(inputText: 'Olena'),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'First name',
                            style: textTitle,
                          )
                        ],
                      )),
                  inputProfile(inputText: 'Pavlenko'),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Last name',
                            style: textTitle,
                          )
                        ],
                      )),
                  inputProfile(inputText: 'olena.pavlenko@gmail.com'),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: textTitle,
                          )
                        ],
                      )),
                  inputProfile(inputText: '+380675324368'),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      TextButton(
                        style: blackFlatButtonStyle,
                        onPressed: () {},
                        child: Text(
                          'Cancel',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      SizedBox(width: 30),
                      TextButton(
                        style: flatButtonStyle,
                        onPressed: () {},
                        child: Text(
                          'Save',
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
