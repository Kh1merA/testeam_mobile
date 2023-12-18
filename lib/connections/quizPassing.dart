import 'package:http/http.dart' as http;
import 'dart:convert';

class QuizPassing {
  String title;
  String description;
  int completion_time;
  String start_time;
  String start_date;
  String end_time;
  String end_date;
  int company_id;
  List questions;
  List tags;

  QuizPassing({
    required this.title,
    required this.description,
    required this.completion_time,
    required this.company_id,
    required this.questions,
    required this.start_time,
    required this.start_date,
    required this.end_time,
    required this.end_date,
    required this.tags,
  });

  Future<void> getQuizInfo(String token, String quizID) async {
    String apiUrl =
        'http://ec2-3-68-94-147.eu-central-1.compute.amazonaws.com:8000/quizzes/$quizID';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      title = responseData['title'];
      description = responseData['description'];
      completion_time = responseData['completion_time'];
      start_time = responseData['start_time'];
      start_date = responseData['start_date'];
      end_time = responseData['end_time'];
      end_date = responseData['end_date'];
      company_id = responseData['company_id'];
      questions = responseData['questions'];
      tags = responseData['tags'];
    } else {
      throw response.statusCode;
    }
  }
}
