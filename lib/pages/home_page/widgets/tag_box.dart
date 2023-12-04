import 'package:flutter/material.dart';

class TagBox extends StatelessWidget {
  final String tagText;

  TagBox({
    required this.tagText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Center(
          child: Text(
            tagText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(151, 71, 255, 1),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(80, 242, 175, 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
