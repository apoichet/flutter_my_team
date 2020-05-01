import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/game.dart';
import 'package:my_team/domain/player_game_state.dart';
import 'package:my_team/services/composition_engine.dart';
import 'package:my_team/views/compositions/composition_player.dart';
import 'package:my_team/views/compositions/composition_players.dart';

class Composition extends StatelessWidget {

  final Game gameComposition;

  Composition({this.gameComposition});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double compositionWidth = size.width * 0.7;
    double compositionHeight = compositionWidth * 445 / 293;
    PlayerPositionEngine engine = new PlayerPositionEngine(
        mapHeight: compositionHeight,
        mapWidth: compositionWidth,
        strategy: gameComposition.strategy
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
              child: Container(
                child: CompositionPlayers(
                  gameCompositionPlayers: gameComposition.gameCompositionPlayers
                      .where((gcp) => gcp.state == PlayerGameState.STARTERS).toList(),
                  playerPositionEngine: engine,
                ),
                width: compositionWidth,
                height: compositionHeight,
                decoration: new BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    image: new DecorationImage(
                        image: new AssetImage(
                            "assets/img/composition.png"
                        ),
                        fit: BoxFit.fill)
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: gameComposition.gameCompositionPlayers
                .where((gcp) => gcp.state == PlayerGameState.SUBSTITUTE)
                .map((gcp) => CompositionPlayer(gameCompositionPlayer: gcp))
                .toList(),
          )
        ],
      ),
    );
  }
}
