import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testeam_mobile_application/connections/question.dart';
import 'package:testeam_mobile_application/connections/quiz.dart';
import 'package:testeam_mobile_application/connections/quizzes.dart';
import 'package:testeam_mobile_application/pages/home_page/widgets/tag_box.dart';
import 'package:testeam_mobile_application/pages/test_passing/view/test_passing.dart';
import 'package:testeam_mobile_application/theme/theme.dart';

class single_answer extends StatefulWidget {
  Map<String, dynamic> questionInfo;
  single_answer({Key? key, required this.questionInfo}) : super(key: key);

  @override
  State<single_answer> createState() => _single_answerState();
}

class _single_answerState extends State<single_answer> {
  late Question question;

  @override
  void initState() {
    super.initState();
    _initializeQuestionInfo();
  }

  void _initializeQuestionInfo() {
    question = Question(
        id: widget.questionInfo['id'],
        title: widget.questionInfo['title'],
        quiz_id: widget.questionInfo['quiz_id'],
        type: widget.questionInfo['type'],
        answers: widget.questionInfo['answers']);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(73, 66, 228, 1),
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
            child: Column(children: [
              Text(
                question.title,
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(73, 66, 228, 1),
                    fontSize: 25),
              ),
            ])));
  }
}
