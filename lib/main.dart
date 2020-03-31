import 'package:flutter/material.dart';

import 'views/starter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FC Parisii',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            accentColor: Colors.white
        ),
        home: SafeArea(
            bottom: true,
            top: true,
            child: Starter()
        )
    );
  }
}
