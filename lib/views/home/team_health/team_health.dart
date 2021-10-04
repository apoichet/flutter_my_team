import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/domain/game.dart';
import 'package:fc_parisii/services/data_service.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/widget_service.dart';
import 'package:fc_parisii/theme/font_family.dart';

import 'game_state_icon.dart';

class TeamHealth extends StatelessWidget {
  final List<Game> lastGames = _getLastGames(getTeam().games.gameList.toList());
  final String headerText = "Forme de l'équipe";

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: buildWidgetText(
                fontSize: getResponsiveHeight(18.0),
                text: headerText,
                family: FontFamily.ARIAL,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: lastGames.isNotEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        lastGames.map((game) => GameStateIcon(game)).toList())
                : SizedBox.shrink(),
          )
        ]);
  }
}

List<Game> _getLastGames(List<Game> games) {
  var gamesWithState = games.where((game) => game.hasState()).toList();
  return gamesWithState.reversed
      .toList()
      .sublist(0, gamesWithState.length <= 4 ? gamesWithState.length : 5);
}
