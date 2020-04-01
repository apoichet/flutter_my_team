import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/views/compositions/compositions.dart';
import 'package:my_team/views/home/home.dart';
import 'package:my_team/views/results/results.dart';
import 'package:my_team/views/statistics/statistics.dart';

import 'nav_bar_icon.dart';

class NavBar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

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
            NavBarIcon(pathIcon: 'home_icon', title: 'Accueil', width: 28, height: 28,
                onTap: () => _goTo(Home())),
            NavBarIcon(pathIcon: 'foot_boots_icon', title: 'Statistiques', width: 37, height: 37,
                onTap: () => _goTo(Statistics())),
            NavBarIcon(pathIcon: 'composition_icon', title: 'Compo', width: 30, height: 30,
                onTap: () => _goTo(Compositions())),
            NavBarIcon(pathIcon: 'calendar_icon', title: 'Calendrier', width: 30, height: 30,
                onTap: () => _goTo(Results())),
          ],
        ),
      ),
    );
  }

  void _goTo(Widget page) {
    Navigator.of(context).push(_createRoute(page));
  }

  Route _createRoute(Widget route) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => route,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //No Animation between transition route
        return child;
      },
    );
  }

}


