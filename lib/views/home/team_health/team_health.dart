import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/game.dart';
import 'package:my_team/domain/game_state.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/theme/font_family.dart';

import 'game_state_icon.dart';

class TeamHealth extends StatelessWidget {
  final List<Game> lastGames = getTeam().games.sublist(0, 5);
  final String headerText = 'Forme du moment';
  final letterLostGame = 'D';
  final letterVictoryGame = 'V';
  final letterEqualityGame = 'N';

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
                  _buildGameStateIcon(game.state)).toList(),
            ),
          )
        ]
    );
  }

  Widget _buildGameStateIcon(GameState state) {
    switch(state) {
      case GameState.DEFEAT :
        return GameStateIconState(
          letter: letterLostGame,
          color: CustomColors.RedDefeatGameState,
        );
      case GameState.DRAW :
        return GameStateIconState(
          letter: letterEqualityGame,
          color: CustomColors.OrangeDrawGameState,
        );
      case GameState.VICTORY:
        return GameStateIconState(
          letter: letterVictoryGame,
          color: CustomColors.GreenVictoryGameState,
        );
    }
    return SizedBox.shrink();
  }
}
