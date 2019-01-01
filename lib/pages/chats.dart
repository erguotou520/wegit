import 'package:flutter/material.dart';
import '../service.dart';
import '../models/user.dart';

class Chats extends StatefulWidget {
  Chats({Key key}) : super(key: key);

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  User _me = User.empty();
  final _chats = [];

  @override
  void initState() {
    getMe().then((User me) {
      setState(() {
        _me = me;
      });
    });
    super.initState();
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(_me.username),
        title: Text("Chats"),
      ),
      drawer: Drawer(
        child: Text("data"),
      ),
    );
  }
}