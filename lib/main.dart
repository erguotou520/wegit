import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/welcome.dart';
import 'pages/home.dart';

void main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  runApp(new MaterialApp(
    home: token != '' && token != null ? new Home() : new Welcome(),
    routes: {
      '/home': (BuildContext context) => new Home()
    },
  ));
}

