import 'package:flutter/material.dart';

class BodyContainer extends StatelessWidget {
  var wid;
  var hei;
  var gradient;
  var blurRadius;
  var ofset;
  var borderRadius;
  var child;

  BodyContainer({
    required this.wid,
    required this.hei,
    required this.gradient,
    required this.blurRadius,
    required this.ofset,
    required this.borderRadius,
    required this.child,
  });
  // const BodyContainer({}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: wid.toDouble(),
      height: hei.toDouble(),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: ofset,
            blurRadius: blurRadius.toDouble(),
          ),
        ],
      ),
      child: child,
    );
  }
}
