import 'package:flutter/material.dart';

import 'views/starter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Team',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        accentColor: Colors.white,
        primaryColor: Colors.red
      ),
      home: Starter()
    );
  }
}
