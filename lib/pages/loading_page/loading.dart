import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: null,
                children: <TextSpan>[
                  TextSpan(
                    text: 'tesT',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(
                          255, 73, 66, 228), // Цвет части текста "tes"
                    ),
                  ),
                  TextSpan(
                    text: 'eam',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0), // Пространство между текстом и спиннером
            SpinKitWaveSpinner(
              color: Color.fromARGB(255, 80, 242, 174),
              size: 100.0,
              waveColor: Color.fromARGB(255, 73, 66, 228),
              trackColor: Color.fromARGB(255, 73, 66, 228),
            ),
          ],
        ),
      ),
    );
  }
}
