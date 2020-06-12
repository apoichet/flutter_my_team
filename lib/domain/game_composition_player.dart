import 'package:fc_parisii/domain/player_game_state.dart';
import 'package:fc_parisii/domain/player_position.dart';

class GameCompositionPlayer {

  final String id;
  final int nbGoal;
  final int nbYellowCard;
  final PlayerPosition position;
  final PlayerGameState state;

  GameCompositionPlayer({
    this.id,
    this.nbGoal = 0,
    this.nbYellowCard = 0,
    this.position,
    this.state
  });

  factory GameCompositionPlayer.fromJson(Map<String, dynamic> json) {
    return GameCompositionPlayer(
        id: json['id'].toString().replaceAll(" ", ""),
        position: playerPositionFrom(json['position']),
        state: playerGameStateFrom(json['state']),
        nbGoal: json['goal'],
        nbYellowCard: json['yellowCard']
    );
  }
}
