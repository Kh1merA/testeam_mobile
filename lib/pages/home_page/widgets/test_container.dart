import 'package:flutter/material.dart';
import 'package:testeam_mobile_application/pages/home_page/widgets/tag_box.dart';
import 'package:testeam_mobile_application/theme/theme.dart';

class test_container extends StatelessWidget {
  test_container({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(73, 66, 228, 1),
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Column(
          children: [
            Text(
              'Test title',
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(73, 66, 228, 1),
                  fontSize: 25),
            ),
            Row(
              children: [
                Text('Start date:', style: textQuizTextTitle),
                SizedBox(width: 10),
                Text('Tuesday, 21.11.2023, 10:00', style: textQuizText)
              ],
            ),
            Row(
              children: [
                Text('End date:', style: textQuizTextTitle),
                SizedBox(width: 10),
                Text('Tuesday, 21.11.2023, 10:00', style: textQuizText)
              ],
            ),
            Row(
              children: [
                Text(
                  'Time Limit:',
                  style: textQuizTextTitle,
                ),
                SizedBox(width: 10),
                Text('30m', style: textQuizText)
              ],
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...',
              style: textQuizTextDesc,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 300,
              height: 50,
              child: Row(
                children: [TagBox(tagText: 'Front-end')],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              style: flatButtonStyle,
              onPressed: () {},
              child: Text('Start test', style: quizButtonText),
            )
          ],
        ),
      ),
    );
  }
}
