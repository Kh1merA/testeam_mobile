import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testeam_mobile_application/connections/connection.dart';
import 'package:testeam_mobile_application/pages/user_page/view/user_page.dart';
import 'package:testeam_mobile_application/pages/user_page/widgets/input_profile.dart';
import 'package:testeam_mobile_application/pages/user_page/widgets/profile_row.dart';
import 'package:testeam_mobile_application/theme/theme.dart';
import 'package:testeam_mobile_application/pages/login_page/widgets/input_label.dart';

class edit_profile extends StatefulWidget {
  late User userData;
  edit_profile({super.key});

  _loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userString = prefs.getString('user') ?? "";
    if (userString.isNotEmpty) {
      userData = User.fromJson(json.decode(userString));
    }
  }

  @override
  _editprofileState createState() => _editprofileState();
}

class _editprofileState extends State<edit_profile> {
  editUser edit = new editUser(name: '', phone: '');
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  String _initialValueTextField1 = '';
  String _initialValueTextField2 = '';
  String _initialValueTextField3 = '';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();

    _initialValueTextField1 = widget.userData.name;
    _initialValueTextField2 = widget.userData.email;
    _initialValueTextField3 = widget.userData.phone;

    edit.name = _initialValueTextField1;
    // edit.email = _initialValueTextField2;
    edit.phone = _initialValueTextField3;

    _nameController.text = _initialValueTextField1;
    _emailController.text = _initialValueTextField2;
    _phoneController.text = _initialValueTextField3;
  }

  void checkForChanges() {
    final currentNameTextField = _nameController.text;
    final currentEmailTextField = _emailController.text;
    final currentPhoneTextField = _phoneController.text;

    if (currentNameTextField != _initialValueTextField1) {
      print('TextField 1 был изменен: $currentNameTextField');
      edit.name = currentNameTextField;
      widget.userData.name = currentNameTextField;
    }

    if (currentEmailTextField != _initialValueTextField2) {
      print('TextField 2 был изменен: $currentEmailTextField');
      // edit.email = currentEmailTextField;
      // widget.userData.email = currentNameTextField;
    }

    if (currentPhoneTextField != _initialValueTextField3) {
      print('TextField 3 был изменен: $currentPhoneTextField');
      edit.phone = currentPhoneTextField;
      widget.userData.phone = currentPhoneTextField;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Здесь установите свой собственный маршрут, на который хотите перейти
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => user_page()));
            ;
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
        // shadowColor: Theme.of(context).colorScheme.onBackground,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          Container(
            child: Text(
              'Edit Profile',
              style: profileTitleText,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: textTitle,
                          )
                        ],
                      )),
                  inputProfile(controller: _nameController),
                  const SizedBox(
                    height: 20,
                  ),
                  // Padding(
                  //     padding: EdgeInsets.only(left: 20, bottom: 6),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           'Email',
                  //           style: textTitle,
                  //         )
                  //       ],
                  //     )),
                  // inputProfile(
                  //   controller: _emailController,
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Phone number',
                            style: textTitle,
                          )
                        ],
                      )),
                  inputProfile(
                    controller: _phoneController,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      TextButton(
                        style: blackFlatButtonStyle,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => user_page()));
                        },
                        child: Text(
                          'Cancel',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      SizedBox(width: 30),
                      TextButton(
                        style: flatButtonStyle,
                        onPressed: () {
                          checkForChanges();
                          edit.editUserFunc(widget.userData.token);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => user_page()));
                        },
                        child: Text(
                          'Save',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      //Stack
    ); //Scaffold
  }
}
