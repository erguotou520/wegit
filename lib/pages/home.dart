import 'package:flutter/material.dart';
import './chats.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final _widgetOptions = [
    new Chats(),
    Text('Index 1: Business'),
    Text('Index 2: School'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(title: Text(""), icon: Icon(Icons.chat), backgroundColor: Colors.white),
          BottomNavigationBarItem(title: Text(""), icon: Icon(Icons.mail), backgroundColor: Colors.white),
          BottomNavigationBarItem(title: Text(""), icon: Icon(Icons.notifications), backgroundColor: Colors.white),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}