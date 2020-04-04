import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
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
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: getResponsiveWidth(8.0)),
                    alignment: Alignment.center,
                    child: buildWidgetText(
                      fontSize: getResponsiveSize(20.0),
                      text: _buildNextGameTitle(),
                      family: FontFamily.ARIAL,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: getResponsiveWidth(8.0)),
                    alignment: Alignment.topCenter,
                    child: buildWidgetText(
                        fontSize: getResponsiveSize(18.0),
                        text: _buildNextGame(),
                        family: FontFamily.ARIAL,
                        weight: FontWeight.bold
                    ),
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
    if(nextGame.date.isAfter(DateTime.now().toLocal())) {
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
    return opponent + " " + day + "/" + month;
  }



}
