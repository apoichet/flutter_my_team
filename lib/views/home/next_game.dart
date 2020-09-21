import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fc_parisii/services/data_service.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/route_service.dart';
import 'package:fc_parisii/services/widget_service.dart';
import 'package:fc_parisii/theme/font_family.dart';
import 'package:fc_parisii/views/results/matchs/result_match_card.dart';

class NextGame extends StatelessWidget {

  final nextGame = getTeam().games.gameList.last;
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
                  'assets/icon/info_icon.svg',
                  height: getResponsiveHeight(35.0),
                  semanticsLabel: 'Info Icon'),
            ),
          )
        ],
      ),
    );
  }
}
