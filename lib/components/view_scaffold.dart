import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/nav_bar/nav_bar.dart';
import 'package:my_team/components/view_padding.dart';

class ViewScaffold extends StatelessWidget {

  final Widget child;

  ViewScaffold({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewPadding(
        child: child,
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
