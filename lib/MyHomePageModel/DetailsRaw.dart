import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'RawContent.dart';
import 'Container.dart';

class DetailsRaw extends StatelessWidget {
  DetailsRaw({
    required this.img1,
    required this.img2,
    required this.txt1,
    required this.txt2,
    required this.text1,
    required this.text2,
  });

  var img1;
  var img2;
  var txt1;
  var txt2;
  var text1;
  var text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BodyContainer(
          wid: 170,
          hei: 80,
          gradient: c2,
          blurRadius: 10,
          ofset: Offset(0.0, 0.0),
          borderRadius: 15.0,
          child: RawContent(imag: img1, text1: txt1, text2: text1),
        ),
        BodyContainer(
          wid: 170,
          hei: 80,
          gradient: c2,
          blurRadius: 10,
          ofset: Offset(0.0, 0.0),
          borderRadius: 15.0,
          child: RawContent(imag: img2, text1: txt2, text2: text2),
        ),
      ],
    );
  }
}
