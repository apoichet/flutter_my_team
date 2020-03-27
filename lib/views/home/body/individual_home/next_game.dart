import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/game.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';


class _NextGameState extends State<NextGame> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          buildWidgetText(
              text: "Prochain Match",
              family: FontFamily.ARIAL,
              size: 25,
              weight: FontWeight.bold
          ),
          buildWidgetText(
              text: "Nanterre le 02/03 à Balard",
              family: FontFamily.ARIAL,
              size: 20,
          )
        ]
    );
  }

}

class NextGame extends StatefulWidget {
  final Game lastGame;

  NextGame({this.lastGame});

  @override
  State<StatefulWidget> createState() => _NextGameState();
}
