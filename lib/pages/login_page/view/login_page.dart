import 'package:flutter/material.dart';
import 'package:testeam_mobile_application/theme/theme.dart';

class login_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 132,
          ),
          Container(
            child: Center(
              child: Text(
                'Login',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          SizedBox(
            height: 56,
          ),
          inputLabel(
            inputIcon: Icons.email,
            inputText: 'Email',
          ),
          SizedBox(
            height: 20,
          ),
          inputLabel(
            inputIcon: Icons.lock,
            inputText: 'Password',
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 35.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot your password?',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
          SizedBox(
            height: 74,
          ),
          Container(
            height: 50,
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Color.fromRGBO(73, 66, 228, 1),
            ),
            child: Center(
                child: Text(
              'Confirm',
              style: Theme.of(context).textTheme.labelLarge,
            )),
          )
        ],
      ), //Stack
    ); //Scaffold
  }
}

class inputLabel extends StatelessWidget {
  final inputIcon;
  final inputText;

  inputLabel({super.key, required this.inputIcon, required this.inputText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 40,
      child: Center(
          child: // Note: Same code is applied for the TextFormField as well
              Material(
        elevation: 6,
        shadowColor: Colors.black,
        borderRadius: BorderRadius.circular(28),
        child: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(inputIcon),
            hintText: inputText,
            hintStyle: Theme.of(context).textTheme.titleSmall,
            contentPadding: EdgeInsets.symmetric(vertical: 12.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1, color: Color.fromRGBO(173, 173, 173, 0.3)),
              borderRadius: BorderRadius.circular(28),
            ),
          ),
        ),
      )),
    );
  }
}
