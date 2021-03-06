import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/components/background_image.dart';
import 'package:fc_parisii/components/header.dart';
import 'package:fc_parisii/components/menu_toggle.dart';
import 'package:fc_parisii/components/nav_bar/nav_bar.dart';
import 'package:fc_parisii/components/view_scaffold.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/views/results/matchs/result_match.dart';
import 'package:fc_parisii/views/results/ranking/result_ranking.dart';

class Results extends StatefulWidget {

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  final String title = 'Résultats';

  final String imgBackgroundName1 = 'background_12.png';

  final String imgBackgroundName2 = 'background_11.png';

  final String menuTitle1 = 'Matchs';

  final String menuTitle2 = 'Classement';

  bool _toggleLeft;

  @override
  void initState() {
    _toggleLeft = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: _toggleLeft ? imgBackgroundName1 : imgBackgroundName2,
      child: ViewScaffold(
        navBarSelected: NavBarEnum.CALENDAR,
        rightPadding: 0.0,
        leftPadding: 0.0,
        bottomPadding: 8.0,
        header: Header(textHeader: title,
          backgroundColor: _toggleLeft ? Color.fromRGBO(255, 255, 255, 0.45) :
          Color.fromRGBO(255, 255, 255, 0.45),
          leftPadding: getResponsiveWidth(15.0),
          rightPadding: getResponsiveWidth(15.0),),
        body: WidgetToggle(
          callBackParent: _toggle,
          toggleLeft: _toggleLeft,
          rightPadding: 0.0,
          leftPadding: 0.0,
          image1: imgBackgroundName1,
          image2: imgBackgroundName2,
          header: title,
          menuUnderlineColor: Colors.white,
          title1: menuTitle1,
          widget1: ResultMatch(),
          colorDisabledTitle1: Colors.white.withOpacity(0.5),
          colorEnabledTitle1: Colors.white,
          title2: menuTitle2,
          widget2: ResultRanking(),
          colorDisabledTitle2: Colors.white.withOpacity(0.5),
          colorEnabledTitle2: Colors.white,
        ),
      ),
    );
  }

  void _toggle(bool toggleState) {
    setState(() {
      _toggleLeft = toggleState;
    });
  }
}
