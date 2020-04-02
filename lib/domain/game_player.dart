import 'package:my_team/domain/player_position.dart';

class GamePlayer {

  final String id;
  final String firstName;
  final int nbGoal;
  final int nbYellowCard;
  final PlayerPosition position;

  GamePlayer.name(
      this.id, this.firstName, this.nbGoal, this.nbYellowCard, this.position);
}
