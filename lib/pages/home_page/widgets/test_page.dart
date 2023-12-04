import 'package:flutter/material.dart';
import 'package:testeam_mobile_application/pages/home_page/widgets/test_container.dart';
import 'package:testeam_mobile_application/theme/theme.dart';

class test_page extends StatelessWidget {
  const test_page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            'List of Tests',
            style: textQuizTitlePage,
          ),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              child: test_container()),
        ],
      ),
    );
  }
}
