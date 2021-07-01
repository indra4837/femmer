import 'dart:async';

import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key key}) : super(key: key);

  DateTime countdown;

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () {
        return Scaffold(
          body: Center(
            child: Text("test"),
          ),
        );
      },
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HomePage(),
      ),
    );
  }
}
