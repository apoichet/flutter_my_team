import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/game.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

import 'game_state_icon.dart';

class TeamHealth extends StatelessWidget {
  final List<Game> lastGames = getTeam().games
      .where((game) => game.state != null)
      .toList().reversed.toList()
      .sublist(0, 5);
  final String headerText = 'Forme du moment';

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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: lastGames.map((game) =>
                    GameStateIcon(game))
                    .toList()
                    .reversed
                    .toList()
            ),
          )
        ]
    );
  }
}
