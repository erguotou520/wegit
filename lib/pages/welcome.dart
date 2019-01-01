import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import './login.dart';

class Welcome extends StatelessWidget {
  Widget _generatePage (String text) {
    return new Container(
      color: Colors.blue,
      child: new Center(
        child: new Text(text,
          style: new TextStyle(color: Colors.white, fontSize: 40),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Swiper(
        containerWidth: double.infinity,
        containerHeight: double.infinity,
        loop: false,
        itemCount: 3,
        itemBuilder: (BuildContext context1, int index) {
          if (index == 0) {
            return _generatePage('Where we chat');
          } else if (index == 1) {
            return _generatePage('Where we code');
          } else {
            return new Stack(
              children: <Widget>[
                _generatePage('Let\'s login \n and start'),
                new Positioned(
                  left: 0,
                  right: 0,
                  bottom: 48,
                  child: new Center (
                    child: new RaisedButton(
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                      child: new Text('Github', style: new TextStyle(fontSize: 16)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => new Login('github')
                        ));
                      },
                    ),
                  )
                )
              ],
            );
          }
        },
      )
    );
  }
}