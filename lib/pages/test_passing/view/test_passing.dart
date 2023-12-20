import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testeam_mobile_application/connections/question.dart';
import 'package:testeam_mobile_application/connections/quizPassing.dart';
import 'package:testeam_mobile_application/pages/loading_page/loading.dart';
import 'package:testeam_mobile_application/pages/test_passing/view/test_result.dart';
import 'package:testeam_mobile_application/theme/theme.dart';

enum LoadingStatus {
  loading,
  loaded,
}

LoadingStatus _loadingStatus = LoadingStatus.loading;

class test_passing extends StatefulWidget {
  final int quiz_id;

  test_passing({Key? key, required this.quiz_id}) : super(key: key);

  @override
  _test_passingState createState() => _test_passingState();
}

class _test_passingState extends State<test_passing> {
  late QuizPassing quizPassing;
  late String userToken;
  int index = 0;
  int result = 0;
  int temp = 0;
  final GlobalKey<_AnswerState> answerWidgetKey = GlobalKey<_AnswerState>();

  void _updateQuestionInfo() {
    if (quizPassing.questions.isEmpty) {
      print('No questions in the quiz');
      return;
    }

    if (index < quizPassing.questions.length - 1) {
      index += 1;
      answerWidgetKey.currentState?.updateQuestion(quizPassing.questions[index]);
      temp = 0;
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => test_result(result: result, test_lenght: quizPassing.questions.length, testTitle: quizPassing.title, test_id: widget.quiz_id),
        ),
      );
    }
    print('Index after update: $index');
    print('Update method called');
    print('Question: ${quizPassing.questions[index]}');

    setState(() {});
  }

  @override
  void initState() {
    _loadingStatus = LoadingStatus.loading;
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
      tags: [],
    );
    _initializeState();
  }

  _initializeState() async {
    await _loadToken();
    print('Token: $userToken');
    String quizID = widget.quiz_id.toString();
    print('Token: $quizID');
    await quizPassing.getQuizInfo(userToken, quizID);
    print(quizPassing);
    _loadingStatus = LoadingStatus.loaded;
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
  if (_loadingStatus == LoadingStatus.loading) {
    return Loading();
  } else {
    return _buildQuizListWidget();
  }
}

Widget _buildQuizListWidget() {
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
            child: Answer(questionInfo: quizPassing.questions[index], key: answerWidgetKey, onAnswerChecked: (bool isRight) {
      if(isRight) {
        temp = 1;
      } else {
        temp = 0;
      }
    },),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            style: flatButtonStyle,
            onPressed: () {
              if(temp == 1) result += 1;
              if (answerWidgetKey.currentState?.selectedAnswerIndex != null) {
      _updateQuestionInfo();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an answer before proceeding.')),
      );
    }
              print(result);
            },
            child: Text('Next question', style: quizButtonText),
          )
        ],
      ),
    );
  }
}

typedef OnAnswerCheckCallback = void Function(bool isRight);
class Answer extends StatefulWidget {
  final Map<String, dynamic> questionInfo;
  final OnAnswerCheckCallback? onAnswerChecked;

  Answer({Key? key, required this.questionInfo,this.onAnswerChecked}) : super(key: key);

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  late Question question;
  int? selectedAnswerIndex;
  bool isRight = false;

  @override
  void initState() {
    super.initState();
    selectedAnswerIndex = null;
    _initializeQuestionInfo();
  }

  void _initializeQuestionInfo() {
    question = Question(
      id: widget.questionInfo['id'],
      title: widget.questionInfo['title'],
      quiz_id: widget.questionInfo['quiz_id'],
      type: widget.questionInfo['type'],
      answers: widget.questionInfo['answers'],
    );
    selectedAnswerIndex = null;
    print('Initialize Question Info: ${question.title}');
  }

  void updateQuestion(Map<String, dynamic> newQuestionInfo) {
    setState(() {
      question = Question(
        id: newQuestionInfo['id'],
        title: newQuestionInfo['title'],
        quiz_id: newQuestionInfo['quiz_id'],
        type: newQuestionInfo['type'],
        answers: newQuestionInfo['answers'],
      );
      selectedAnswerIndex = null;
    });
    selectedAnswerIndex = null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(73, 66, 228, 1),
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
        child: Column(
          children: [
            Text(
              question.title,
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(73, 66, 228, 1),
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: question.answers.isNotEmpty
                  ? List.generate(
                      question.answers.length,
                      (index) {
                        return RadioListTile(
                          title: Text(question.answers[index]["title"]),
                          value: index,
                          groupValue: selectedAnswerIndex,
                          onChanged: (value) {
                            setState(() {
                              selectedAnswerIndex = value as int;
                              widget.onAnswerChecked?.call(question.answers[index]["is_correct"]);
                              print(question.answers[index]["is_correct"]);
                            });
                          },
                        );
                      },
                    )
                  : [Text('No answers available')],
            ),
          ],
        ),
      ),
    );
  }
}
