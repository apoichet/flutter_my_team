import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/game.dart';
import 'package:my_team/services/composition_engine.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/views/compositions/composition_players.dart';

class Composition extends StatelessWidget {

  final Game game;

  Composition(this.game);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double compositionWidth = size.width * 0.7;
    double compositionHeight = size.height;
    PlayerPositionEngine engine = new PlayerPositionEngine(
        mapHeight: compositionHeight,
        mapWidth: compositionWidth
    );
    return Padding(
      padding: const EdgeInsets.only(right: 20, bottom: 15, top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: CompositionPlayers(
              gamePlayers: game.gamePlayers,
              playerPositionEngine: engine,
            ),
            width: compositionWidth,
            //TODO fix height
            height: double.infinity,
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.black12.withOpacity(0.7),
                        BlendMode.dstOver),
                    image: new AssetImage(
                        "assets/img/composition.png"
                    ),
                    fit: BoxFit.fill)
            ),
          ),
          RotatedBox(
              quarterTurns: 1,
              child: buildWidgetText(
                  text: ""
              )
          )
        ],
      ),
    );
  }
}
