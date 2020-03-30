import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/views/home/body/compositions/compositions.dart';
import 'package:my_team/views/home/body/statistics/statistics.dart';
import 'package:my_team/views/home/nav_bar/nav_bar.dart';

import 'body/individual_home/individual_home.dart';

class _HomeState extends State<Home> {

  int currentIndex;

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: <Widget>[
            IndividualHome(),
            Statistics(),
            Compositions(),
            Statistics()
          ],
        ),
        bottomNavigationBar: AppNavBar(onTap: _onTapNavBar)
    );
  }

  _onTapNavBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}
