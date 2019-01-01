import 'dart:core';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_webview_plugin/src/webview_scaffold.dart';
import 'package:flutter_webview_plugin/src/base.dart';

class Login extends StatelessWidget {
  // @override
  // Widget build(BuildContext context) {
  //   return new Text('123');
  // }
  final String provider;
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  Login(this.provider);
  @override
  Widget build(BuildContext context) {
    flutterWebviewPlugin.onUrlChanged.listen((String url) async {
      // print(url);
      if (url.startsWith('wegit://oauth')) {
        Uri uri = Uri.parse(url);
        final query = uri.queryParameters;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('access_token', query['token']);
        prefs.setString('provider', query['provider']);
        print(query['token']);
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        flutterWebviewPlugin.close();
      }
    });
    return new Scaffold(
      appBar: AppBar(
        title: new Text('${this.provider[0].toUpperCase()}${this.provider.substring(1)} Login'),
      ),
      body: new SafeArea(
        child: new WebviewScaffold(
          url: 'http://192.168.1.8:3001/login/github'
        ),
      )
    );
  }
}