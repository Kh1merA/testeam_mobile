import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  String name;
  String email;
  String phone;
  String companyName;
  String position;
  String token;

  User(
      {required this.name,
      required this.email,
      required this.phone,
      required this.companyName,
      required this.position,
      required this.token});

  void getUserInfo(token) async {
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
      // companyName = responseData['companies']['title'];
      // position = responseData['companies']['role'];
      companyName = 'Valorant';
      position = 'Employee';
    } else {
      throw response.statusCode;
    }
  }
}
