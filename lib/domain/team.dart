import 'dart:math';

import 'package:my_team/domain/player.dart';

import 'game.dart';

class Team {
  final List<Game> games;
  final List<Player> players;

  final int nbrTeamGoal;
  final int nbrTeamPass;
  final int nbrTeamGame;
  final int teamGameTime;
  final int nbrTeamYellowCard;
  final int maxPlayerGoal;
  final int maxPlayerPass;
  final int maxPlayerGame;
  final int maxPlayerGameTime;
  final int maxPlayerMissingGame;
  final int maxPlayerLateGame;
  final int maxPlayerYellowCard;

  Team({
    this.games,
    this.players,
    this.nbrTeamGoal = 0,
    this.nbrTeamPass = 0,
    this.nbrTeamGame = 0,
    this.teamGameTime = 0,
    this.nbrTeamYellowCard = 0,
    this.maxPlayerGoal = 0,
    this.maxPlayerPass = 0,
    this.maxPlayerGame = 0,
    this.maxPlayerGameTime = 0,
    this.maxPlayerMissingGame = 0,
    this.maxPlayerLateGame = 0,
    this.maxPlayerYellowCard = 0});

  factory Team.fromJson(Map<String, dynamic> json) {
    List<Player> players = (json['players'] as List).map((p) => Player.fromJson(p)).toList();
    //players.forEach((p) => p.buildAvatar());
    List<Game> games = (json['games'] as List).map((g) => Game.fromJson(g)).toList();
    var nbrTeamGoal = players.map((p) => p.nbrGoal).reduce((goal1, goal2) => goal1 + goal2);
    var nbrTeamPass = players.map((p) => p.nbrPass).reduce((pass1, pass2) => pass1 + pass2);
    var nbrTeamGame = games.length;
    var teamGameTime = games.length * 90;
    var nbrTeamYellowCard = players.map((p) => p.nbrYellowCard).reduce((card1, card2) => card1 + card2);
    var maxPlayerGoal = players.map((p) => p.nbrGoal).reduce(max);
    var maxPlayerPass = players.map((p) => p.nbrPass).reduce(max);
    var maxPlayerGame = players.map((p) => p.nbrGame).reduce(max);
    var maxPlayerGameTime = players.map((p) => p.gameTime).reduce(max);
    var maxPlayerMissingGame = players.map((p) => p.nbrMissingGame).reduce(max);
    var maxPlayerYellowCard = players.map((p) => p.nbrYellowCard).reduce(max);
    return Team(
      games: games,
      players: players,
      nbrTeamGoal : nbrTeamGoal,
      nbrTeamPass : nbrTeamPass,
      nbrTeamGame : nbrTeamGame,
      teamGameTime : teamGameTime,
      nbrTeamYellowCard : nbrTeamYellowCard,
      maxPlayerGoal : maxPlayerGoal,
      maxPlayerPass : maxPlayerPass,
      maxPlayerGame : maxPlayerGame,
      maxPlayerGameTime : maxPlayerGameTime,
      maxPlayerMissingGame : maxPlayerMissingGame,
      maxPlayerYellowCard : maxPlayerYellowCard,
    );
  }
}
