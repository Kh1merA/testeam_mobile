import 'dart:convert';
import 'dart:ui';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testeam_mobile_application/connections/company.dart';
import 'package:testeam_mobile_application/pages/home_page/view/home_page.dart';
import 'package:testeam_mobile_application/theme/theme.dart';

class company_page extends StatefulWidget {
  const company_page({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<company_page> {
  late Company companyData;
  late String userToken;
  

  String? dropDownValue = 'Position';

  @override
  void initState() {
    super.initState();
    userToken = '';
    companyData = Company(
        title: 'Default',
        ownerEmail: 'Default',
        ownerPhone: '1234567890',
        ownerName: 'Default',
        users: [
          {"id": 1, "name": "Default", "role": "Man with default face"},
          {"id": 1, "name": "Zoro", "role": "Man with default face"},
          {"id": 2, "name": "Nami", "role": "Man with default face"}
        ]);
   _initializeState();
  }

  _initializeState() async {
  await _loadToken();
  print('Token: $userToken');
  await companyData.getCompanyInfo(userToken, '13');
  setState(() {
  });
}

  _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString('token');
    print('User String: $userString');
    if (userString != null && userString.isNotEmpty) {
      setState(() {
          userToken = userString;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              width: 350, // Змініть ширину на весь доступний простір
              height: 82,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Text(
                      companyData.title,
                      style: companyNameTextStyle,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.person),
                        Text(companyData.users.length.toString(),
                            style: companyAmountWorkersTextStyle)
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(73, 66, 228, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
            ),
            Container(
              width: 350, // Змініть ширину на весь доступний простір
              height: 121,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(225, 225, 225, 0),
                  border: Border.all(
                   color: Color.fromRGBO(73, 66, 228, 1), width: 2,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        'Owner Name: ',
                        style: textCompanyTextStyle,
                      ),
                      Spacer(),
                      Text(
                        companyData.ownerName,
                        style: textCompanyItemsStyle,
                      )
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        'Owner Email: ',
                        style: textCompanyTextStyle,
                      ),
                      Spacer(),
                      Text(
                        companyData.ownerEmail,
                        style: textCompanyItemsStyle,
                      )
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        'Owner Phone: ',
                        style: textCompanyTextStyle,
                      ),
                      Spacer(),
                      Text(
                        companyData.ownerPhone,
                        style: textCompanyItemsStyle,
                      )
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: Row(
                children: [
                  SizedBox(
                    child: Container(
                      width: 160,
                      height: 40,
                      child:
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 0.5),
                            child: TextField(
                              style: textSearchFieldStyle,
                              decoration: inputSearchDecoration,
                              textAlignVertical: TextAlignVertical.center,
                            ),
                          ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(173, 173, 173, 150),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        underline: SizedBox(),
                        hint: Text(dropDownValue!, style: TextStyle(fontSize: 14, color: Colors.black),), // Це видалить лінію внизу
                        items: [
                          DropdownMenuItem<String>(
                            value: "Admin",
                            child: Text(
                              'Admin',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "Tester",
                            child: Text(
                              'Tester',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "Employee",
                            child: Text(
                              'Employee',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                        onChanged: (String? newValue) {
                          setState(() {
                            dropDownValue = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ),
            Container(
              height: 500,
              child: ListView.separated(
                itemCount: companyData.users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                     title: Text(companyData.users[index]["name"]),
                     trailing: Text(companyData.users[index]["role"]),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}