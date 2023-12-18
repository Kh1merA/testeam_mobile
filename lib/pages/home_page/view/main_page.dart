import 'dart:convert';
import 'dart:ui';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testeam_mobile_application/connections/company.dart';
import 'package:testeam_mobile_application/pages/home_page/view/home_page.dart';
import 'package:testeam_mobile_application/pages/home_page/widgets/test_page.dart';
import 'package:testeam_mobile_application/theme/theme.dart';

class main_page extends StatefulWidget {
  const main_page({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<main_page> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 130,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(255, 73, 66, 228),
              ),
              width: 350,
              height: 145,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Take tests and unlock your potential!',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                          },
                          child: Text(
                            'Go to Tests',
                            style: mainPageGoToTest, // Предполагается, что mainPageGoToTest определен где-то в вашем коде
                          ),
                          style: greenMainPageButton, // Предполагается, что greenMainPageButton определен где-то в вашем коде
                        ),
                      ],
                    ),
                  ),
                  Image.asset('assets/images/Group.png'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 152, 149, 209),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0)
              ),
              width: 350,
              height: 175,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 160,
                          child: Text('Track Your Test Stats for Optimal Results!', style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),),
                        ),
                        SizedBox(width: 5,),
                        Image.asset('assets/images/graphics.jpg')
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: null,
                    child: 
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'View Statistics',
                        style: TextStyle(
                          fontFamily: "OpenSans", 
                          fontSize: 12, 
                          fontWeight: FontWeight.bold, 
                          color: Colors.white
                        )
                      ),
                    ),
                    style: blackMainPageButton,
                  ),
                ]
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              height: 270,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 152, 149, 209),
                  width: 1.0,
                ),
                color: Color.fromARGB(255, 228, 226, 254),
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('About Us',
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 76, 14, 151)
                      ),
                    ),
                    Text(
                      'Code Crafters is a dynamic IT company dedicated to crafting cutting-edge solutions for clients\' evolving needs. Committed to excellence, we are your trusted partner for transformative software development.',
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 12,
                        color: Colors.black
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset('assets/images/people.jpg',
                    width: 190.0,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
