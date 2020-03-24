import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/game_state.dart';
import 'package:my_team/theme/colors.dart';

class _GameStateIconState extends State<GameStateIcon> {

  var color;
  var letter;

  @override
  void initState() {
    _getState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 7, right: 7),
      width: 35,
      height: 35,
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Text(
          letter,
          style: Theme.of(context).textTheme.title
      ),
    );
  }

  _getState() {

    switch(widget.state) {

      case GameState.DEFEAT : {
        letter = 'D';
        color = CustomColors.RedDefeatGameState;
        break;
      }
      case GameState.DRAW : {
        letter = 'N';
        color = CustomColors.OrangeDrawGameState;
        break;
      }
      case GameState.VICTORY: {
        letter = 'V';
        color = CustomColors.GreenVictoryGameState;
      }

    }

  }

}

class GameStateIcon extends StatefulWidget {
  final GameState state;

  const GameStateIcon({Key key, @required this.state}) : assert(state != null), super(key: key);

  @override
  State<StatefulWidget> createState() => _GameStateIconState();
}
