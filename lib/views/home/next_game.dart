import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/route_service.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';
import 'package:my_team/views/results/matchs/result_match_card.dart';

class NextGame extends StatelessWidget {

  final nextGame = getTeam().games.last;
  final String lastGameText = 'Dernier Match';
  final String nextGameText = 'Prochain Match';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(buildNoAnimationRoute(ResultMatchCard(nextGame)));
      },
      child: Row(
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
                        fontSize: getResponsiveWidth(22.0),
                        text: nextGame.isAfterNow() ? nextGameText : lastGameText,
                        family: FontFamily.ARIAL,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: getResponsiveWidth(8.0)),
                      alignment: Alignment.topCenter,
                      child: buildWidgetText(
                          fontSize: getResponsiveWidth(20.0),
                          text: nextGame.getOpponentMatchDay(),
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
                  height: getResponsiveHeight(30.0),
                  semanticsLabel: 'Nav Bar Icon'),
            ),
          )
        ],
      ),
    );
  }
}
