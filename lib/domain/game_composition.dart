import 'package:my_team/domain/game_composition_player.dart';

class GameComposition {

  final DateTime date;
  final String opponent;
  final List<GameCompositionPlayer> gameCompositionPlayers;

  GameComposition({
    this.date,
    this.opponent,
    this.gameCompositionPlayers
  });

  factory GameComposition.fromJson(Map<String, dynamic> json) {
    List<GameCompositionPlayer> compositionPlayers = (json['gamePlayers'] as List)
        .map((gp) => GameCompositionPlayer.fromJson(gp)).toList();
    return GameComposition(
      date: DateTime.parse(json['date']),
      opponent: json['opponent'],
      gameCompositionPlayers: compositionPlayers
    );
  }
}
