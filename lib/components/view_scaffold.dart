import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/nav_bar/nav_bar.dart';
import 'package:my_team/components/view_padding.dart';

class ViewScaffold extends StatelessWidget {

  final Widget child;
  final double topPadding;
  final double bottomPadding;
  final double leftPadding;
  final double rightPadding;

  ViewScaffold({
    @required this.child,
    this.topPadding = 30.0,
    this.bottomPadding = 30.0,
    this.leftPadding = 15.0,
    this.rightPadding = 15.0
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewPadding(
          child: child,
          topPadding: topPadding,
          bottomPadding: bottomPadding,
          leftPadding: leftPadding,
          rightPadding: rightPadding
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
