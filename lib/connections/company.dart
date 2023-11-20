import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Company {
  String title;
  String ownerName;
  String ownerEmail;
  String ownerPhone;
  List users;

  Company(
      {required this.title,
      required this.ownerName,
      required this.ownerEmail,
      required this.ownerPhone,
      required this.users});

  void getUserInfo(token) async {
    const apiUrl =
        'http://ec2-3-68-94-147.eu-central-1.compute.amazonaws.com:8000/companies/13';

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
      ownerEmail = responseData['owner_email'];
      ownerPhone = responseData['owner_phone'];
      // companyName = responseData['companies']['title'];
      // position = responseData['companies']['role'];
      ownerName = responseData['owner_name'];
      users = [
        {"id": 0, "name": "Sage", "role": "Healer"},
        {"id": 1, "name": "Omen", "role": "Smoker"},
        {"id": 2, "name": "Reyna", "role": "Openfragger"},
        {"id": 3, "name": "Iso", "role": "Man with default face"}
      ];
    } else {
      throw response.statusCode;
    }
  }
}
