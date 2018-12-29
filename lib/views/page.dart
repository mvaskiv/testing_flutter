import 'package:flutter/material.dart';

class Page extends StatelessWidget {
  Page({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(title, style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w400, color: Colors.grey.shade700)),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
        centerTitle: false,
        iconTheme: new IconThemeData(color: Colors.grey.shade700, opacity: 0.8),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search),
          )
        ],
        elevation: 0.0,
      ),
      body: new Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 42.0,
                vertical: 32.0,
              ),
              child: new Container(
                child: new Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                      child: Icon(Icons.account_circle, size: 45.0, color: Colors.grey.shade700),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 12.0),
                      child: Text('Hello, Mike.', style: TextStyle(fontSize: 30.0, color: Colors.grey.shade700)),
                    ),
                  Text('Have a nice day', style: TextStyle(color: Colors.grey.shade700)),
                  Text('You have 0 tasks for today', style: TextStyle(color: Colors.grey.shade700)),
                  ],
                )
              )
            ),
          ],
        ),
      ),
    );
  }
}
