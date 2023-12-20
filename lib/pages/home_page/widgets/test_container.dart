import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testeam_mobile_application/connections/quiz.dart';
import 'package:testeam_mobile_application/connections/quizzes.dart';
import 'package:testeam_mobile_application/pages/home_page/widgets/tag_box.dart';
import 'package:testeam_mobile_application/pages/test_passing/view/test_passing.dart';
import 'package:testeam_mobile_application/theme/theme.dart';


class test_container extends StatefulWidget {
  Map<String, dynamic> quizInfo;
  
  test_container({Key? key, required this.quizInfo}) : super(key: key);

  @override
  State<test_container> createState() => _test_containerState();
}
class _test_containerState extends State<test_container> {
  
  late Quiz quizInfo;
  @override
  void initState() {
    super.initState();
    _initializeQuizInfo();
  }

  void _initializeQuizInfo() {
    quizInfo = Quiz(
      id: widget.quizInfo['id'],
      title: widget.quizInfo['title'],
      start_date: widget.quizInfo['start_date'],
      end_date: widget.quizInfo['end_date'],
      start_time: widget.quizInfo['start_time'],
      end_time: widget.quizInfo['end_time'],
      tags: widget.quizInfo['tags'] ?? [],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromRGBO(73, 66, 228, 1),
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Column(
              children: [
                Text(
                  quizInfo.title,
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(73, 66, 228, 1),
                      fontSize: 25),
                ),
                Row(
                  children: [
                    Text('Start date:', style: textQuizTextTitle),
                    SizedBox(width: 10),
                    Text(quizInfo.start_date, style: textQuizText)
                  ],
                ),
                Row(
                  children: [
                    Text('End date:', style: textQuizTextTitle),
                    SizedBox(width: 10),
                    Text(quizInfo.end_date, style: textQuizText)
                  ],
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...',
                  style: textQuizTextDesc,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: Row(
                    children: [TagBox(tagText: quizInfo.tags[0]['title'])],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  style: flatButtonStyle,
                  onPressed: () {Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => test_passing(quiz_id: quizInfo.id),
      ),
    );},
                  child: Text('Start test', style: quizButtonText),
                )
              ],
            ),
          ),
        ),
        SizedBox(
              height: 20,
            )
      ],
    );
  }
}
