import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/route_service.dart';
import 'package:fc_parisii/theme/colors.dart';
import 'package:fc_parisii/views/compositions/compositions.dart';
import 'package:fc_parisii/views/home/home.dart';
import 'package:fc_parisii/views/results/results.dart';
import 'package:fc_parisii/views/statistics/statistics.dart';

import 'nav_bar_icon.dart';

class NavBar extends StatelessWidget {

  final NavBarEnum navBarEnum;

  NavBar(this.navBarEnum);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: CustomColors.AppBarBackground,
      child: Container(
        height: getResponsiveHeight(55),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            NavBarIcon(pathIcon: 'home_icon', title: 'Accueil',
                select: _isSelected(NavBarEnum.HOME),
                width: 28, height: 28,
                onTap: () => _goTo(Home(), context)),
            NavBarIcon(pathIcon: 'foot_boots_icon', title: 'Statistiques',
                select: _isSelected(NavBarEnum.STATISTICS),
                width: 37, height: 37,
                onTap: () => _goTo(Statistics(players: [],), context)),
            NavBarIcon(pathIcon: 'composition_icon', title: 'Compositions',
                width: 30, height: 30,
                select: _isSelected(NavBarEnum.COMPOSITIONS),
                onTap: () => _goTo(Compositions(), context)),
            NavBarIcon(pathIcon: 'calendar_icon', title: 'Calendrier',
                width: 30, height: 30,
                select: _isSelected(NavBarEnum.CALENDAR),
                onTap: () => _goTo(Results(), context)),
          ],
        ),
      ),
    );
  }

  void _goTo(Widget page, BuildContext context) {
    Navigator.of(context).push(buildNoAnimationRoute(page));
  }

  bool _isSelected(NavBarEnum innerNavBarEnum) {
    return navBarEnum == innerNavBarEnum;
  }
}

enum NavBarEnum {
  HOME, STATISTICS, COMPOSITIONS, CALENDAR
}
