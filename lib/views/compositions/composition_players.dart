import 'package:flutter/widgets.dart';
import 'package:my_team/domain/game_composition_player.dart';
import 'package:my_team/services/composition_engine.dart';

import 'composition_player.dart';

class CompositionPlayers extends StatelessWidget {

  final List<GameCompositionPlayer> gameCompositionPlayers;
  final PlayerPositionEngine playerPositionEngine;

  CompositionPlayers({
    @required this.gameCompositionPlayers,
    @required this.playerPositionEngine
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: gameCompositionPlayers.map((gp) => _buildPositionedPlayer(gp)).toList()
    );
  }

  Widget _buildPositionedPlayer(GameCompositionPlayer gameCompositionPlayer) {
    PlayerPhysicPosition physicPosition = playerPositionEngine
        .buildCompositionPlayerFrom(position: gameCompositionPlayer.position);
    return Positioned(
        top: physicPosition.top,
        bottom: physicPosition.bottom,
        left: physicPosition.left,
        right: physicPosition.right,
        child: CompositionPlayer(
          gameCompositionPlayer: gameCompositionPlayer,
        )
    );
  }

}
