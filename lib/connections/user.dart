import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  String name;
  String email;
  String phone;
  String companyName;
  String position;
  String token;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.companyName,
    required this.position,
    required this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': name,
      'email': email,
      'phone_number': phone,
      'title': companyName,
      'position': position,
      'token': token,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['username'],
      email: json['email'],
      phone: json['phone_number'],
      companyName: json['title'],
      position: json['position'],
      token: json['token'],
    );
  }

  Future<void> getUserInfo(String token) async {
    const apiUrl =
        'http://ec2-3-68-94-147.eu-central-1.compute.amazonaws.com:8000/profile/';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      name = responseData['name'];
      email = responseData['email'];
      phone = responseData['phone_number'];
      final company = responseData['companies'][0];
      companyName = company['title'];
      position = company['role'];
      // companyName = 'Valorant';
      // position = 'Healer';
    } else {
      throw Exception('Failed to load user info');
    }
  }
}
