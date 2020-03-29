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
        height: 55,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            NavBarIcon(pathIcon: 'home_icon', title: 'Accueil', width: 28, height: 28, onTap:() => widget.onTap(0)),
            NavBarIcon(pathIcon: 'foot_boots_icon', title: 'Statistiques', width: 37, height: 37, onTap:() => widget.onTap(1)),
            NavBarIcon(pathIcon: 'composition_icon', title: 'Compo', width: 30, height: 30, onTap:() =>  widget.onTap(2)),
            NavBarIcon(pathIcon: 'calendar_icon', title: 'Calendrier', width: 30, height: 30, onTap:() =>  widget.onTap(3)),
          ],
        ),
      ),
    );
  }

}

class AppNavBar extends StatefulWidget {

  final onTap;

  AppNavBar({this.onTap});

  @override
  State<StatefulWidget> createState() => _AppNavBarState();
}
