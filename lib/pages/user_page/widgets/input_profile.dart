import 'package:flutter/material.dart';

class inputProfile extends StatelessWidget {
  final inputText;

  inputProfile({super.key, required this.inputText});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textEditingController =
        TextEditingController(text: inputText);
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
          controller: _textEditingController,
          decoration: InputDecoration(
            hintStyle: Theme.of(context).textTheme.titleSmall,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
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
