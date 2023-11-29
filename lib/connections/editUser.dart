import 'package:http/http.dart' as http;
import 'dart:convert';

class editUser {
  String name;
  String phone;

  editUser({required this.name, required this.phone});

  Future<String?> editUserFunc(token) async {
    const apiUrl =
        'http://ec2-3-68-94-147.eu-central-1.compute.amazonaws.com:8000/profile/edit/';

    try {
      final response = await http.patch(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'phone_number': phone,
      }),
    );

    if (response.statusCode == 200) {
      throw response.statusCode;
    } else {
      throw response.statusCode;
    }
    } catch (e) {
      print(e);
    }

    
  }
}
