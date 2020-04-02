import 'package:flutter/widgets.dart';
import 'package:my_team/domain/player_position.dart';

class GamePlayer {

  final String id;
  final String firstName;
  final int nbGoal;
  final int nbYellowCard;
  final PlayerPosition position;

  GamePlayer({
    @required this.id,
    @required this.firstName,
    this.nbGoal = 0,
    this.nbYellowCard = 0,
    @required this.position
  });
}
