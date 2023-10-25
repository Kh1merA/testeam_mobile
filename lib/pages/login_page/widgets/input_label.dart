import 'package:flutter/material.dart';

class inputLabel extends StatelessWidget {
  final inputIcon;
  final inputText;

  const inputLabel(
      {super.key, required this.inputIcon, required this.inputText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: Color.fromRGBO(173, 173, 173, 0.3)),
              borderRadius: BorderRadius.circular(28),
            ),
          ),
        ),
      )),
    );
  }
}
