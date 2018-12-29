import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'views/main.dart';
import 'views/page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final allWhiteTheme = SystemUiOverlayStyle.light
    .copyWith(systemNavigationBarColor: Colors.white, statusBarColor: Colors.white);
  
  @override
  Widget build(BuildContext context) {
    return new AnnotatedRegion<SystemUiOverlayStyle>(
      value: allWhiteTheme,
      child: new  MaterialApp(
        color: Colors.white,
        title: 'Toodoo',
        theme: new ThemeData(
          canvasColor: Colors.white,
          accentColor: Colors.blueAccent,
          primaryColor: Colors.white,
        ),
        home: new MyHomePage(title: 'My Tasks'),
        routes: <String, WidgetBuilder> {
          'Personal': (BuildContext context) => Page(title: 'Personal'),
          'Work': (BuildContext context) => Page(title: 'Work'),
          'Home': (BuildContext context) => Page(title: 'Home'),
        },
      ),
    );
  }
}
