import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/domain/game_composition_player.dart';
import 'package:my_team/services/composition_engine.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/views/compositions/composition_player.dart';
import 'package:my_team/views/compositions/composition_players.dart';

class Composition extends StatelessWidget {

  final List<GameCompositionPlayer> starters;
  final List<GameCompositionPlayer> subs;


  Composition({this.starters, this.subs});

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
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: CompositionPlayers(
              gameCompositionPlayers: starters,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: subs.map((s) => CompositionPlayer(
              gameCompositionPlayer: s,
            )).toList(),
          )
        ],
      ),
    );
  }
}
