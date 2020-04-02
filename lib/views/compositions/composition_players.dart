import 'package:flutter/widgets.dart';
import 'package:my_team/domain/game_player.dart';
import 'package:my_team/services/composition_engine.dart';

import 'composition_player.dart';

class CompositionPlayers extends StatelessWidget {

  final List<GamePlayer> gamePlayers;
  final PlayerPositionEngine playerPositionEngine;

  CompositionPlayers({
    @required this.gamePlayers,
    @required this.playerPositionEngine
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: gamePlayers.map((gp) => _buildPositionedPlayer(gp)).toList()
    );
  }

  Widget _buildPositionedPlayer(GamePlayer gamePlayer) {
    PlayerPhysicPosition physicPosition = playerPositionEngine
        .buildCompositionPlayerFrom(position: gamePlayer.position);
    return Positioned(
        top: physicPosition.top,
        bottom: physicPosition.bottom,
        left: physicPosition.left,
        right: physicPosition.right,
        child: CompositionPlayer(
          firstName: gamePlayer.firstName,
          nbYellowCard: gamePlayer.nbYellowCard,
          nbGoal: gamePlayer.nbGoal,
          avatar: "avatar.png",
        )
    );
  }

}
