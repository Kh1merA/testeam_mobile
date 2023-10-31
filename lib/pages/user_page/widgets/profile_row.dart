import 'package:flutter/material.dart';
import 'package:testeam_mobile_application/theme/theme.dart';

class profileRow extends StatelessWidget {
  final inputIcon;
  final inputText;

  const profileRow(
      {super.key, required this.inputIcon, required this.inputText});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        IconTheme(data: iconProfileTheme, child: inputIcon),
        const SizedBox(
          width: 15,
        ),
        Text(
          inputText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    ));
  }
}
