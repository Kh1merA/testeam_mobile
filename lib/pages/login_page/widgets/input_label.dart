import 'package:flutter/material.dart';
import 'package:testeam_mobile_application/theme/theme.dart';

import 'package:flutter/material.dart';

class inputLabel extends StatefulWidget {
  final IconData inputIcon;
  final String inputText;
  final TextEditingController controller;
  final ValueNotifier<String> requestStatusNotifier;

  inputLabel({
    Key? key,
    required this.inputIcon,
    required this.inputText,
    required this.controller,
    required this.requestStatusNotifier,
  }) : super(key: key);

  @override
  _inputLabelState createState() => _inputLabelState();
}

class _inputLabelState extends State<inputLabel> {
  @override
  void initState() {
    super.initState();
    widget.requestStatusNotifier.addListener(_onRequestStatusChange);
  }

  void _onRequestStatusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration decoration;

    switch (widget.requestStatusNotifier.value) {
      case '400':
        decoration = InputDecoration(
          errorStyle: validatorError,
          prefixIcon: Icon(widget.inputIcon),
          hintText: widget.inputText,
          hintStyle: Theme.of(context).textTheme.titleSmall,
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 1, color: Color.fromRGBO(255, 5, 5, 0.5)),
            borderRadius: BorderRadius.circular(28),
          ),
        );
        break;
      case '404':
        decoration = InputDecoration(
          errorStyle: validatorError,
          prefixIcon: Icon(widget.inputIcon),
          hintText: widget.inputText,
          hintStyle: Theme.of(context).textTheme.titleSmall,
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 1, color: Color.fromRGBO(255, 5, 5, 0.5)),
            borderRadius: BorderRadius.circular(28),
          ),
        );
        break;
      case '422':
        decoration = InputDecoration(
            errorStyle: validatorError,
            prefixIcon: Icon(widget.inputIcon),
            hintText: widget.inputText,
            hintStyle: Theme.of(context).textTheme.titleSmall,
            contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: Color.fromRGBO(255, 5, 5, 1)),
              borderRadius: BorderRadius.circular(28),
            ));
        break;
      default:
        decoration = InputDecoration(
            errorStyle: validatorError,
            prefixIcon: Icon(widget.inputIcon),
            hintText: widget.inputText,
            hintStyle: Theme.of(context).textTheme.titleSmall,
            contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: Color.fromRGBO(173, 173, 173, 0.3)),
              borderRadius: BorderRadius.circular(28),
            ));
        break;
    }

    return Column(
      children: [
        SizedBox(
          width: 350,
          height: 40,
          child: Center(
            child: Material(
              elevation: 6,
              shadowColor: Colors.black,
              borderRadius: BorderRadius.circular(28),
              child: TextFormField(
                controller: widget.controller,
                keyboardType: TextInputType.text,
                decoration: decoration,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
