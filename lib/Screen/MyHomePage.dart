import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/MyHomePageModel/Body.dart';

import 'package:weather_app/MyHomePageModel/ContainerBg.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    Timer(Duration(milliseconds: 700), () => _animationController.forward());

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, -1),
              end: Offset.zero,
            ).animate(_animationController),
            child: ContainerBg(),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Body(animationController: _animationController),
          ),
        ],
      ),
    );
  }
}
