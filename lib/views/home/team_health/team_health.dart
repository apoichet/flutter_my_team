import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/game.dart';
import 'package:my_team/domain/game_state.dart';
import 'package:my_team/services/data_service.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/colors.dart';
import 'package:my_team/theme/font_family.dart';

import 'game_state_icon.dart';

class TeamHealth extends StatelessWidget {
  final List<Game> lastGames = getTeam().games.sublist(0, 5);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 1.0),
            child: buildWidgetText(
                text: "Forme du moment",
                family: FontFamily.ARIAL,
                size: 19,
                weight: FontWeight.bold
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: lastGames.map((game) =>
                _buildGameStateIcon(game.state)).toList(),
          )
        ]
    );
  }

   Widget _buildGameStateIcon(GameState state) {
    switch(state) {
      case GameState.DEFEAT :
        return GameStateIconState(
          letter: 'D',
          color: CustomColors.RedDefeatGameState,
        );
      case GameState.DRAW :
        return GameStateIconState(
          letter: 'N',
          color: CustomColors.OrangeDrawGameState,
        );
      case GameState.VICTORY:
        return GameStateIconState(
          letter: 'V',
          color: CustomColors.GreenVictoryGameState,
        );
    }
    return SizedBox.shrink();

  }
}
