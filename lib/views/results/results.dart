import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/menu_toggle.dart';
import 'package:my_team/components/nav_bar/nav_bar.dart';
import 'package:my_team/views/results/matchs/result_match.dart';
import 'package:my_team/views/results/ranking/result_ranking.dart';

class Results extends StatefulWidget {

  final String title = 'Résultats';
  final String imgBackgroundName1 = 'background_14.png';
  final String imgBackgroundName2 = 'background_13.png';

  final String menuTitle1 = 'Matchs';
  final String menuTitle2 = 'Classement';

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return MenuToggle(
      navBarSelected: NavBarEnum.CALENDAR,
      rightPadding: 0.0,
      leftPadding: 0.0,
      bottomPadding: 5.0,
      image1: widget.imgBackgroundName1,
      image2: widget.imgBackgroundName2,
      header: widget.title,
      backgroundHeader1: Color.fromRGBO(255, 255, 255, 0.45),
      backgroundHeader2: Color.fromRGBO(255, 255, 255, 0.45),
      menuUnderlineColor: Colors.white,
      menuTitle1: widget.menuTitle1,
      widgetMenu1: ResultMatch(),
      colorDisabledMenuTitle1: Colors.white.withOpacity(0.5),
      colorEnabledMenuTitle1: Colors.white,
      menuTitle2: widget.menuTitle2,
      widgetMenu2: ResultRanking(),
      colorDisabledMenuTitle2: Colors.white.withOpacity(0.5),
      colorEnabledMenuTitle2: Colors.white,
    );
  }
}
