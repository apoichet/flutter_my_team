import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/game.dart';
import 'package:my_team/domain/game_state.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

import 'game_state_icon.dart';

class _TeamHealthState extends State<TeamHealth> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildWidgetText(
              text: "Forme du moment",
              family: FontFamily.ARIAL,
              size: 22,
              weight: FontWeight.bold
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
              _buildGameState([
                GameState.DRAW,
                GameState.VICTORY,
                GameState.VICTORY,
                GameState.VICTORY,
                GameState.DEFEAT,
              ])
            ,
          )
        ]
    );
  }

  _buildGameState(List<GameState> states) {
    var gameStates = <GameStateIcon>[];
    for (final state in states) {
      gameStates.add(GameStateIcon(state: state));
    }
    return gameStates;
  }

}

class TeamHealth extends StatefulWidget {
  final List<Game> lastGames;

  TeamHealth({this.lastGames});

  @override
  State<StatefulWidget> createState() => _TeamHealthState();
}
