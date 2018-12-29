import 'package:flutter/material.dart';
import 'pages/welcome.dart';
import 'pages/home.dart';

void main() {
  runApp(new MaterialApp(
    home: new Welcome(),
    routes: {
      '/home': (BuildContext context) => new Page3()
    },
  ));
}

