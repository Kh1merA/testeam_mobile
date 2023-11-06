import 'package:http/http.dart' as http;
import 'dart:convert';

class Password {
  final String email;
  final String password;
  final String verificationStatus;

  Password(
      {required this.email,
      required this.password,
      required this.verificationStatus});

  factory Password.fromJson(Map<String, dynamic> json) {
    return Password(
        email: json['email'],
        password: json['password'],
        verificationStatus: json['status']);
  }
}

class PasswordRequest {
  Future<String?> login(String email, String password) async {
    const apiUrl =
        'http://ec2-3-68-94-147.eu-central-1.compute.amazonaws.com:8000/auth/login/';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final String token = responseData['token'];
      return token;
    } else {
      throw response.statusCode;
    }
  }
}
