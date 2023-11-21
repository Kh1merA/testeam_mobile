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

  @override
  void initState() {
    super.initState();
    companyData = Company(
        title: 'Default',
        ownerEmail: 'Default',
        ownerPhone: '1234567890',
        ownerName: 'Default',
        users: [
          {"id": 1, "name": "Default", "role": "Man with default face"}
        ]);
    _loadCompany();
  }

  _loadCompany() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? companyString = prefs.getString('company');
    print('User String: $companyString');
    if (companyString != null && companyString.isNotEmpty) {
      setState(() {
        companyData = Company.fromJson(json.decode(companyString));
      });
    } else {
      setState(() {
        companyData = Company(
            title: 'Default',
            ownerEmail: 'Default',
            ownerPhone: '1234567890',
            ownerName: 'Default',
            users: [
              {"id": 1, "name": "Default", "role": "Man with default face"}
            ]);
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
              width: 400, // Змініть ширину на весь доступний простір
              height: 82,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      companyData.title,
                      style: companyNameTextStyle,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.person),
                        Text(companyData.users.length.toString(),
                            style: companyAmountWorkersTextStyle)
                      ],
                    ),
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
              width: 400, // Змініть ширину на весь доступний простір
              height: 121,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(225, 225, 225, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        'Owner Name: ',
                        style: textCompanyTextStyle,
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        companyData.ownerName,
                        style: textCompanyItemsStyle,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Owner Email: ',
                        style: textCompanyTextStyle,
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        companyData.ownerEmail,
                        style: textCompanyItemsStyle,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Owner Phone: ',
                        style: textCompanyTextStyle,
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        companyData.ownerPhone,
                        style: textCompanyItemsStyle,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 167,
                      height: 25,
                      child: TextField(
                        style: textSearchFieldStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: DropDownTextField(
                      textStyle: customDropDownTextStyle,
                      textFieldDecoration:
                          customDropDownInputDecoration.copyWith(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 110, vertical: 25)),
                      dropDownList: const [
                        DropDownValueModel(name: 'Admin', value: "Admin"),
                        DropDownValueModel(name: 'Tester', value: "Tester"),
                        DropDownValueModel(name: 'Employee', value: "Employee"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
