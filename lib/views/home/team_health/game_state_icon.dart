import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/domain/game.dart';
import 'package:fc_parisii/domain/game_state.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/route_service.dart';
import 'package:fc_parisii/services/widget_service.dart';
import 'package:fc_parisii/theme/colors.dart';
import 'package:fc_parisii/theme/font_family.dart';
import 'package:fc_parisii/views/results/matchs/result_match_card.dart';

class GameStateIcon extends StatelessWidget {

  final String  letterLostGame = 'D';
  final String letterVictoryGame = 'V';
  final String letterEqualityGame = 'N';
  final String undefinedGame = '-';
  final Game game;

  GameStateIcon(this.game);

  @override
  Widget build(BuildContext context) {
    _GameStateIcon state = _buildGameStateIcon(game.state);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(buildNoAnimationRoute(ResultMatchCard(game)));
      },
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(
            horizontal: getResponsiveWidth(7.0)
          ),
          width: getResponsiveHeight(27.0),
          height: getResponsiveHeight(27.0),
          decoration: BoxDecoration(
              color: state.color,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.8),
                  blurRadius: 6,
                  offset: Offset(
                    0.0, // horizontal, move right 10
                    4.0, // vertical, move down 10
                  ),
                )
              ]
          ),
          child: buildWidgetText(
            fontSize: getResponsiveHeight(18.0),
            text: state.letter,
            family: FontFamily.ARIAL,
            weight: FontWeight.bold,
          )
      ),
    );
  }

  _GameStateIcon _buildGameStateIcon(GameState state) {
    switch(state) {
      case GameState.DEFEAT :
        return _GameStateIcon(
          letter: letterLostGame,
          color: CustomColors.RedDefeatGameState,
        );
      case GameState.DRAW :
        return _GameStateIcon(
          letter: letterEqualityGame,
          color: CustomColors.OrangeDrawGameState,
        );
      case GameState.VICTORY:
        return _GameStateIcon(
          letter: letterVictoryGame,
          color: CustomColors.GreenVictoryGameState,
        );
      default:
        return _GameStateIcon(
          letter: undefinedGame,
          color: CustomColors.GrayUndefinedGameState,
        );
    }
  }

}

class _GameStateIcon {
  final String letter;
  final Color color;
  _GameStateIcon({this.letter, this.color});
}

