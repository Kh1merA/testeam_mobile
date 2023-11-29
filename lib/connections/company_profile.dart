import 'package:http/http.dart' as http;
import 'dart:convert';

class CompanyProfile {
 int companyId;
 String title;
 String role;

  CompanyProfile({
    required this.companyId,
    required this.title,
    required this.role
  });

  Future<void> getCompanyInfo(String token) async {
    const apiUrl =
        'http://ec2-3-68-94-147.eu-central-1.compute.amazonaws.com:8000/profile/companies/';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body)[0];

      companyId = responseData['id'];
      title = responseData['title'];
      role = responseData['role'];
    } else {
      throw Exception('Failed to get company info');
    }
  }
}
