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
            colorScheme: ColorScheme(
              primary: Colors.white,
              primaryVariant: Colors.white,
              onPrimary: Colors.white,
              brightness: Brightness.dark,
              secondary: Colors.white,
              secondaryVariant: Colors.white,
              background: Colors.transparent,
              onBackground: Colors.transparent,
              error: Colors.red,
              onError: Colors.red,
              onSecondary: Colors.white,
              onSurface: Colors.white,
              surface: Colors.white,
            ),
        ),
        home: Starter()
    );
  }
}
