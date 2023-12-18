import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testeam_mobile_application/connections/connection.dart';
import 'package:testeam_mobile_application/connections/quizPassing.dart';
import 'package:testeam_mobile_application/pages/test_passing/widgets/answer.dart';
import 'package:testeam_mobile_application/theme/theme.dart';
import 'package:testeam_mobile_application/pages/login_page/widgets/input_label.dart';

class test_passing extends StatefulWidget {
  int quiz_id;
  test_passing({super.key, required this.quiz_id});

  @override
  _test_passingState createState() => _test_passingState();
}

class _test_passingState extends State<test_passing> {
  late QuizPassing quizPassing;
  late String userToken;
  int index = 0;

  @override
  void initState() {
    super.initState();
    userToken = '';
    quizPassing = QuizPassing(
        title: 'title',
        description: 'description',
        completion_time: 0,
        company_id: 0,
        questions: [],
        start_time: '',
        start_date: '',
        end_time: '',
        end_date: '',
        tags: []);
    _initializeState();
    setState(() {});
  }

  _initializeState() async {
    await _loadToken();
    print('Token: $userToken');
    String quizID = widget.quiz_id.toString();
    print('Token: $quizID');
    await quizPassing.getQuizInfo(userToken, quizID);
    print(quizPassing);
    setState(() {});
  }

  _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString('token');
    print('User String: $userString');
    if (userString != null && userString.isNotEmpty) {
      setState(() {
        userToken = userString;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            quizPassing.title,
            style: textQuizTitlePage,
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: answer(questionInfo: quizPassing.questions[index])),
          SizedBox(
            height: 20,
          ),
          TextButton(
            style: flatButtonStyle,
            onPressed: () {
              setState(() {
                index += 1;
              });
            },
            child: Text('Next question', style: quizButtonText),
          )
        ],
      ),
    );
  }
}
