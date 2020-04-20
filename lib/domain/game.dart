import 'package:my_team/domain/game_state.dart';

import 'game_composition_player.dart';
import 'game_composition_strategy.dart';

class Game {

  final String opponent;
  final String address;
  final String stadium;
  final String place;
  final DateTime date;
  final GameState state;
  final GameCompositionStrategy strategy;
  final List<GameCompositionPlayer> gameCompositionPlayers;

  Game({
    this.opponent,
    this.address,
    this.stadium,
    this.state,
    this.strategy,
    this.place,
    this.date,
    this.gameCompositionPlayers
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    List<GameCompositionPlayer> compositionPlayers = (json['gamePlayers'] as List)
        .map((gp) => GameCompositionPlayer.fromJson(gp)).toList();
    return Game(
        opponent: json['opponent'],
        address: json['address'],
        stadium: json['stadium'],
        state: evaluate(json['result']),
        strategy: strategyFrom(json['strategy']),
        place: json['place'],
        date: DateTime.parse(json['date']).toLocal(),
        gameCompositionPlayers: compositionPlayers
    );
  }
}
