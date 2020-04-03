import 'package:my_team/domain/player_game_state.dart';
import 'package:my_team/domain/player_position.dart';

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
        id: json['id'],
        position: playerPositionFrom(json['position']),
        state: playerGameStateFrom(json['state']),
        nbGoal: json['goal'],
        nbYellowCard: json['yellowCard']
    );
  }
}
