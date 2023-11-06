import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth {
  final String email;
  final String password;

  Auth({required this.email, required this.password});

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(email: json['email'], password: json['password']);
  }
}

class AuthRequest {
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
