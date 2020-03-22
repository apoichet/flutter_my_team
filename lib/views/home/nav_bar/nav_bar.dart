import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'nav_bar_icon.dart';

class _AppNavBarState extends State<AppNavBar> {

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color.fromRGBO(0, 0, 0, 0.3),
      child: Container(
        height: 100,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            NavBarIcon(pathIcon: 'foot_boots_icon', title: 'Statistiques'),
            NavBarIcon(pathIcon: 'composition_icon', title: 'Compo'),
            NavBarIcon(pathIcon: 'calendar_icon', title: 'Calendrier'),
          ],
        ),
      ),
    );
  }

}

class AppNavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppNavBarState();
}
