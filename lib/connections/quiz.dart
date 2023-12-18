import 'package:http/http.dart' as http;
import 'dart:convert';

class Quiz {
  int id;
  String title;
  String start_time;
  String start_date;
  String end_time;
  String end_date;
  List tags;

  Quiz({
    required this.id,
    required this.title,
    required this.start_time,
    required this.start_date,
    required this.end_time,
    required this.end_date,
    required this.tags,
  });
}
