import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/theme/colors.dart';

import 'nav_bar_icon.dart';

class _AppNavBarState extends State<AppNavBar> {

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: CustomColors.AppBarBackground,
      child: Container(
        height: 60,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            NavBarIcon(pathIcon: 'home_icon', title: 'Accueil', width: 30, height: 30),
            NavBarIcon(pathIcon: 'foot_boots_icon', title: 'Statistiques', width: 37, height: 37),
            NavBarIcon(pathIcon: 'composition_icon', title: 'Compo', width: 30, height: 30),
            NavBarIcon(pathIcon: 'calendar_icon', title: 'Calendrier', width: 30, height: 30),
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
