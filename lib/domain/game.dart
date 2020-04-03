import 'package:my_team/domain/game_state.dart';

class Game {

  final String opponent;
  final String address;
  final String stadium;
  final String place;
  final DateTime date;
  final GameState state;

  Game({this.opponent, this.address, this.stadium, this.state, this.place, this.date});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
        opponent: json['opponent'],
        stadium: json['stadium'],
        state: evaluate(json['result']),
        place: json['place'],
        date: DateTime.parse(json['date']),
    );
  }
}
