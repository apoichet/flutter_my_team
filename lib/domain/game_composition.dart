import 'package:my_team/domain/game_composition_player.dart';
import 'package:my_team/domain/game_composition_strategy.dart';

class GameComposition {

  final DateTime date;
  final String opponent;
  final GameCompositionStrategy strategy;
  final List<GameCompositionPlayer> gameCompositionPlayers;

  GameComposition({
    this.date,
    this.opponent,
    this.gameCompositionPlayers,
    this.strategy
  });

  factory GameComposition.fromJson(Map<String, dynamic> json) {
    List<GameCompositionPlayer> compositionPlayers = (json['gamePlayers'] as List)
        .map((gp) => GameCompositionPlayer.fromJson(gp)).toList();
    return GameComposition(
      date: DateTime.parse(json['date']).toLocal(),
      opponent: json['opponent'],
      strategy: strategyFrom(json['strategy']),
      gameCompositionPlayers: compositionPlayers
    );
  }
}
