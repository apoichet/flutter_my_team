import 'dart:math';

import 'package:fc_parisii/domain/player.dart';
import 'package:fc_parisii/services/number_service.dart';

import 'game.dart';
import 'games.dart';

class Team {
  final Games games;
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
  final int maxPlayerSubstitute;
  final int maxPlayerStarter;
  final int maxPlayerLateTime;
  final int maxPlayerHurt;
  final int maxPlayerAbsent;
  final int maxPlayerRest;
  final double maxPlayerGoalPerMatch;
  final double maxPlayerPassPerMatch;
  final double maxPlayerDecisivePerMatch;
  final double maxPlayerMinutePerMatch;
  final int maxPlayerGoalOpponent;
  final double maxPlayerGoalOpponentPerMatch;
  final int maxPlayerOpponentGoalPenaltyCollected;
  final int maxPlayerOpponentGoalCornerFreeKickCollected;
  final int maxPlayerCleanSheet;

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
    this.maxPlayerYellowCard = 0,
    this.maxPlayerGoalPerMatch = 0,
    this.maxPlayerPassPerMatch = 0,
    this.maxPlayerDecisivePerMatch = 0,
    this.maxPlayerMinutePerMatch = 0,
    this.maxPlayerStarter = 0,
    this.maxPlayerSubstitute = 0,
    this.maxPlayerLateTime = 0,
    this.maxPlayerHurt = 0,
    this.maxPlayerAbsent = 0,
    this.maxPlayerRest = 0,
    this.maxPlayerGoalOpponent = 0,
    this.maxPlayerGoalOpponentPerMatch = 0,
    this.maxPlayerOpponentGoalPenaltyCollected = 0,
    this.maxPlayerOpponentGoalCornerFreeKickCollected = 0,
    this.maxPlayerCleanSheet = 0
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    List<Player> players = (json['players'] as List).map((p) =>
        Player.fromJson(p)).toList();
    players.forEach((p) => p.buildAvatar());
    players.sort((p1, p2) {
      int lastNameCompare = p1.lastName.compareTo(p2.lastName);
      if(lastNameCompare == 0) {
        return p1.firstName.compareTo(p2.firstName);
      }
      return lastNameCompare;
    });
    List<Game> gameList = (json['games'] as List)
        .map((g) => Game.fromJson(g))
        .toList();
    gameList.sort((g1, g2) => g1.date.compareTo(g2.date));
    var nbrTeamGoal = players.map((p) => p.nbrGoal).reduce((goal1,
        goal2) => goal1 + goal2);
    var nbrTeamPass = players.map((p) => p.nbrPass).reduce((pass1,
        pass2) => pass1 + pass2);
    var nbrTeamGame = gameList.length;
    var teamGameTime = gameList.length * 90;
    var nbrTeamYellowCard = players.map((p) => p.nbrYellowCard).reduce((card1,
        card2) => card1 + card2);
    var maxPlayerGoal = players.map((p) => p.nbrGoal).reduce(max);
    var maxPlayerPass = players.map((p) => p.nbrPass).reduce(max);
    var maxPlayerGame = players.map((p) => p.nbrGame).reduce(max);
    var maxPlayerGameTime = players.map((p) => p.gameTime).reduce(max);
    var maxPlayerMissingGame = players.map((p) => p.nbrMissingGame).reduce(max);
    var maxPlayerYellowCard = players.map((p) => p.nbrYellowCard).reduce(max);
    var maxPlayerLaterGame = players.map((p) => p.nbrLateGame).reduce(max);
    var maxGoalPerMatch = players
        .map((p) => divide(p.nbrGoal, p.nbrGame))
        .reduce(max);
    var maxPassPerMatch = players
        .map((p) => divide(p.nbrPass, p.nbrGame))
        .reduce(max);
    var maxDecisivePerMatch = players
        .map((p) => divide(p.nbrGoal, p.nbrGame) + divide(p.nbrPass, p.nbrGame))
        .reduce(max);
    var maxPlayerMinutePerMatch = players
        .map((p) => divide(p.gameTime, p.nbrGame))
        .reduce(max);
    var maxPlayerSubstitute = players.map((p) => p.nbrSubstitute).reduce(max);
    var maxPlayerStarter = players.map((p) => p.nbrStarter).reduce(max);
    var maxPlayerLateTime = players.map((p) => p.lateTime).reduce(max);
    var maxPlayerHurt = players.map((p) => p.nbrHurt).reduce(max);
    var maxPlayerAbsent = players.map((p) => p.nbrAbsent).reduce(max);
    var maxPlayerRest = players.map((p) => p.nbrRest).reduce(max);
    var maxPlayerGoalOpponent = players.map((p) => p.nbrGoalOpponent).reduce(
        max);
    var maxPlayerGoalOpponentPerMatch = players
        .map((p) => divide(p.nbrGoalOpponent, p.nbrGame))
        .reduce(max);
    var maxPlayerOpponentGoalPenaltyCollected = players.map((p) =>
    p.nbrOpponentGoalPenaltyCollected).reduce(max);
    var maxPlayerOpponentGoalCornerFreeKickCollected = players.map((p) =>
    p.nbrOpponentGoalCornerFreeKickCollected).reduce(max);
    var maxPlayerCleanSheet = players.map((p) => p.nbrCleanSheet).reduce(max);
    return Team(
        games: Games(gameList),
        players: players,
        nbrTeamGoal: nbrTeamGoal,
        nbrTeamPass: nbrTeamPass,
        nbrTeamGame: nbrTeamGame,
        teamGameTime: teamGameTime,
        nbrTeamYellowCard: nbrTeamYellowCard,
        maxPlayerGoal: maxPlayerGoal,
        maxPlayerPass: maxPlayerPass,
        maxPlayerGame: maxPlayerGame,
        maxPlayerGameTime: maxPlayerGameTime,
        maxPlayerMissingGame: maxPlayerMissingGame,
        maxPlayerYellowCard: maxPlayerYellowCard,
        maxPlayerLateGame: maxPlayerLaterGame,
        maxPlayerGoalPerMatch: maxGoalPerMatch,
        maxPlayerPassPerMatch: maxPassPerMatch,
        maxPlayerDecisivePerMatch: maxDecisivePerMatch,
        maxPlayerMinutePerMatch: maxPlayerMinutePerMatch,
        maxPlayerSubstitute: maxPlayerSubstitute,
        maxPlayerStarter: maxPlayerStarter,
        maxPlayerLateTime: maxPlayerLateTime,
        maxPlayerHurt: maxPlayerHurt,
        maxPlayerAbsent: maxPlayerAbsent,
        maxPlayerRest: maxPlayerRest,
        maxPlayerGoalOpponent: maxPlayerGoalOpponent,
        maxPlayerGoalOpponentPerMatch: maxPlayerGoalOpponentPerMatch,
        maxPlayerOpponentGoalPenaltyCollected: maxPlayerOpponentGoalPenaltyCollected,
        maxPlayerOpponentGoalCornerFreeKickCollected: maxPlayerOpponentGoalCornerFreeKickCollected,
        maxPlayerCleanSheet: maxPlayerCleanSheet
    );
  }
}

