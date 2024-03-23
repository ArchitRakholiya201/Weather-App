import 'package:flutter/material.dart';

class RawContent extends StatelessWidget {
  RawContent({required this.imag, required this.text1, required this.text2});

  var imag;
  var text1;
  var text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(2),
        ),
        Image(
          image: AssetImage(imag),
          width: 60.0,
          height: 60.0,
        ),
        Padding(
          padding: EdgeInsets.all(2),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
          ],
        )
      ],
    );
  }
}
