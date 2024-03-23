import 'package:flutter/material.dart';

class ColumnContent extends StatelessWidget {
  ColumnContent({
    required this.time,
    required this.imag,
    required this.temp,
  });

  var imag;
  var time;
  var temp;

//   @override
//   Widget build(BuildContext context) {
//     return Image(
//   image: AssetImage(imag),
//   width: 50,
//   height: 50,
// );
//   }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          time,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Image(
          image: AssetImage(imag),
          width: 50,
          height: 50,
        ),
        Text(
          temp,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
