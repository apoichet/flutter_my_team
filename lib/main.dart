import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'starter.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
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
