import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class View extends StatelessWidget {

  final Widget body;
  final Widget bottomBar;

  View({
    @required this.body,
    @required this.bottomBar
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: bottomBar,
    );
  }
}
