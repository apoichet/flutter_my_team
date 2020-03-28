import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

class NextGame extends StatelessWidget {

  final nextGame = getTeam().games.last;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 8,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: buildWidgetText(
                      text: _buildNextGameTitle(),
                      family: FontFamily.ARIAL,
                      size: 19,
                      weight: FontWeight.bold
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: buildWidgetText(
                    text: _buildNextGame(),
                    family: FontFamily.ARIAL,
                    size: 18,
                  ),
                )
              ]
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: SvgPicture.asset(
                'assets/icon/detail_icon.svg',
                fit: BoxFit.fill,
                width: 30,
                height: 30,
                semanticsLabel: 'Nav Bar Icon'),
          ),
        )
      ],
    );
  }

  _buildNextGameTitle() {
    if(nextGame.date.isAfter(DateTime.now())) {
      return "Prochain match";
    }
    return "Dernier match";
  }

  _buildNextGame() {
    String opponent = nextGame.opponent;
    String day = nextGame.date.day.toString().length == 1 ?
    "0" + nextGame.date.day.toString() : nextGame.date.day.toString();
    String month = nextGame.date.month.toString().length == 1 ?
    "0" + nextGame.date.month.toString() : nextGame.date.month.toString();
    return opponent + " le " + day + "/" + month;
  }



}
