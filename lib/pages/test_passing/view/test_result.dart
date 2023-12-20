import 'dart:convert';
import 'dart:ui';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testeam_mobile_application/connections/company.dart';
import 'package:testeam_mobile_application/pages/home_page/view/home_page.dart';
import 'package:testeam_mobile_application/pages/home_page/widgets/test_page.dart';
import 'package:testeam_mobile_application/theme/theme.dart';

class test_result extends StatefulWidget {
  int result;
  int test_lenght;
  String testTitle;
  int test_id;
  test_result({Key? key, required this.result, required this.test_lenght, required this.testTitle, required this.test_id}) : super(key: key);

  @override
  _TestResultState createState() => _TestResultState();
}

  class _TestResultState extends State<test_result> {

  String testStatus = 'FAILED'; 
  String showRes = '';
  String allQuestion = '';
  String testName = '';
  String successPercent = '';
  double percent = 0;

  @override
  void initState() {
    super.initState();
    _saveResult(widget.test_id);

    showRes = widget.result.toString();
    allQuestion = widget.test_lenght.toString();
    testName = widget.testTitle.toString();
    percent = (widget.result/widget.test_lenght)*100;
    successPercent = ((widget.result/widget.test_lenght)*100).toString();
    
    if(percent >= 50) {
      testStatus = 'PASSED';
    } else {
      testStatus = 'FAILED';
    }
  }

  Color getStatusColor() {
    if (testStatus == 'PASSED') {
      return Color.fromARGB(255, 80, 242, 174); // Green color for PASSED
    } else {
      return Colors.red; // Red color for FAILED
    }
  }

  _saveResult(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(id.toString(), 'true');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        backgroundColor:
            Theme.of(context).colorScheme.background.withOpacity(0.8),
        surfaceTintColor: Colors.transparent,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Center the content vertically
            children: [
              SizedBox(
                height: 70,
              ),
              Text(
                "Test Result $testName",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '$showRes/$allQuestion points ($successPercent%)',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 73, 66, 228),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 130,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 73, 66, 228),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
                        children: [
                          Text(
                            'Status:',
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Text(
                            testStatus,
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: getStatusColor(),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Test Date:',
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '03/12/2023',
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
                Container(
                  width: 300, // Set the width as per your requirement
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10), // Add spacing between "NOTICE:" and the following text
                      Expanded(
                        child: Text(
                          'NOTICE: test results available to review till 15/12/2024 23:59',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}