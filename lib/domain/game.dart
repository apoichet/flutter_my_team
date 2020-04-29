import 'package:my_team/domain/game_state.dart';
import 'package:my_team/domain/game_type.dart';

import 'game_composition_player.dart';
import 'game_composition_strategy.dart';

class Game {

  final String opponent;
  final String address;
  final String stadium;
  final String place;
  final GameType type;
  final String result;
  final String score;
  final String timeMatch;
  final String timeRdvMatch;
  final DateTime date;
  final GameState state;
  final GameCompositionStrategy strategy;
  final List<GameCompositionPlayer> gameCompositionPlayers;

  String reverseScore() {
    List<String> scoreSplit = this.score.split("");
    var scoreLeft = scoreSplit.first;
    var scoreRight = scoreSplit.last;
    return scoreRight + " - " + scoreLeft;
  }

  bool isAfterNow() {
    return this.date.toLocal().isAfter(DateTime.now().toLocal());
  }

  String getOpponentMatchDay() {
    String opponent = this.opponent;
    String day = this.date.day.toString().length == 1 ?
    "0" + this.date.day.toString() : this.date.day.toString();
    String month = this.date.month.toString().length == 1 ?
    "0" + this.date.month.toString() : this.date.month.toString();
    return opponent + " " + day + "/" + month;
  }

  Game({
    this.opponent,
    this.address,
    this.stadium,
    this.state,
    this.strategy,
    this.place,
    this.result,
    this.score,
    this.type,
    this.date,
    this.timeMatch,
    this.timeRdvMatch,
    this.gameCompositionPlayers
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    List<GameCompositionPlayer> compositionPlayers = (json['gamePlayers'] as List)
        .map((gp) => GameCompositionPlayer.fromJson(gp)).toList();
    return Game(
        opponent: json['opponent'],
        type: fromGameType(json['type']),
        address: json['addressStadium'],
        stadium: json['stadium'],
        state: evaluate(json['result']),
        strategy: strategyFrom(json['strategy']),
        place: json['place'],
        result: json['result'],
        score: json['score'],
        timeMatch: json['timeMatch'],
        timeRdvMatch: json['timeRdvMatch'],
        date: DateTime.parse(json['date']).toLocal(),
        gameCompositionPlayers: compositionPlayers
    );
  }
}
