import 'package:flutter/material.dart';

class ContainerBg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 0.52,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff487ada),
                Color(0xff9ccfed),
              ],
            ),
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0.0, 3.0),
                blurRadius: 20.0,
              ),
            ]),
      ),
    );
  }
}
