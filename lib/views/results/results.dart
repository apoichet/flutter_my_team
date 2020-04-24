import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/menu_toggle.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return MenuToggle(
      image1: "background_14.png",
      image2: "background_13.png",
      header: "Résultats",
      backgroundHeader1: Color.fromRGBO(255, 255, 255, 0.45),
      backgroundHeader2: Color.fromRGBO(255, 255, 255, 0.45),
      menuUnderlineColor: Colors.white,
      menuTitle1: "Matchs",
      widgetMenu1: Container(),
      colorDisabledMenuTitle1: Colors.white.withOpacity(0.5),
      colorEnabledMenuTitle1: Colors.white,
      menuTitle2: "Classement",
      widgetMenu2: Container(),
      colorDisabledMenuTitle2: Colors.white.withOpacity(0.5),
      colorEnabledMenuTitle2: Color.fromRGBO(111, 111, 111, 0.5),
    );
  }
}
