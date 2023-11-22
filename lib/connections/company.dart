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

  Future<void> getCompanyInfo(String token, String companyID) async {
    String apiUrl =
        'http://ec2-3-68-94-147.eu-central-1.compute.amazonaws.com:8000/companies/$companyID/';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      print(responseData);

      title = responseData['title'];
      ownerEmail = responseData['owner_email'];
      ownerPhone = responseData['owner_phone'];
      ownerName = responseData['owner_name'];
      users = responseData['users'];
    } else {
      throw response.statusCode;
    }
  }
}
