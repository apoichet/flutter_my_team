import 'package:flutter/material.dart';

import 'starter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FC Parisii',
        showSemanticsDebugger: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            accentColor: Colors.white
        ),
        home: Starter()
    );
  }
}
