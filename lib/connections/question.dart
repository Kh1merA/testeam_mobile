import 'package:http/http.dart' as http;
import 'dart:convert';

class Question {
  int id;
  String title;
  String type;
  int quiz_id;
  List answers;

  Question({
    required this.id,
    required this.title,
    required this.quiz_id,
    required this.type,
    required this.answers,
  });
}
