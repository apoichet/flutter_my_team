import 'package:my_team/domain/game_player.dart';
import 'package:my_team/domain/game_state.dart';
import 'package:my_team/domain/player_position.dart';

class Game {

  final String opponent;
  final String address;
  final String stadium;
  final String place;
  final DateTime date;
  final GameState state;
  final List<GamePlayer> gamePlayers;

  Game({this.opponent, this.address, this.stadium, this.state, this.place, this.date, this.gamePlayers});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
        opponent: json['opponent'],
        stadium: json['stadium'],
        state: evaluate(json['result']),
        place: json['place'],
        date: DateTime.parse(json['date']),
        gamePlayers: _buildGamePlayers()
    );
  }

  static _buildGamePlayers() {
    return [
      GamePlayer(
          firstName: "Romain",
          position: PlayerPosition.GOAL_KEEPER
      ),
      GamePlayer(
          firstName: "Thomas",
          position: PlayerPosition.LEFT_BACK
      ),
      GamePlayer(
          firstName: "Romain",
          position: PlayerPosition.LEFT_DEFENDER
      ),
      GamePlayer(
          firstName: "Geoffrey",
          position: PlayerPosition.RIGHT_DEFENDER
      ),
      GamePlayer(
          firstName: "Alexandre",
          nbGoal: 1,
          nbYellowCard: 1,
          position: PlayerPosition.RIGHT_BACK
      ),
      GamePlayer(
          firstName: "Olivier",
          nbGoal: 1,
          position: PlayerPosition.DEFENSIVE_MIDFIELDER_LEFT
      ),
      GamePlayer(
          firstName: "Ludovic",
          position: PlayerPosition.DEFENSIVE_MIDFIELDER_RIGHT
      ),
      GamePlayer(
          firstName: "Nicolas",
          position: PlayerPosition.SIDE_MIDFIELDER_LEFT
      ),
      GamePlayer(
          firstName: "Jeremy",
          position: PlayerPosition.SIDE_MIDFIELDER_RIGHT,
          nbYellowCard: 2
      ),
      GamePlayer(
          firstName: "Alexis",
          position: PlayerPosition.FORWARD,
          nbGoal: 4
      ),
      GamePlayer(
          firstName: "Paul",
          position: PlayerPosition.SECOND_TOP,
      )
    ];
  }



}
