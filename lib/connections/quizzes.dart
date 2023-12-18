import 'package:http/http.dart' as http;
import 'dart:convert';

class Quizzes {
  List quizzes;

  Quizzes({required this.quizzes});

  Future<void> getQuizInfoForMe(String token, String companyID) async {
    String apiUrl =
        'http://ec2-3-68-94-147.eu-central-1.compute.amazonaws.com:8000/companies/$companyID/quizzes';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List responseData = jsonDecode(response.body);
      quizzes = responseData;
      print(quizzes);
    } else {
      throw response.statusCode;
    }
  }
}
