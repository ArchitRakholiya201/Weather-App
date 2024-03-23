import 'package:flutter/material.dart';

TextStyle kweather = const TextStyle(
  color: Colors.white,
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

TextStyle kweatherDate = const TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

TextStyle kweatherDay = const TextStyle(
  color: Colors.black87,
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

TextStyle kweatherTime = const TextStyle(
  color: Colors.black87,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

LinearGradient c1 = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xffcadbfb),
    Colors.white,
  ],
  tileMode: TileMode.decal,
);

LinearGradient c2 = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Colors.white,
    Colors.white,
  ],
  tileMode: TileMode.decal,
);
